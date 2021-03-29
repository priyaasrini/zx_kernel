/*
 * zx_uart1_transmit_server.c
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
  
/* Name of the server : zx_uart1_tx_server */
void zx_uart1_tx_server()
{

   /* Our transmit buffer*/
   zx_circular_queue   transmit_queue_uart1;   
   zx_circular_queue*  transmit_queue_uart1_ptr;   
   transmit_queue_uart1_ptr = &transmit_queue_uart1;       
   char transmit_queue_array[ZX_UART1_TX_BUFFER_SIZE];  
   
   /* Initialize this array */
   int i=0;
   for( i=0; i<ZX_UART1_TX_BUFFER_SIZE; i++ )
   {
      transmit_queue_array[i]=0;
   }
   
   /* Initilializing transmit buffer */
   /* 1 is size of character */
   zx_queue_initialize( &transmit_queue_uart1_ptr, transmit_queue_array, 1, ZX_UART1_TX_BUFFER_SIZE);
   
   char byte;
   char *byteptr = &byte;

   /* Create notifier for this server */
   int notifier_tid = Create(ZX_UART1_TX_NOTIFIER_PRIORITY, &zx_uart1_tx_notifier);

   int tid = INVALID_TASK_ID;
      
   zx_uart_request req;
   zx_uart_request res;
   
   RegisterAs("zx_uart1_tx_server");   

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
   
   int notifier_ready_flag = 0;
   int result; 
   
   char* source;
   
   int sensor_dump = 0;
   
   /* Runs till the end of the universe of the kernel does not crash */
   FOREVER 
   {
       /* Wait for a request to transmit or signal to transmit from the notifier*/
       Receive(&tid, &res, sizeof(zx_uart_request));  
       
       /* heard from notifier - signal to trasnmit */
       if (tid == notifier_tid)
       {   
           if (to_exit == 0)
           {
               /* Send the byte */
               
               result = zx_queue_remove( &transmit_queue_uart1_ptr, byteptr);
               if ( result == ZX_Q_SUCCESS )
               {
                  /* We had a byte in XMIT queue */
                  /* Send this byte to notifier to send it to the respective COM */
                  res.type  = UART_WRITE_BYTE;
                  res.value = byte;
                  Reply(notifier_tid, &res, sizeof(zx_uart_request));                  
               }
               else if( sensor_dump )
               {
                  /* We had a byte in XMIT queue */
                  /* Send this byte to notifier to send it to the respective COM */
                  sensor_dump = 0;
                  res.type  = UART_WRITE_BYTE;
                  res.value = 133;
                  Reply(notifier_tid, &res, sizeof(zx_uart_request));     
               }
               else
               {
                 /* We will not reply to notifier now  because the 
                     queue is empty */                   
                  notifier_ready_flag = 1;
               }
            }
            else
            {
               /* Time to exit from the server */
               res.type = API_UART_EXIT;
               Reply(exit_task_tid, &res, sizeof(zx_uart_request));
               Reply(notifier_tid, &res, sizeof(zx_uart_request));
               notifier_ready_flag = 1;
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
              case API_UART1_PUTC:
                /* Read the byte from value and add it to the queue */
                byte = res.value;
               
                if( notifier_ready_flag )
                {                                    
                   /* Reply to Notifier */
                   res.type  = UART_WRITE_BYTE;
                   res.value = byte;
                   Reply(notifier_tid, &res, sizeof(zx_uart_request));
                   
                   
                   /* The notifier already had informed us */
                   res.type = UART_TX_SUCCESS;
                   Reply(tid, &res, sizeof(zx_uart_request));
                   
                   /* Reset the flag */
                   notifier_ready_flag = 0;
                }
                else
                {
                   if( byte == 133 )
                   {
                     sensor_dump = 1;
                     res.type = UART_TX_SUCCESS;
                   }
                   else
                   {
                      result = zx_queue_insert( &transmit_queue_uart1_ptr, (void*)byteptr); 
                      
                      /* Reply message for clients */
                      if( result == ZX_ERR_QUEUE_FULL )
                      {
                        res.type = UART_TX_ERROR;
                      }
                      else
                      {
                        res.type = UART_TX_SUCCESS;
                      }
                   }
                   Reply(tid, &res, sizeof(zx_uart_request));
                }
                
                break;    
                           
              case API_UART1_PUT_MULTIPLE:
                /* Read all the bytes from the packet and add them to the queue */

                source = (char*)(res.value);
                
                if (*source == UART_PACKET_END_CHAR) // empty packet
                {
                   res.type = UART_TX_SUCCESS;
                   Reply(tid, &res, sizeof(zx_uart_request));
                   break; // resume the loop
                }                
                                
                if( notifier_ready_flag ) // if we can put the first character already
                {
                   byte = *source;
                                     
                   /* Reply to Notifier */
                   res.type  = UART_WRITE_BYTE;
                   res.value = byte; // sending the first byte from the packet
                   Reply(notifier_tid, &res, sizeof(zx_uart_request));
                   
                   source++; // increment the source
                   /* Reset the flag */
                   notifier_ready_flag = 0;
                }
                
                while (*source != UART_PACKET_END_CHAR)
                {
                   byte = *source;
                   result = zx_queue_insert( &transmit_queue_uart1_ptr, (void*)byteptr); 
                      
                   /* Reply error message for clients */
                   if( result == ZX_ERR_QUEUE_FULL )
                   {
                     res.type = UART_TX_ERROR;
                     Reply(tid, &res, sizeof(zx_uart_request));
                     break;
                   }                
                
                   source++;
                }
                
                res.type = UART_TX_SUCCESS;
                Reply(tid, &res, sizeof(zx_uart_request));
                
                break;  
              case API_UART_EXIT:
                /* A special task which runs when the kernel shutsdown 
                   requests the server to shutdown its services and 
                   exit clean
                 */
                to_exit = 1;
                exit_task_tid = tid;  
                Reply(tid, &res, sizeof(zx_uart_request));     
                
                if( notifier_ready_flag )
                {
                  res.type = API_UART_EXIT;
                  Reply(notifier_tid, &res, sizeof(zx_uart_request));   
                } 
                        
                break;   
           }
       }
       if (to_exit == 1 && notifier_ready_flag)
       {
          break;
       } 
    }
    Exit();
}

