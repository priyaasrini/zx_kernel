/* 
 * zx_kernel_config.h
 *
 * Kernel Configuration
 *
 * Things to remember:
 * 1. Stack grows downwards
 * 2. Idle Task created with pre-defined task ID (in zx_tasks.h) during
 *    kernel initilialization
 */
 
/* Note :
 * The Memory layout has been designed to grow upwards. 
 * The addresses grow from MEMORY_BASE towards MEMORY_END
 *
 * But remember that inside a user stack space, the addresses
 * grow downwards. So the stack base and stack limit should be
 * appropriately filled. The stack limit will have lower address
 * and the stack base will have higher address
 */


#ifndef ZX_KERNELCONFIG
#define ZX_KERNEL_CONFIG

#define KB 1024

#define SWI_VECTOR             0x08
#define IRQ_VECTOR             0x18

#define PRIORITY_COUNT         32
#define TASK_COUNT             64

#define START_TID              0

#define MEMORY_BASE            0x00044f88
#define MEMORY_END             0x01fdd000

/* All sizes in terms of bytes */
#define KERNEL_CODE_SIZE               ( 128 * KB)
#define GLOBAL_VARIABLES_SPACE_SIZE    ( 2 * KB )

#define TASK_STACK_SPACE_SIZE          ( 400 * KB)

#define READY_QUEUE_HEADER_SPACE_SIZE  ( PRIORITY_COUNT * 4 ) // four bytes for each pointer
#define READY_QUEUE_SPACE_SIZE          ( 768 ) // 12 bytes per ready_queue node, 64 nodes utmost in whole of the queue
#define RECEIVE_QUEUE_HEADER_SPACE_SIZE ( TASK_COUNT * 4 ) //head pointer or tail pointer for each task
#define RECEIVE_QUEUE_SPACE_SIZE        ( TASK_COUNT * 16 ) // 64 nodes per task, 64 tasks , each node of 16 bytes
#define TASK_DESCRIPTOR_SPACE_SIZE      ( 64 * 64 ) // Assuming each task descriptor is 64 bytes and utmost 64 tasks

#define GLOBAL_VARIABLES_BASE     (MEMORY_BASE + KERNEL_CODE_SIZE)

#define READY_QUEUE_HEADER_BASE   (GLOBAL_VARIABLES_BASE + GLOBAL_VARIABLES_SPACE_SIZE)
#define READY_QUEUE_BASE          (READY_QUEUE_HEADER_BASE + READY_QUEUE_HEADER_SPACE_SIZE) 

#define RECEIVE_QUEUE_HEAD_HEADER_BASE (READY_QUEUE_BASE + READY_QUEUE_SPACE_SIZE)
#define RECEIVE_QUEUE_TAIL_HEADER_BASE (RECEIVE_QUEUE_HEAD_HEADER_BASE + RECEIVE_QUEUE_HEADER_SPACE_SIZE)
#define RECEIVE_QUEUE_BASE             (RECEIVE_QUEUE_TAIL_HEADER_BASE + RECEIVE_QUEUE_HEADER_SPACE_SIZE)

#define TASK_DESCRIPTOR_BASE      (RECEIVE_QUEUE_BASE + RECEIVE_QUEUE_SPACE_SIZE)
#define USER_STACK_SPACE_BASE     (TASK_DESCRIPTOR_BASE + TASK_DESCRIPTOR_SPACE_SIZE)


#define TD_BIT_DATA            (GLOBAL_VARIABLES_BASE + 0x4) // 64-bit data, long long

#define ACTIVE_TASK_ID         (GLOBAL_VARIABLES_BASE + 0xC)
#define PRIORITY_BIT_DATA      (GLOBAL_VARIABLES_BASE + 0x10)
#define REQUEST_STRUCTURE      (GLOBAL_VARIABLES_BASE + 0x14) // Be careful when you set next offet since the request structure occupies 32 bytes

#define NAME_SERVER_TID        (GLOBAL_VARIABLES_BASE + 0x14 + 32) // name server

#define STAT_VAR1              (GLOBAL_VARIABLES_BASE + 0x14 + 36) // temporary, for statistics

#define STAT_VAR2              (GLOBAL_VARIABLES_BASE + 0x14 + 40) // temporary, for statistics

#define AWAIT_TIMER_TID           (GLOBAL_VARIABLES_BASE + 0x14 + 44) // TID of the task event-blocked waiting for the timer notification


#define AWAIT_UART1_TX_TID        (AWAIT_TIMER_TID + 4) // TID of the task event-blocked waiting for the UART1X notification

#define AWAIT_UART1_RX_TID        (AWAIT_UART1_TX_TID + 4) // TID of the task event-blocked waiting for the UART1R notification

#define AWAIT_UART2_TX_TID        (AWAIT_UART1_RX_TID + 4) // TID of the task event-blocked waiting for the UART2X notification

#define AWAIT_UART2_RX_TID        (AWAIT_UART2_TX_TID + 4) // TID of the task event-blocked waiting for the UART2R notification


#define CLOCK_SERVER_TID           (AWAIT_UART2_RX_TID + 4) // TID of the clock server

#define UART1_TX_SERVER_TID        (CLOCK_SERVER_TID    + 4) // TID of the clock server
#define UART1_RX_SERVER_TID        (UART1_TX_SERVER_TID + 4) // TID of the clock server
#define UART2_TX_SERVER_TID        (UART1_RX_SERVER_TID + 4) // TID of the clock server
#define UART2_RX_SERVER_TID        (UART2_TX_SERVER_TID + 4) // TID of the clock server

#define VAR_IDLE_TASK_TIME      ( UART2_RX_SERVER_TID + 4 ) // stores time spent in idle task

#define VAR_MODEM_CTS_ON        ( VAR_IDLE_TASK_TIME + 4 ) // stores time spent in idle task
#define VAR_OLD_UART1_FLAG      ( VAR_MODEM_CTS_ON + 4 )
#define VAR_TXFE_ON             ( VAR_OLD_UART1_FLAG + 4 )

#define DEBUG_VAR_BASE                 (VAR_TXFE_ON + 4 ) // starting debug variables 65000

// missing interrupts:
 
#define DEBUG_VAR_MISSED_INTR_CLOCK             (DEBUG_VAR_BASE + 0x0 )
#define DEBUG_VAR_MISSED_INTR_UART1_TX          (DEBUG_VAR_BASE + 0x4 )
#define DEBUG_VAR_MISSED_INTR_UART1_RX          (DEBUG_VAR_BASE + 0x8 )
#define DEBUG_VAR_MISSED_INTR_UART2_TX          (DEBUG_VAR_BASE + 0xC)
#define DEBUG_VAR_MISSED_INTR_UART2_RX          (DEBUG_VAR_BASE + 0x10) 


#define DEBUG_VAR_10          (DEBUG_VAR_BASE + 0x14) 
#define DEBUG_VAR_20          (DEBUG_VAR_BASE + 0x18) 
#define DEBUG_VAR_30          (DEBUG_VAR_BASE + 0x1C) 
#define DEBUG_VAR_40          (DEBUG_VAR_BASE + 0x20) 

// For dynamic memory allocation
#define HEAP_SIZE              (TASK_STACK_SPACE_SIZE / 4)

/* One tick is 10 ms - Clock 508 KHZ */
#define ONE_TICK              (5080)
/* One ms - Clock 508 KHZ */
#define ONE_MILLISECOND_TICK  (508)


#endif /* ZX_KERNEL_CONFIG */
