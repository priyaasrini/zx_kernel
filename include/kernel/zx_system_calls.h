/*
 * zx_system_calls.h
 *
 * Contains defintions & signatures related to system calls 
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

#ifndef ZX_SYSTEM_CALLS
#define ZX_SYSTEM_CALLS

   #define SWI_NONE 0
   #define SWI_CREATE_TASK 1
   #define SWI_PASS        2
   #define SWI_EXIT        3
   #define SWI_MYTID       4
   #define SWI_MYPTID      5
   #define SWI_SEND        6
   #define SWI_RECEIVE     7
   #define SWI_REPLY       8
   #define SWI_ALLOC       9
   #define SWI_FREE        10   
   #define SWI_AWAIT_EVENT 11   
   #define SWI_SHUTDOWN    12 
   #define SWI_KILL        13

   #define DEBUG_SWI_MANYARGS 90
   
   #define HWI             100
   
   #define SWI_ERROR       255

   #define EVENT_TIMER  1
   
   #define EVENT_UART1_RX  2
   #define EVENT_UART1_TX  3
   #define EVENT_UART2_RX  4
   #define EVENT_UART2_TX  5   
   
   #define EVENT_UART1_TRANSMIT_ANYINTR 6
   #define EVENT_UART1_TRANSMIT_MODEM   7 
   
   /* System call Signatures */
   int   MyParentTid();
   int   MyTid();
   void  Exit();
   int   Create( int priority, void (*zx_task)() );
   void  Pass();
   int   Send( int tid, void *message, int msglen, void *reply, int replylen );
   int   Receive( int *tid, void *message, int msglen );
   int   Reply( int tid, void *reply, int replylen );  
   void* Alloc();
   void  Free();
   
   int  WhoIs( char* name );
   int  RegisterAs( char* name );   
   
   int AwaitEvent(int event_number);
   void Shutdown();
   void Kill(int);

   /* Initialization routines */
   void   zx_kernel_init(int arg);
   int    DebugManyArgs(int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7);
   
   /* not system calls, but should be put here: */   
   int   CreateNameServer();
   void  CloseNameServer();
   int   CloseClockServer();
   int   CreateClockServer();   

   int   CreateUARTServers();
   int   CloseUARTServers();

   
   int Delay(int ticks);
   int Time();
   int DelayUntil(int ticks);   
   
   
   int PutC(int channel, char c);
   int GetC(int channel);
   
   int PutMultiple(int channel, char* array);   
      
   /* Debug routines */
   

#endif /* ZX_SYSTEM_CALLS */

