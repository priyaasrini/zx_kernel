/*
 * zx_system_calls.c
 *
 * File containing defintion of zx_kernel system calls
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

/* ---------------------------------------------------------------*/
/* System calls of zx_kernel */

#include <zx_system_calls.h>
#include <zx_kernel_config.h>
#include <zx_ns.h>
#include <zx_tasks.h>
#include <zx_clock_server.h>
#include <zx_err.h>
#include <zx_uart_io.h>

int Create( int priority, void (*code)() )
{
   __asm__(
		"swi #1 \n\t"
	);
	int result;
	asm("mov %[v], r0" : [v]"=r"(result)); // restoring the result
   return result;
}
/* ---------------------------------------------------------------*/
void Pass()
{
   __asm__(
		"swi #2 \n\t"
	);
}
/* ---------------------------------------------------------------*/
void Exit()
{
   __asm__(
		"swi #3 \n\t"
	);
}
/* ---------------------------------------------------------------*/
int MyTid()
{
   __asm__(
		"swi #4 \n\t"
	);
   int result;
	asm("mov %[v], r0" : [v]"=r"(result)); // restoring the result
   return result;
}
/* ---------------------------------------------------------------*/
int MyParentTid()
{
   __asm__(
		"swi #5 \n\t"
	);
   int result;
	asm("mov %[v], r0" : [v]"=r"(result)); // restoring the result
   return result;;
}

/* ---------------------------------------------------------------*/
int  Send( int tid, void *message, int msglen, void *reply, int replylen )
{
   // SENDING      
   int result;
   
    __asm__(
		"swi #6 \n\t"
	);
	
	asm("mov %[v], r0" : [v]"=r"(result)); // restoring the result

   return result;
}

/* ---------------------------------------------------------------*/

int  Receive( int *tid, void *message, int msglen )
{
    __asm__(
		"swi #7 \n\t"
	);
   int result;
	asm("mov %[v], r0" : [v]"=r"(result)); // restoring the result
   return result;;
}

/* ---------------------------------------------------------------*/
int  Reply( int tid, void *reply, int replylen )
{
    __asm__(
		"swi #8 \n\t"
	);
   int result;
	asm("mov %[v], r0" : [v]"=r"(result)); // restoring the result
   return result;;
}
/* ---------------------------------------------------------------*/
void* Alloc()
{
   __asm__(
		"swi #9 \n\t"
	);
	int result;
	asm("mov %[v], r0" : [v]"=r"(result)); // restoring the result
   return (int*)result;
}
/* ---------------------------------------------------------------*/
/* ---------------------------------------------------------------*/
void Free()
{
   __asm__(
		"swi #10 \n\t"
	);
}


/* ---------------------------------------------------------------*/
int AwaitEvent(int event_number)
{
   __asm__(
		"swi #11 \n\t"
	);
   int result;
	asm("mov %[v], r0" : [v]"=r"(result)); // restoring the result
  return result;
}


/* ---------------------------------------------------------------*/
int Delay(int ticks)
{
   int* clock_server_id_addr = (int*)(CLOCK_SERVER_TID);
   int clock_server_id = *clock_server_id_addr;
   
   zx_time_request request;
   zx_time_request response;

   request.type = API_CS_DELAY; // "Delay" request
   request.value = ticks;    // ticks   

   int result = Send(clock_server_id, &request, sizeof(zx_time_request), &response, sizeof(zx_time_request));
   
   if( result < 0 ) return result;
   
   result = response.value;
   
   if( response.type == MSG_SERVER_EXITED )
   {
      result = ERR_NONEXISTENT_TASK;
   }
      
   return result;
}