/* Notifier which notifies UART1 TRANSMIT SERVER */
void zx_uart1_tx_notifier()
{
   /* local variables */
   zx_uart_request reply;
   zx_uart_request req;
   zx_uart_request uart_response;

   int server_tid;
   
   char byte = 0;

//   int* var = (int*)(DEBUG_VAR_2);
//   *var = 0;
   
   /* Receive from UART1 Transmit Server */
   Receive(&server_tid, &req, sizeof(zx_uart_request));
   
   /* Reply back to the UART1 transmit server */
   req.type = UART_REQUEST_READY;
   Reply(server_tid, &req, sizeof(zx_uart_request)); 
   
   /* Send to the UART1 transmit server */
   req.type = UART_REQUEST_READY;
   Send(server_tid, &req, sizeof(req), &reply, sizeof(zx_uart_request));
   
   /* set the type to API_UART1_PUTC to all the responses in the FOREVER loop */
   uart_response.type = API_UART1_PUTC;   
   
   zx_device_init(INTR_SOURCE_UART1_MODEM);



   FOREVER{
                    
      /* Waiting for the event to occur */
      AwaitEvent(EVENT_UART1_TX);
                
      /* Request data from server */          
      Send(server_tid, &uart_response, sizeof(zx_uart_request), &reply, sizeof(zx_uart_request));

      if (reply.type == API_UART_EXIT)
      {
         break;
      }
      else if( reply.type == UART_WRITE_BYTE )
      {
         byte = reply.value;
         zx_write_byte( COM1, byte );
//         if (byte == 0)
//         {
//            *var = Time(); 
//         }
      }
      else
      {  
         // error
         // we expect only these replies      
      } 
   }
   Exit();
}
   
