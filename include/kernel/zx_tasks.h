/*
 * zx_tasks.h
 * Defines data structures needed to task creation and running
 *
 * Task Descriptor : Structure which stores information about the tasks
 * 
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#ifndef ZX_TASKS
#define ZX_TASKS

    #include "zx_memory.h"
    #include "zx_kernel_config.h"
    #include "zx_timer.h"
    #include "zx_clockserver_heap.h"

    typedef struct task_descriptor {
      
         int tid;          // taskid
         int pid;          // parent task id
         int state;        // state of the task
         int priority;     // task priority

         int *stack_base;   // stack base
         int *stack_limit;  // stack limit
         int *sp;           // stack pointer
         int spsr;         // saved program status register
         int return_value; // return value
         
         zx_heap_chunk* heap_head; // heap head
         zx_heap_chunk* heap_tail; // heap tail
         
               
    } zx_td;

   /*  ---------------------------------------------------------------------- */
   /*  --  Definitions common to all TASKs -- */   
   /*  ---------------------------------------------------------------------- */
 
       #define TASK_STATE_READY  0
       #define TASK_STATE_ACTIVE 1
       #define TASK_STATE_ZOMBIE 2
       
       #define TASK_STATE_RECEIVE_BLOCKED 3
       #define TASK_STATE_SEND_BLOCKED    4
       #define TASK_STATE_REPLY_BLOCKED   5
       #define TASK_STATE_EVENT_BLOCKED   6

       #define TASK_NORMAL_CPSR 0x00000010
       #define TASK_NONINTERRUPTABLE_CPSR (TASK_NORMAL_CPSR | (1 << 7))
       
       #define R0_INIT_VAL 0x00000000
       #define R1_INIT_VAL 0x11111111
       #define R2_INIT_VAL 0x22222222
       #define R3_INIT_VAL 0x33333333
       #define R4_INIT_VAL 0x44444444
       #define R5_INIT_VAL 0x55555555
       #define R6_INIT_VAL 0x66666666
       #define R7_INIT_VAL 0x77777777
       #define R8_INIT_VAL 0x88888888
       #define R9_INIT_VAL 0x99999999
       
       #define R10_INIT_VAL 0xAAAAAAAA
       #define R11_INIT_VAL 0xBBBBBBBB
       #define R12_INIT_VAL 0xCCCCCCCC
       // ---R13 is stack pointer ----
       #define R14_INIT_VAL 0x00000000 // link register
       // ---R15 is program counter --

       #define TASK_NO_RETURN_VALUE       (-2)        

       #define INVALID_TASK_ID            (-1)  

       #define TASK_ARRAY_INDEX_PART_SIZE 8
       #define TASK_ARRAY_INDEX_PART_MASK 0x0000003f   
       
       #define GENERATION_NUMBER_MASK      0xffffff00
       #define ARRAY_INDEX_MASK            0x000000ff

   /*  ---------------------------------------------------------------------- */
   /*  --  Definitions common to First User Task -- */   
   /*  ---------------------------------------------------------------------- */   
       #define FIRST_USER_TASK_PRIORITY   20

       // definitions of priorities of clock and uart servers and notifiers    

       #define ZX_CLOCK_NOTIFIER_PRIORITY 2
       #define ZX_CLOCK_SERVER_PRIORITY 3

       #define ZX_UART1_TX_NOTIFIER_PRIORITY 0
       #define ZX_UART1_TX_SERVER_PRIORITY 1

       #define ZX_UART1_RX_NOTIFIER_PRIORITY 0
       #define ZX_UART1_RX_SERVER_PRIORITY 1

       #define ZX_UART2_TX_NOTIFIER_PRIORITY 4
       #define ZX_UART2_TX_SERVER_PRIORITY 5

       #define ZX_UART2_RX_NOTIFIER_PRIORITY 6
       #define ZX_UART2_RX_SERVER_PRIORITY 7
    
       #define ZX_NAME_SERVER_PRIORITY 10    
    
   /*  ---------------------------------------------------------------------- */
   /*  --  Definitions for IDLE TASK -- */   
   /*  ---------------------------------------------------------------------- */
   /*  We have fixed ID for idle task */
   /*  This is for profiling purpose.
       For more information, look at the zx_get_next_request_fucntion
       Generation number of TASK ID always has to start from 0
    */
       #define IDLE_TASK_TID      48 
       /*(TASK_COUNT-1)*/
       #define IDLE_TASK_PRIORITY (PRIORITY_COUNT-1)
       #define IDLE_TASK           zx_idle 
       #define IDLE_TASK_TIMER     TIMER_2   
   
   /*  100 is for buffer. Becuase the clock rewinds once it counts to zero and 
       we dont want that to happen. The idle task is gauranteed to be interrupted
       atleast once in 10 ms, which is ONE_TICK. 
    */
       #define IDLE_TASK_TIMER_INIT_VAL (ONE_TICK+100)
      
       void   zx_idle();
       void   truly_idle_();
   
    
   /*  ---------------------------------------------------------------------- */
   /*  --  Definitions for CLOCK Notifier TASK -- */   
   /*  ---------------------------------------------------------------------- */
       
       
       #define TIME_REQUEST_NONE 0
       #define TIME_REQUEST_READY 1
       #define TIME_REQUEST_TICK 2

   /*  ---------------------------------------------------------------------- */
   /*  --  Definitions for CLOCK Server TASK -- */   
   /*  ---------------------------------------------------------------------- */       
       #define API_CS_UNSUPPORTED 0
       #define API_CS_DELAY 1
       #define API_CS_DELAY_UNTIL 2
       #define API_CS_TIME 3
       #define API_CS_EXIT 4

       #define TIME_REQUEST_CONFIG 1
       
       //defined in zx_err.h
       //#define CLOCK_SERVER_EXIT
       
       void zx_clock_server();
       void zx_empty_heap_and_notify_client_tasks(zx_clockserver_heap_node[], int*);

       typedef struct {
          int type;
          int value;
       } zx_time_request;
       

   /*  ---------------------------------------------------------------------- */
   /*  --  Definitions for UART Notifier TASK -- */   
   /*  ---------------------------------------------------------------------- */
       
       #define UART_REQUEST_NONE 0
       #define UART_REQUEST_READY 1
       #define UART_REQUEST_TICK 2
       

   /*  ---------------------------------------------------------------------- */
   /*  --  Definitions for UART Server and Notifier TASKS -- */   
   /*  ---------------------------------------------------------------------- */       
       #define API_UART_UNSUPPORTED 0
       #define API_UART1_GETC  1
       #define API_UART1_PUTC  2
       #define API_UART2_GETC  3
       #define API_UART2_PUTC  4
       #define API_UART_EXIT   5
      
       // for packet sending
       #define API_UART1_PUT_MULTIPLE 8       
       #define API_UART2_PUT_MULTIPLE 9       
             
       #define UART_WRITE_BYTE 6

       #define UART_REQUEST_CONFIG 1
       
       #define UART_TX_ERROR       257
       #define UART_TX_SUCCESS     258
       
       #define UART_RX_ERROR       257       
       #define UART_RX_SUCCESS     258
       
       #define ZX_UART2_TX_BUFFER_SIZE 1200
       #define ZX_UART2_RX_BUFFER_SIZE 100
       #define ZX_UART1_TX_BUFFER_SIZE 400
       #define ZX_UART1_RX_BUFFER_SIZE 100
               
       #define ZXERR_UART_INVALID_CHANNEL -1

       // end of packet signal for packet       
       #define UART_PACKET_END_CHAR 255
       
       void zx_uart2_tx_server();
       void zx_uart2_tx_notifier();
       void zx_uart2_rx_server();
       void zx_uart2_rx_notifier();  
       
       void zx_uart1_tx_notifier();
       void zx_uart1_tx_server();     
       void zx_uart1_rx_server();
       void zx_uart1_rx_notifier();  

       typedef struct {
          int  type;
          int value;
       } zx_uart_request;
       
       typedef struct {
          int  type;
          char value;
       } zx_uart2_request;       
       
      
#endif /* ZX_TASKS */

