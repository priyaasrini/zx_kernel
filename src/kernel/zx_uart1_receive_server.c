/*
 * zx_uart1_receive_server.c
 *
 * Contains tree data structures for Name Server
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /*
  * For DEFINITIONS used in this file, see zx_tasks.h
  */
  
 #include <ts7200.h>
 
 #include <zx_system_calls.h>
 #include <zx_kernel_config.h>
 #include <zx_irq_device.h>
 #include <zx_irq_vic.h>
 #include <zx_tasks.h>
 #include <zx_queue.h>
 #include <zx_helper.h>
 #include <zx_uart_io.h>
 #include <zx_err.h>
 
/* Notifier which notifies UART1 TRANSMIT SERVER */
void zx_uart1_rx_notifier()
{
   /* local variables */
   zx_uart_request reply;
   zx_uart_request req;
   zx_uart_request uart_response;

   int server_tid;
   
   char byte = 0;
   
   /* Receive from UART1 Transmit Server */
   Receive(&server_tid, &req, sizeof(zx_uart_request));
   
   /* Reply back to the UART1 transmit server */
   req.type = UART_REQUEST_READY;
   Reply(server_tid, &req, sizeof(zx_uart_request)); 
   
   /* Send to the UART1 transmit server */
   req.type = UART_REQUEST_READY;
   Send(server_tid, &req, sizeof(req), &reply, sizeof(zx_uart_request));
   
   /* set the type to API_UART1_PUTC to all the responses in the FOREVER loop */
   uart_response.type = API_UART1_GETC;   

   FOREVER{
            
                  
//      zx_printf( COM2, "Reached here:%d\n", byte);          
            
      /* Waiting for the event to occur */
      byte = AwaitEvent(EVENT_UART1_RX);
                              
//      zx_printf( COM2, "Interrupt:%d\n", byte);
      
      uart_response.value = byte;
      
      Send(server_tid, &uart_response, sizeof(zx_uart_request), &reply, sizeof(zx_uart_request));

      if (reply.type == API_UART_EXIT)
      {
         break;
      }  
   }
   Exit();
}

