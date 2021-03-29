/*
 * zx_irq.c
 *
 * File containing handling IRQs
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


void zx_reset_all_interrupts()
{
   zx_vic_disable_all_interrupts();

   zx_device_intr_disable_all();
   
   zx_device_intr_clear_all(); 
}


/*
 * Disable all interrupts
 */
void zx_vic_disable_all_interrupts()
{
   int* addr = (int*)(VIC1_BASE + IRQ_INTR_CLEAR_OFFSET);
   *addr = 0xffffffff;
   
   addr = (int*)(VIC2_BASE + IRQ_INTR_CLEAR_OFFSET);
   *addr = 0xffffffff;      
}

/* 
 * Enable interrupts from all device 
 */
void zx_vic_enable_all_interrupts()
{
  /* to make sure, disabling all other interrupts */
  zx_vic_disable_all_interrupts();
  
  /* Enable Timer Interrupt */
  zx_vic_enable_interrupt(INTR_SOURCE_TIMER_1);
  
  /* UART2 Interrupts */
  zx_vic_enable_interrupt(INTR_SOURCE_UART_2);  
  
  /* UART1 Interrupts */
  zx_vic_enable_interrupt(INTR_SOURCE_UART_1);  
}

/* Use this function when you just received a interrupt
   from one of the devices and yet to handle it. So we
   clear the bit of INTR_ENABLE register, so that we ll
   not be notified for any more interrupts from this device
 */
void zx_vic_disable_interrupt( int intr_number )
{
   int offset;
   int bit;
   
   if (intr_number < 32)
   {
      offset = VIC1_BASE + IRQ_INTR_CLEAR_OFFSET;
      bit = intr_number;   
   }
   else
   {
      offset = VIC2_BASE + IRQ_INTR_CLEAR_OFFSET;
      bit = intr_number - 32;   
   }

   int* addr = (int*)(offset);
   int value = *addr;
   
   value |= (1 << bit);
   *addr = value;
}

/* 
   Use this function to enable servicing ofinterupts from
   a particular source
 */
void zx_vic_enable_interrupt( int intr_number )
{
   int offset;
   int bit;  
   
   if (intr_number < 32)
   {
      offset = VIC1_BASE + IRQ_INTR_ENABLE_OFFSET;
      bit = intr_number;   
   }
   else
   {
      offset = VIC2_BASE + IRQ_INTR_ENABLE_OFFSET;
      bit = intr_number - 32;   
   }
 
   int* addr = (int*)(offset);
   int value = *addr;
   
   value |= (1 << bit);
   *addr = value;  
}

/*
 * Find the source from which the interrupt 
 * was received       
 */
int zx_get_interrupt_source()
{
   /* Read interrupt status register */
   int* addr = (int*)(VIC1_BASE + IRQ_STATUS_OFFSET);
   int value1 = *addr;

   addr = (int*)(VIC2_BASE + IRQ_STATUS_OFFSET);
   int value2 = *addr;
   
   int device_number = 0;
   
   /* -----------------------------------------------------------
    * If two interrupts are generated simulateneously, the order
    * decides the priority of the interrupts
    * -----------------------------------------------------------*/
   /* Device 1 : TIMER */
   /* -----------------------------------------------------------*/

   
   /* -------------------------------------------------------*/
   /* Check if its from UART1 */
   /* -------------------------------------------------------*/
   if ((value2 & UART1_INTR_MASK) > 0)
   {
   
      int* device_status_addr = (int*)(UART1_STATUS);
      int dev_value = *device_status_addr;        
         
      /* Modem status change interrupt from device */
      if ((dev_value & MIS_MASK) > 0) // modem
      {
         device_number = INTR_SOURCE_UART1_MODEM;        
      }
     
      /* receive interrupt inside device */
      else if ((dev_value & RIS_MASK) > 0) // receive
      {
         device_number = INTR_SOURCE_UART1_RX;
      }  
      
      /* transmit FIFO empty interrupt from device */
      else if ((dev_value & TIS_MASK) > 0) // transmit
      {
         device_number = INTR_SOURCE_UART1_TX;
      }
   }
   else if ((value1 & TIMER1_INTR_MASK) > 0)
   {
      device_number = INTR_SOURCE_TIMER_1;
   }
   
   /* -------------------------------------------------------*/
    /* Check if its from UART2 */
    /* -------------------------------------------------------*/
   else if ((value2 & UART2_INTR_MASK) > 0)
   {
      int* device_status_addr = (int*)(UART2_STATUS);
      int dev_value = *device_status_addr;    
   
      /* receive interrupt inside device */
      if ((dev_value & RIS_MASK) > 0) // receive
      {
         device_number = INTR_SOURCE_UART2_RX;
      }
      
      /* transmit FIFO empty interrupt from device */
      else if ((dev_value & TIS_MASK) > 0) // transmit
      {
         device_number = INTR_SOURCE_UART2_TX;
      }  
      else
      { 
         // we shud not reach here
      }
   }

   /* Alex we are not supposed to do it here
      See notifier code to UART2 rtransmit 
      Each handler should handle this
      
      Switch off the interrupt from device 
      at place where the source is requested

      Clear the interrupt line in the device 
      in the respective handler/notifier/as needed 
   */
#if 0
   if (device_number != 0)
   { 
      /* As soon as you find the source of the interrupt,
       * disable any more interrupts from that device,
       * and clear the interrupt line of the device
       */


      zx_device_intr_off( device_number );
      zx_device_intr_clear ( device_number );


 //     bwprintf(COM2, "Device: %d", device_number);              
   }
#endif    
   return device_number;

}