/* ---------------------------------------------------------------*/
int Time()
{
   int* clock_server_id_addr = (int*)(CLOCK_SERVER_TID);
   int clock_server_id = *clock_server_id_addr;
   
   zx_time_request request;
   zx_time_request response;

   request.type = API_CS_TIME; // "Time" request
   request.value = 0;    // no args

   int result = Send(clock_server_id, &request, sizeof(zx_time_request), &response, sizeof(zx_time_request));
   
   if( result < 0 ) return result;
   
   result = response.value;
      
   if( response.type == MSG_SERVER_EXITED )
   {
      result = ERR_NONEXISTENT_TASK;
   }
      
   return result;

}


/* ---------------------------------------------------------------*/
int DelayUntil(int ticks)
{
   int* clock_server_id_addr = (int*)(CLOCK_SERVER_TID);
   int clock_server_id = *clock_server_id_addr;
   
   zx_time_request request;
   zx_time_request response;

   request.type = API_CS_DELAY_UNTIL; // "DelayUntil" request
   request.value = ticks;  

   int result = Send(clock_server_id, &request, sizeof(zx_time_request), &response, sizeof(zx_time_request));
   
   if( result < 0 ) return result;
      
   result = response.value;
      
   if( response.type == MSG_SERVER_EXITED )
   {
      result = ERR_NONEXISTENT_TASK;
   }
      
   return result;

}


/* ---------------------------------------------------------------*/


/* ---------------------------------------------------------------*/
int  WhoIs( char* name )
{
   int* ns_id_addr = (int*)(NAME_SERVER_TID);
   int ns_id = *ns_id_addr;
   
   zx_ns_request request;
   zx_ns_request response;

   request.tid = 0; // undefined
   request.type = API_NS_WHOIS; // "Who Is" request
   request.name = name; // name   
 
   Send(ns_id, &request, sizeof(zx_ns_request), &response, sizeof(zx_ns_request));
      
   return response.tid;
}

/* ---------------------------------------------------------------*/
int  RegisterAs( char* name )
{
   int* ns_id_addr = (int*)(NAME_SERVER_TID);
   int ns_id = *ns_id_addr;
   
   zx_ns_request request;
   zx_ns_request response;

   request.tid = MyTid(); 
   request.type = API_NS_REGISTER; // "Register" request
   request.name = name;       

   Send(ns_id, &request, sizeof(zx_ns_request), &response, sizeof(zx_ns_request));
      
   return response.tid;
}

/* ---------------------------------------------------------------*/
int GetC(int channel)
{
   int* uart_server_id_addr;
  
   zx_uart_request request;
   zx_uart_request response;
      
   switch ( channel )
   {
      case COM1:
         uart_server_id_addr = (int*)(UART1_RX_SERVER_TID);
         request.type = API_UART1_GETC;
         break;
               
      case COM2: 
         uart_server_id_addr = (int*)(UART2_RX_SERVER_TID);
         request.type = API_UART2_GETC;
         break;
         
      default:
         return ZXERR_UART_INVALID_CHANNEL;
   }  
  
   int  uart_server_id = *uart_server_id_addr;

   int result = Send(uart_server_id, &request, sizeof(zx_uart_request), &response, sizeof(zx_uart_request));
     
   if( result < 0 ) return result;
      
   if( response.type == MSG_SERVER_EXITED )
   {
      return ERR_NONEXISTENT_TASK;
   }      
      
   if( response.value == UART_RX_ERROR )
   {
      result = RECEIVE_ERROR;
      // and then debug code
   }
   else
   {
      result = response.value;
   }
   
   return result;
}


