/*
 * zx_clock_server.c
 *
 * Contains tree data structures for Name Server
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /*
  * For DEFINITIONS used in this file, see zx_tasks.h
  */
  
 #include <bwio.h>
 
 #include <zx_system_calls.h>
 #include <zx_kernel_config.h>
 #include <zx_irq.h>
 #include <zx_tasks.h>
 #include <zx_uart_server.h>
    
#define FOREVER for(;;)

void zx_uart2_rx_notifier()
{
   zx_uart_request reply;

   int server_tid;
   zx_uart_request req;

   zx_uart_request uart_response;

   /* Receive from clock server */
   Receive(&server_tid, &req, sizeof(zx_uart_request));

   /* reply to the clock server */
   req.type = UART_REQUEST_READY;
   Reply(server_tid, &req, sizeof(zx_uart_request));   

   /* send to the clock server */
   req.type = UART_REQUEST_READY;
   
   bwprintf(COM2, "UART notifier: Sending to the UART server... \n");   
   Send(server_tid, &req, sizeof(req), &reply, sizeof(zx_uart_request));
   bwprintf(COM2, "UART notifier: Sent to the UART server. \n");   
   
   /* set the type to TICK to all the responses in the FOREVER loop */
   uart_response.type = API_UART2_GETC;

   bwprintf(COM2, "UART notifier: Ready. \n");  

   /* initialization of hardware (clock) */
   zx_device_init(INTR_SOURCE_UART2_RX);   
//   zx_device_init(INTR_SOURCE_UART2_TX);   
   
   FOREVER{
//      bwprintf(COM2, "UART notifier: Starting Await... \n");
      int result = AwaitEvent(EVENT_UART2_RX);
      bwprintf(COM2, "UART notifier: Got it!!! %d \n", result);

      
      bwprintf(COM2, "UART notifier: Ended Await. Sending... \n");
//      bwprintf(COM2, "Clock notifier: Sent!\n");      
      Send(server_tid, &uart_response, sizeof(zx_uart_request), &reply, sizeof(zx_uart_request));   
//      bwprintf(COM2, "Clock notifier: Received. \n");      
      
      if (reply.type == API_UART_EXIT)
      {
         zx_device_free(INTR_SOURCE_UART2_RX);
         break;
      }
      
      bwprintf(COM2, "Clock notifier: Received. \n");
   }
   
   bwprintf(COM2, "UART notifier: Exiting...\n");  
   Exit();
}

void zx_uart2_rx_server()
{ 
   bwprintf(COM2, "UART server: Starting... \n");

   int notifier_tid = Create(ZX_UART_NOTIFIER_PRIORITY, &zx_uart2_rx_notifier);
   zx_uart_request req;
   zx_uart_request res;
   
   bwprintf(COM2, "UART server: Notifier's task id: %d. \n", notifier_tid);      
   RegisterAs("zx_uart_server");

   /* send to the notifier */
   req.type = UART_REQUEST_CONFIG;
   Send(notifier_tid, &req, sizeof(zx_uart_request), &res, sizeof(zx_uart_request));  
   
   bwprintf(COM2, "UART server: Sent to the notifier and received the response. \n");
   
    
   if (res.type != UART_REQUEST_READY)
   {
      bwprintf(COM2, "UART server: The notifier is not ready. Aborting... \n");
      Exit();
   }
   
   int tid;
   
   /* receive from the notifier */
 //  bwprintf(COM2, "UART server: Receiving from the notifier... \n");
   Receive(&tid, &res, sizeof(zx_uart_request));
   if (tid != notifier_tid || res.type != UART_REQUEST_READY)
   {
      bwprintf(COM2, "UART server: The notifier is not ready or wrong task. Aborting... \n");
      Exit();
      return;
   }
   
   /* reply to the notifier */  
   req.type = UART_REQUEST_READY;   
   Reply(notifier_tid, &req, sizeof(zx_uart_request));

//   bwprintf(COM2, "UART server: Replied to the notifier. \n");   
   
//   bwprintf(COM2, "UART server: Ready. \n");     
   
   int to_exit = 0;
   int exit_task_tid = INVALID_TASK_ID;
   
   /* Runs till the end of the universe of the kernel does not crash */
   FOREVER // while not exited
   {
      Receive(&tid, &res, sizeof(zx_uart_request));
//      bwprintf(COM2, "Clock server: Received!\n");
      
      if (tid == notifier_tid) // if heard from the notifier
      {      
      
         if (to_exit == 0)
         {
            res.type = UART_REQUEST_READY;
            Reply(notifier_tid, &res, sizeof(zx_uart_request));
         }
         else
         {
            res.type = API_UART_EXIT;
            Reply(notifier_tid, &res, sizeof(zx_uart_request));
            
            break;
         }  

      }
      else // proibably heard from a client
      {
      
         if (to_exit == 1) // if asked to exit already, then continue and wait 
            continue;     
      
         int value;
      
         switch (res.type)
         {
            case API_UART2_GETC:

               bwprintf(COM2, "GetC: %d.\n", tid);
               break;               

            case API_UART_EXIT:
               to_exit = 1;
               exit_task_tid = tid;               
               Reply(exit_task_tid, &res, sizeof(res));
               break;   
         }
         
      }
   }
   
   if (exit_task_tid == INVALID_TASK_ID)
   {
      bwprintf(COM2, "UART server: exit_task_tid is invalid");
      Exit();
   }

   bwprintf(COM2, "UART server: Exiting...");      

   Exit();
   
}

