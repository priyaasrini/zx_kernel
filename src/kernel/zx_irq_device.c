/*
 * zx_irq.c
 *
 * File containing device specific IRQ routines
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

#include <ts7200.h>
#include <zx_uart_io.h>
#include <zx_irq_device.h>
#include <zx_irq_vic.h>
#include <zx_kernel_config.h>
#include <zx_tasks.h>
#include <zx_helper.h>
#include <zx_ready_queue.h>
#include <zx_timer.h>


/* 
 * Initialization of the device to use it before
 * enabling the interrupts from the device
 * We do not switch on the interrupts in device here. 
 * This is just for initializing the device
 *
 * This function should be called just before the 
 * forever loop of the notifier
 *
 * Remember this is interrupt specific initialization
 */
void zx_device_init( int device_number)
{
   switch( device_number )
   {
      case INTR_SOURCE_TIMER_1:
      
         //somebody might have already switched it on :) 
         zx_timer_disable( IRQ_TIMER ); 
         
         zx_timer_load_val( IRQ_TIMER, ONE_TICK );
         zx_timer_set_periodic( IRQ_TIMER, ON );            
         zx_timer_select_clock( IRQ_TIMER, TIMER_508KHZ_CLKSEL_MASK ); 
         zx_timer_enable( IRQ_TIMER );
         break;
         
      case INTR_SOURCE_UART1_MODEM:
         zx_init_modem_intr();
         break;
     
      case INTR_SOURCE_UART2_RX:
      case INTR_SOURCE_UART1_RX:
      case INTR_SOURCE_UART1_TX:
      default :
         break;
   }
}

/*
   Initialize the data required for the UART1 and MDOEM interrupts: 
   CTS state, old flags state and TXFE state
*/

void zx_init_modem_intr()
{
   // set addresses
   int* uart_flag_addr = (int*)VAR_OLD_UART1_FLAG;
   int* cts_addr       = (int*)VAR_MODEM_CTS_ON;
   int* txfe_addr      = (int*)VAR_TXFE_ON;
   
   // get current UART1 flags
   int *uart1_flags =    (int*)( UART1_BASE + UART_FLAG_OFFSET);
   
   // set everything
   *uart_flag_addr     = *uart1_flags;
   *cts_addr           = (*uart1_flags) & 0x01;
   *txfe_addr          = 0;
} 

/* Turn off the interrupt of all devices */
void zx_device_intr_disable_all()
{
   zx_device_intr_off( INTR_SOURCE_TIMER_1 );
   zx_device_intr_off( INTR_SOURCE_UART1_TX );
   zx_device_intr_off( INTR_SOURCE_UART1_MODEM );
   zx_device_intr_off( INTR_SOURCE_UART2_TX );
   zx_device_intr_off( INTR_SOURCE_UART1_RX );
   zx_device_intr_off( INTR_SOURCE_UART2_RX );  
}

/*
   Clear Interrupt lines of all devices
 */
void zx_device_intr_clear_all()
{
   zx_device_intr_clear( INTR_SOURCE_TIMER_1 );
   zx_device_intr_clear( INTR_SOURCE_UART1_TX );
   zx_device_intr_clear( INTR_SOURCE_UART1_MODEM );
   zx_device_intr_clear( INTR_SOURCE_UART2_TX );
   zx_device_intr_clear( INTR_SOURCE_UART1_RX );
   zx_device_intr_clear( INTR_SOURCE_UART2_RX );
}

/* 
   This function is used to clear the interrupt we
   received from the device. Each device when on
   generating an interrupt, sets a bit in the
   corresponding interrupt status register. The bit
   needs to cleared for some interrupts before 
   receiving and processing the next interrupt
 */
void zx_device_intr_clear( int device_number)
{
   int *addr;
   switch( device_number )
   {
      case INTR_SOURCE_TIMER_1:
         addr = (int*)(TIMER_1 + TIMER_CLEAR_OFFSET);
         *addr = 121112121; 
         break;
         
     /* This interrupt is cleared automatically
        when we read the character 
      */
      case INTR_SOURCE_UART2_RX:
      case INTR_SOURCE_UART1_RX:
         break;


     /* These interrupts are  cleared automatically
        when a character is transmitted 
      */
      case INTR_SOURCE_UART1_TX:
      case INTR_SOURCE_UART2_TX:
         break;
         
      case INTR_SOURCE_UART1_MODEM:
         addr  = (int*)(UART1_STATUS);
         *addr = (*addr) & (~MIS_MASK); 
         break;
   }
}