/* ---------------------------------------------------------------*/
int PutC(int channel, char c)
{
   // TODO : Query the name server to get the transmit server tid
   
   int* uart_server_id_addr;
  
   zx_uart_request request;
   zx_uart_request response;
      
   switch ( channel )
   {
      case COM1:
         uart_server_id_addr = (int*)(UART1_TX_SERVER_TID);
         request.type = API_UART1_PUTC;
         break;
               
      case COM2: 
         uart_server_id_addr = (int*)(UART2_TX_SERVER_TID);
         request.type = API_UART2_PUTC;        
         break;
         
      default:
         return ZXERR_UART_INVALID_CHANNEL;
   }  
  
   int  uart_server_id = *uart_server_id_addr;//  *uart_server_id_addr;
   
    // "PutC" request
   request.value = c;    // no args

   int result = Send(uart_server_id, &request, sizeof(zx_uart_request), &response, sizeof(zx_uart_request));
         
   if( response.type == MSG_SERVER_EXITED )
   {
      return ERR_NONEXISTENT_TASK;
   }      
         
   /* SUCCESSFULLY SENT */
   if( response.value == UART_TX_ERROR )
   {
      //return response.value;
      result = TRANSMISSION_ERROR;
   }
   return result;
}



/* ---------------------------------------------------------------*/

int CreateNameServer()
{
   int tid = Create( ZX_NAME_SERVER_PRIORITY, &zx_name_server );
	//bwprintf( COM2, "Created Name Server: %x\n", tid );
	
	/* save the name server tid	 */
	int* ns_addr = (int*)(NAME_SERVER_TID);		
   *ns_addr = tid;
   
   return tid;
}

/* ---------------------------------------------------------------*/
void  CloseNameServer()
{
   int* ns_id_addr = (int*)(NAME_SERVER_TID);
   int ns_id = *ns_id_addr;
   
   zx_ns_request request;
   zx_ns_request response;

   request.tid = 0; // ignored
   request.type = API_NS_EXIT; // "Exit" request
   request.name = 0; // ignored      
      
   Send(ns_id, &request, sizeof(zx_ns_request), &response, sizeof(zx_ns_request));

   return;
}

/* ---------------------------------------------------------------*/

int CreateClockServer()
{
   int tid = Create( ZX_CLOCK_SERVER_PRIORITY, &zx_clock_server );

//	bwprintf( COM2, "Created Clock Server: %x\n", tid );
	
	/* save the clock server tid */
	int* cs_addr = (int*)(CLOCK_SERVER_TID);		
   *cs_addr = tid;
   
   return tid;
}


/* ---------------------------------------------------------------*/
int  CloseClockServer()
{
   int* cs_id_addr = (int*)(CLOCK_SERVER_TID);
   int cs_id = *cs_id_addr;
   
   zx_time_request request;
   zx_time_request response;

   request.type = API_CS_EXIT; // "Exit" request
   request.value = 0; // ignored      
      
   Send(cs_id, &request, sizeof(zx_time_request), &response, sizeof(zx_time_request));

   return response.value;
}


/* ---------------------------------------------------------------*/

int CreateUARTServers()
{
	int tid;

   /* UART2 Transmit Server */
   tid = Create( ZX_UART2_TX_SERVER_PRIORITY, &zx_uart2_tx_server );
   int* uart_tx_addr = (int*)(UART2_TX_SERVER_TID);		
   *uart_tx_addr = tid;   

   /* UART2 Receive Server */
   tid = Create( ZX_UART2_RX_SERVER_PRIORITY, &zx_uart2_rx_server );
   int* uart_rx_addr = (int*)(UART2_RX_SERVER_TID);		
   *uart_rx_addr = tid;   
   
   /* UART1 Transmit Server */
   tid = Create( ZX_UART1_TX_SERVER_PRIORITY, &zx_uart1_tx_server );
   int *uart1_tx_addr = (int*)(UART1_TX_SERVER_TID);		
   *uart1_tx_addr = tid;   

   /* UART1 Receive Server */
   tid = Create( ZX_UART1_RX_SERVER_PRIORITY, &zx_uart1_rx_server );
   int *uart2_rx_addr = (int*)(UART1_RX_SERVER_TID);		
   *uart2_rx_addr = tid;   
   
   return 0;
}

