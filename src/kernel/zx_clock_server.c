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
 #include <zx_irq_device.h>
 #include <zx_irq_vic.h>
 #include <zx_tasks.h>
 #include <zx_clock_server.h>
 #include <zx_clockserver_heap.h>
 #include <zx_timer.h>
 
 #include <zx_err.h>
    
#define FOREVER for(;;)

void zx_clock_notifier()
{
   zx_time_request reply;

   int server_tid;
   zx_time_request req;

   zx_time_request time_response;

   /* Receive from clock server */
   Receive(&server_tid, &req, sizeof(zx_time_request));

   /* reply to the clock server */
   req.type = TIME_REQUEST_READY;
   Reply(server_tid, &req, sizeof(zx_time_request));   

   /* send to the clock server */
   req.type = TIME_REQUEST_READY;
     
   Send(server_tid, &req, sizeof(req), &reply, sizeof(zx_time_request));  
   
   /* set the type to TICK to all the responses in the FOREVER loop */
   time_response.type = TIME_REQUEST_TICK;

   /* initialization of hardware (clock) */
   zx_device_init   (INTR_SOURCE_TIMER_1);   
   zx_device_intr_on(INTR_SOURCE_TIMER_1);
   FOREVER{
   
      AwaitEvent(EVENT_TIMER);
      Send(server_tid, &time_response, sizeof(zx_time_request), &reply, sizeof(zx_time_request));  
      
      if (reply.type == API_CS_EXIT)
      {
         zx_timer_disable( IRQ_TIMER );
         break;
      }
   }
   Exit();
}

void zx_clock_server()
{
   unsigned int time ;
   
   /* Clock server Heap Variables */   
   zx_clockserver_heap_node clock_server_heap[TASK_COUNT];
   int end_node_index;
   
   /* Initialize the heap that we will be using */
   zx_clockserver_heap_init( &clock_server_heap[0], TASK_COUNT, &end_node_index);
   
//   bwprintf(COM2, "Clock server: Starting... \n");

   int notifier_tid = Create(ZX_CLOCK_NOTIFIER_PRIORITY, &zx_clock_notifier);
   zx_time_request req;
   zx_time_request res;
   
//   bwprintf(COM2, "Clock server: Notifier's task id: %d. \n", notifier_tid);      
   RegisterAs("zx_clock_server");

   /* send to the notifier */
   req.type = TIME_REQUEST_CONFIG;
   Send(notifier_tid, &req, sizeof(zx_time_request), &res, sizeof(zx_time_request));  
   
//   bwprintf(COM2, "Clock server: Sent to the notifier and received the response. \n");
   
    
   if (res.type != TIME_REQUEST_READY)
   {
      Exit();
   }
   
   int tid;
   
   /* receive from the notifier */
   Receive(&tid, &res, sizeof(zx_time_request));
   if (tid != notifier_tid || res.type != TIME_REQUEST_READY)
   {
      Exit();
      return;
   }
   
   /* reply to the notifier */  
   req.type = TIME_REQUEST_READY;   
   Reply(notifier_tid, &req, sizeof(zx_time_request));
   
   time = 0;  
   
   int to_exit = 0;
   int exit_task_tid = INVALID_TASK_ID;
   
   /* Runs till the end of the universe of the kernel does not crash */
   FOREVER // while not exited
   {
      Receive(&tid, &res, sizeof(zx_time_request));
      
      if (tid == notifier_tid) // if heard from the notifier
      {      
      
         if (to_exit == 0)
         {
            res.type = TIME_REQUEST_READY;
            Reply(notifier_tid, &res, sizeof(zx_time_request));
         }
         else
         {
            res.type = API_CS_EXIT;
            Reply(notifier_tid, &res, sizeof(zx_time_request));
            zx_empty_heap_and_notify_client_tasks( clock_server_heap , &end_node_index);
            break;
         }  
         
         time++;
      }
      else // proibably heard from a client
      {
      
         if (to_exit == 1) // if asked to exit already, then continue and wait 
         {
            res.type  = MSG_SERVER_EXITED;
            res.value = 0;
            Reply(tid, &res, sizeof(zx_time_request)); 
         }         
      
         int value;
      
         switch (res.type)
         {
            case API_CS_DELAY:
               value = time + res.value;
               zx_clockserver_heap_insert(clock_server_heap, &end_node_index, tid, value);
               break;               
            case API_CS_TIME: 
               res.value = time;
               Reply(tid, &res, sizeof(res));
               break;
            case API_CS_DELAY_UNTIL:
               zx_clockserver_heap_insert(clock_server_heap, &end_node_index, tid, res.value);  
               break;
            case API_CS_EXIT:
               to_exit = 1;
               exit_task_tid = tid; 
               res.value = time;               
               Reply(exit_task_tid, &res, sizeof(res));
               break;   
         }
         
      }
      
      //GET THE NODE WITH LEAST WAKE UP TIME
      zx_clockserver_heap_node* node = &clock_server_heap[0];
      
      if (node->tid != INVALID_TASK_ID)
      {     
         if (time >= node->wake_up_time)
         {
            res.type = TIME_REQUEST_READY;
            res.value = time;

            Reply(node->tid, &res, sizeof(res));
               
            zx_clockserver_heap_remove(clock_server_heap, &end_node_index);   
         }  
      }  
   }
   
   if (exit_task_tid == INVALID_TASK_ID)
   {
      Exit();
   }
    

   Exit();
   
}

void zx_empty_heap_and_notify_client_tasks(zx_clockserver_heap_node clock_server_heap[], int *end_node_index)
{
   //GET THE NODE WITH LEAST WAKE UP TIME
   zx_clockserver_heap_node* node = &clock_server_heap[0];
   
   zx_time_request res;
   
   while (node->tid != INVALID_TASK_ID)
   {     
     res.type  = MSG_SERVER_EXITED;
     res.value = 0;

     Reply(node->tid, &res, sizeof(res));
      
     zx_clockserver_heap_remove(clock_server_heap, end_node_index);   
   }  
}