/* 
 * Turning off the interrupts from the devices
 */
void zx_device_intr_off( int device_number )
{
   int *addr;
   int value;
   
   switch( device_number )
   {
      case INTR_SOURCE_TIMER_1:
         zx_vic_disable_interrupt(device_number);
         break;
         
      case INTR_SOURCE_UART1_RX:
         addr = (int*)(UART1_CONTROL);
         value = *addr;
         *addr = (value & (~RIE_MASK)); 
         break;

      case INTR_SOURCE_UART2_RX:
         addr = (int*)(UART2_CONTROL);
         value = *addr;
         *addr = (value & (~RIE_MASK)); 
         break;
         
/* ----------- UART1 TRANSMIT ----------------*/
      case INTR_SOURCE_UART1_TX:
         addr = (int*)(UART1_CONTROL);
         value = *addr;
         *addr = (value & (~TIE_MASK)); 
         break;
         
      case INTR_SOURCE_UART1_MODEM:
         addr  = (int*)(UART1_CONTROL);
         value = *addr;
         *addr = (value & (~MIE_MASK));
         break;
/* -----------------------------------------*/
         
      case INTR_SOURCE_UART2_TX:
         addr = (int*)(UART2_CONTROL);
         value = *addr;
         *addr = (value & (~TIE_MASK));  
         break; 
   }            
}

/* 
 * Turning on interrupts from devices
 */
 
 void zx_device_intr_on( int device_number )
{
   int *addr;
   int value;
   
   switch( device_number )
   {
      case INTR_SOURCE_TIMER_1:
         zx_vic_enable_interrupt(device_number);
         break;
         
      case INTR_SOURCE_UART1_RX:
         addr = (int*)(UART1_CONTROL);
         value = *addr;
         *addr = (value | RIE_MASK); 
         break;

      case INTR_SOURCE_UART2_RX:
         addr = (int*)(UART2_CONTROL);
         value = *addr;        
         *addr = (value | RIE_MASK); 
         break;
         
/* ----------- UART1 TRANSMIT ----------------*/
      case INTR_SOURCE_UART1_TX:
         addr = (int*)(UART1_CONTROL);
         value = *addr;
         *addr = (value | TIE_MASK); 
         break;
         
      case INTR_SOURCE_UART1_MODEM:
         addr = (int*)(UART1_CONTROL);
         value = *addr;
         *addr = (value | MIE_MASK);
         break;
/* -----------------------------------------*/

      case INTR_SOURCE_UART2_TX:
         addr = (int*)(UART2_CONTROL);
         value = *addr;
         *addr = (value | TIE_MASK);          
         break;
   }
}

/* ----------------------------------------------------------------*/
/*                INTERRUPT HANDLING ROUTINES                      */
/* ----------------------------------------------------------------*/

/*
 * Handling an interrupt from the timer
 * TODO Need to speak with Alex : Instructor hardware interrupt
 * handler returns nothing
 */
void zx_handle_timer_interrupt(int make_default)
{ 
   int tid;
 
   int* addr = (int*)(AWAIT_TIMER_TID);         
   tid = *addr;      
   
   if (tid == INVALID_TASK_ID)
   {
      int *temp_addr = (int*)(DEBUG_VAR_MISSED_INTR_CLOCK );   
      *temp_addr = *temp_addr + 1; 
      return;
   }

   zx_td* td = zx_get_td(tid);
   
   td->state = TASK_STATE_READY;   
      
   if (make_default == 1)
   {
      td->return_value = -1;
   }
   else
   {
      td->return_value = 0;
   }
   zx_q_append_to_end( tid, td->priority );
   
   /* resetting the task id */
   addr = (int*)(AWAIT_TIMER_TID); 
   *addr = INVALID_TASK_ID;
   
   if( !make_default )
      zx_device_intr_on(INTR_SOURCE_TIMER_1);   
}

/*
 * Handling UART1 transmit interrupt. This is a special case
 * where we are waiting for 2 different interrupts to start 
 * the transmission
 */
 