/* ---------------------------------------------------------------*/
int  CloseUARTServers()
{
//   int* uart_id_addr = (int*)(UART2_RX_SERVER_TID);
//   int uart_id = *uart_id_addr;
   
   zx_uart_request request;
   zx_uart_request response;

   request.type = API_UART_EXIT; // "Exit" request
   request.value = 0; // ignored      

   int *uart1_tx_addr = (int*)(UART1_TX_SERVER_TID);		
   Send( *uart1_tx_addr , &request, sizeof(zx_uart_request), &response, sizeof(zx_uart_request));
   *uart1_tx_addr = INVALID_TASK_ID;    
   
   int *uart1_rx_addr = (int*)(UART1_RX_SERVER_TID);		
   Send( *uart1_rx_addr , &request, sizeof(zx_uart_request), &response, sizeof(zx_uart_request));
   *uart1_rx_addr = INVALID_TASK_ID;   

   int* uart2_tx_addr = (int*)(UART2_TX_SERVER_TID);		
   Send( *uart2_tx_addr , &request, sizeof(zx_uart_request), &response, sizeof(zx_uart_request));
   *uart2_tx_addr = INVALID_TASK_ID;   
      
   int* uart2_rx_addr = (int*)(UART2_RX_SERVER_TID);
   Send( *uart2_rx_addr , &request, sizeof(zx_uart_request), &response, sizeof(zx_uart_request));
   *uart2_rx_addr = INVALID_TASK_ID;   

   return 0;
}

/* ---------------------------------------------------------------*/
void Shutdown()
{
   /* REMOVING SERVERS......................................*/
      
      /* CLOSE NAME_SERVER */
      CloseNameServer();  
      
      /* CLOSE CLOCK_SERVER */  
      int clock_server_time = CloseClockServer();
    
      /* CLOSE UART_SERVERS */
      CloseUARTServers();
 
 
   /* PROFILING............................................*/
   
      /* Get time spent in idle task */
      unsigned int *time = (unsigned int*)(VAR_IDLE_TASK_TIME);
    
      clock_server_time *= 10; //milli seconds
    
      /* Percentage of time spent in idle task */
      int percentage = ((*time)*100)/(clock_server_time);

      /* Print the statistics */
      //int *addr1 = (int*)TEMP_VAR1;
      int *addr2 = (int*)STAT_VAR2;
      
      //*addr1 = clock_server_time;
      *addr2 = percentage;

   __asm__(
		"swi #12 \n\t"
	);
}

/* ---------------------------------------------------------------*/
void Kill( int tid)
{
   __asm__(
		"swi #13 \n\t"
	);
}

/* ---------------------------------------------------------------*/
int DebugManyArgs(int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7)
{
   __asm__(
		"swi #90 \n\t"
	);
   int result;
	asm("mov %[v], r0" : [v]"=r"(result)); // restoring the result
  return result;
}


/* ---------------------------------------------------------------*/
int PutMultiple(int channel, char* array)
{
   int* uart_server_id_addr;
  
   zx_uart_request request;
   zx_uart_request response;
      
   switch ( channel )
   {
      case COM1:
         uart_server_id_addr = (int*)(UART1_TX_SERVER_TID);
         request.type = API_UART1_PUT_MULTIPLE;
         break;
               
      case COM2: 
         uart_server_id_addr = (int*)(UART2_TX_SERVER_TID);
         request.type = API_UART2_PUT_MULTIPLE;        
         break;
         
      default:
         return ZXERR_UART_INVALID_CHANNEL;
   }  
  
   int  uart_server_id = *uart_server_id_addr;//  *uart_server_id_addr;
   
    // "PutMultiple" request
   request.value = (int)array;    // pointer to the array
      
   int result = Send(uart_server_id, &request, sizeof(zx_uart_request), &response, sizeof(zx_uart_request));
      
   if( response.type == MSG_SERVER_EXITED )
   {
      return ERR_NONEXISTENT_TASK;
   }            
      
      /* SUCCESSFULLY SENT */
   if( response.value == UART_TX_ERROR )
   {
      //return response.value;
      
   }
   
   return result;
}