/* Name of the server : zx_uart1_rx_server */
void zx_uart1_rx_server()
{ 
   /* ------------------------------------------------------------------*/
   /* Our receive buffer*/
   zx_circular_queue   receive_buffer_uart1;   
   zx_circular_queue*  receive_buffer_uart1_ptr;   
   receive_buffer_uart1_ptr = &receive_buffer_uart1;       
   char receive_buffer_array[ZX_UART1_RX_BUFFER_SIZE];  
      
   /* Initialize this array */
   int i=0;
   for( i=0; i<ZX_UART1_RX_BUFFER_SIZE; i++ )
   {
      receive_buffer_array[i]=0;
   }
   
   /* Initilializing receive buffer */
   /* 1 is size of character */
   zx_queue_initialize( &receive_buffer_uart1_ptr, receive_buffer_array, 1, ZX_UART1_RX_BUFFER_SIZE);
   
   /* -------------------------------------------------------------------*/
   
   /* Tasks Queue */
   zx_circular_queue   recieve_tasks_queue_uart1;   
   zx_circular_queue*  recieve_tasks_queue_uart1_ptr;  
    
   recieve_tasks_queue_uart1_ptr = &recieve_tasks_queue_uart1;       
   int recieve_tasks_queue_array[TASK_COUNT]; // for now

   i=0;
   for( i=0; i<TASK_COUNT; i++ )
   {
      recieve_tasks_queue_array[i]=INVALID_TASK_ID;
   }

   /* Initilializing queue of tasks waiting to receive */
   /* 4 is size of integer */
   zx_queue_initialize( &recieve_tasks_queue_uart1_ptr, recieve_tasks_queue_array, 4, TASK_COUNT);
   
   /* -------------------------------------------------------------------*/   
   
   /* Create notifier for this server */
   int notifier_tid = Create(ZX_UART1_RX_NOTIFIER_PRIORITY, &zx_uart1_rx_notifier);

   int tid = INVALID_TASK_ID;
      
   zx_uart_request req;
   zx_uart_request res;
   
   RegisterAs("zx_uart1_rx_server");   

   /* send to the notifier */
   req.type = UART_REQUEST_CONFIG;
   Send(notifier_tid, &req, sizeof(zx_uart_request), &res, sizeof(zx_uart_request));
     
   if (res.type != UART_REQUEST_READY)
   {
      Exit();
   }
   
   /* receive from the notifier */
   Receive(&tid, &res, sizeof(zx_uart_request));
   if (tid != notifier_tid || res.type != UART_REQUEST_READY)
   {
      Exit();
      return;
   }
   
   /* reply to the notifier */  
   req.type = UART_REQUEST_READY;   
   Reply(notifier_tid, &req, sizeof(zx_uart_request));
   
   int to_exit = 0;
   int exit_task_tid = INVALID_TASK_ID;
  
   int result; 
   
   int clientid = 0;
   int* clientid_ptr = &clientid;
   
   char byte;
   char *byteptr = &byte;
   
   FOREVER 
   {
       /* Wait for a request to receive from the notifier or request from the client*/
       Receive(&tid, &res, sizeof(zx_uart_request));  
              
       /* heard from notifier - signal to receive */
       if (tid == notifier_tid)
       { 
           if (to_exit == 0)
           {
               /* read the byte */
               byte = res.value;
               
               /* Reply to the notifier */
               Reply(tid, &res, sizeof(zx_uart_request));

               /* Send the byte if there is a task waiting */
               result = zx_queue_remove( &recieve_tasks_queue_uart1_ptr, clientid_ptr);
               if ( result == ZX_Q_SUCCESS )
               {
                  /* We have a client waiting for a byte */
                  res.type  = UART_RX_SUCCESS;
                  res.value = byte;
                  Reply(clientid, &res, sizeof(zx_uart_request)); 
               }
               else
               {
                  /* We dont have any task waiting. So queue the character in the buffer */
                  result = zx_queue_insert( &receive_buffer_uart1_ptr, (void*)byteptr); 
                  /* Reply message for clients */
                  if( result == ZX_ERR_QUEUE_FULL )
                  {
                     zx_printf( COM2, "UART1 Receive Server Error : Buffer Full\n");
                  }
               }
            }
            else
            {
               /* Time to exit from the server */
               res.type = API_UART_EXIT;
               Reply(exit_task_tid, &res, sizeof(zx_uart_request));
               Reply(notifier_tid, &res, sizeof(zx_uart_request));
               
               /* Send the response to all tasks that are waiting */               
               while ((result = zx_queue_remove( &recieve_tasks_queue_uart1_ptr, clientid_ptr)) == ZX_Q_SUCCESS)
               {
                  /* We have a client waiting for a byte */
                  res.type  = MSG_SERVER_EXITED;
                  res.value = 0;
                  Reply(clientid, &res, sizeof(zx_uart_request)); 
               }   
               
               break;
            }            
       }
       /* heard from client - request to transmit */  
       else 
       {
           /* if asked to exit already, then continue and wait */
           if (to_exit == 1) 
           {
               res.type  = MSG_SERVER_EXITED;
               res.value = 0;
               Reply(tid, &res, sizeof(zx_uart_request)); 
           }         
      
           switch (res.type)
           {
              case API_UART1_GETC:
                  /* Is there any byte in the buffer? */
                  result = zx_queue_remove( &receive_buffer_uart1_ptr, byteptr);
                  if ( result == ZX_Q_SUCCESS )
                  {                 
                     /* We have a byte */
                     res.type  = UART_RX_SUCCESS;
                     res.value = byte;
                     Reply(tid, &res, sizeof(zx_uart_request)); 
                  }
                  else
                  {
                     /* We dont have any character in buffer */
                     /* Queue the task */
                     clientid = tid;
                     result = zx_queue_insert( &recieve_tasks_queue_uart1_ptr, clientid_ptr); 
                     /* Reply message for clients */
                     if( result == ZX_ERR_QUEUE_FULL )
                     {
                        res.type  = UART_RX_ERROR;
                        Reply(tid, &res, sizeof(zx_uart_request)); 
                        zx_printf( COM2, "UART1 Receive Server Error : Tasks Queue Full\n");
                     }
                  }
                  break;               

              case API_UART_EXIT:
                /* A special task which runs when the kernel shutsdown 
                   requests the server to shutdown its services and 
                   exit clean
                 */
                to_exit = 1;
                exit_task_tid = tid;  
                Reply(tid, &res, sizeof(zx_uart_request));             
                break;   
           }
       }
    }
    Exit();
}