void zx_handle_uart1_transmit_interrupt(int source, int make_default)
{
   // getting required addresses
   int* uart_flag_addr  = (int*)VAR_OLD_UART1_FLAG;
   int* cts_addr        = (int*)VAR_MODEM_CTS_ON;
   int* txfe_addr       = (int*)VAR_TXFE_ON;
   
   // defining variables for uart1 and modem data
   int old_uart_flag;
   int cts;      
   int txfe;

   int *uart1_flags = (int*)( UART1_BASE + UART_FLAG_OFFSET);

   int new_uart_flag;

   cts = *cts_addr;
   txfe = *txfe_addr; 
   
   /* Force the handler to awake the transmit task */
   if( make_default == 1 )
   {
      cts = 1;
   }

   switch(source)
   {
      case INTR_SOURCE_UART1_TX:
      // if we got the TXFE interrupt
      
         zx_device_intr_off(source); // switch TXFE interrupt off
         
         txfe = 1;            // set TXFE to 1
         *txfe_addr = txfe;   // and store it at the address
         break;

      case INTR_SOURCE_UART1_MODEM:
      // if we got the modem interrupt 
        
         // clearing modem interrupt has been done before
         // we are losing interrupts if we clear it here
         // because the modem interrupts are very fast
         
         
         old_uart_flag = *uart_flag_addr;
         new_uart_flag = *uart1_flags; 
         
         // check if CTS has been switched from 0 to 1
         if (((old_uart_flag &  0x1) == 0) && ((new_uart_flag &  0x1) == 1))
         { 
   	      cts = 1;	// if yes, set the switch to 1
         }   
         else
         {
            cts = 0; // if not, switch to 0
         }
         
         *uart_flag_addr = new_uart_flag; // store new values of flags
         *cts_addr = cts;                 // and cts switch
         
         break;
      /*------------------------------------------------*/   
   }

   // if not both cts and txfe 
   if (!((cts == 1) && (txfe == 1)))
      return; // the exit
      
   // if we entered here, it means all the conditions for transmitting are satisfied

   *cts_addr = 0;
   *txfe_addr = 0;       

   // we never turn modem interrupts off. They must be on all the time

   // awake the task
   int* addr = (int*)(AWAIT_UART1_TX_TID);         
   int tid = *addr;  
   
   if (tid == INVALID_TASK_ID)
   {
      int *temp_addr = (int*)(DEBUG_VAR_MISSED_INTR_UART1_TX );
      *temp_addr = *temp_addr + 1; 
      return;
   }

   zx_td* td = zx_get_td(tid);
   
   td->state = TASK_STATE_READY;      
   if (make_default == 1)
   {
      td->return_value = -1;
   }
   else
   {
      td->return_value = 0;
   }
   
   zx_q_append_to_end( tid, td->priority );
   
   /* resetting the task id */
   addr = (int*)(AWAIT_UART1_TX_TID); 
   *addr = INVALID_TASK_ID;   
}

/* This interrupt handler routine will handle the interrupts
 * of UART1 RX, UART2 TX, UART2 RX 
 */
void zx_handle_uart_interrupt(int source, int make_default)
{
   int tid = 0;
   int task_pointer = 0;
   int return_value = 0;

   zx_device_intr_off(source);
   
   int *temp_addr;
   
   switch(source)
   {
      /* FOR UART1 transmit, we handle two interrupts
         maintaining a state according to the interrupts
         generated. So we send back to the notifiter
         the specific interrupt of the two
       */
      case INTR_SOURCE_UART1_RX:
         return_value = zx_read_byte(COM1);
         task_pointer = AWAIT_UART1_RX_TID;
         temp_addr = (int*)(DEBUG_VAR_MISSED_INTR_UART1_RX );              
         break;
      case INTR_SOURCE_UART2_TX:
         task_pointer = AWAIT_UART2_TX_TID;
         temp_addr = (int*)(DEBUG_VAR_MISSED_INTR_UART2_TX );              
         break;
      case INTR_SOURCE_UART2_RX:
         return_value = zx_read_byte(COM2);      
         task_pointer = AWAIT_UART2_RX_TID;
         temp_addr = (int*)(DEBUG_VAR_MISSED_INTR_UART2_RX );                       
         break;  
   }   
   
   int* addr = (int*)(task_pointer);         
   tid = *addr;  
   
   if (tid == INVALID_TASK_ID)
   { 
      *temp_addr = *temp_addr + 1;            
      return;
   }

   zx_td* td = zx_get_td(tid);
   
   td->state = TASK_STATE_READY;      
   if (make_default == 1)
   {
      td->return_value = -1;
   }
   else
   {
      td->return_value = return_value;
   }
   
   zx_q_append_to_end( tid, td->priority );
   
   /* resetting the task id */
   addr = (int*)(task_pointer); 
   *addr = INVALID_TASK_ID;
}

 

