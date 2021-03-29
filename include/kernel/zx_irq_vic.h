/*
 * zx_irq.h
 *
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 
// TIMER

#ifndef ZX_IRQ

   #define ZX_IRQ
      
   // INTERRUPT SOURCES
   #define IRQ_TIMER TIMER_1

/*--------------------------------------------------------------------------
            VIC ( Source number of each device and respective mask )
 *--------------------------------------------------------------------------*/ 

   // for VIC1   
   #define INTR_SOURCE_TIMER_1     4
   #define TIMER1_INTR_MASK          (0x1 << INTR_SOURCE_TIMER_1 )

   // for VIC2   
   #define INTR_SOURCE_UART_1     52
   #define UART1_INTR_MASK          (0x1 << (INTR_SOURCE_UART_1 - 32) )

   #define INTR_SOURCE_UART_2     54
   #define UART2_INTR_MASK          (0x1 << (INTR_SOURCE_UART_2 - 32) )
   
/*--------------------------------------------------------------------------
                             VIC REGISTER ADDRESSES
 *--------------------------------------------------------------------------*/

   #define VIC1_BASE       0x800B0000
   #define VIC2_BASE       0x800C0000

   #define IRQ_STATUS_OFFSET        0x0
   #define IRQ_RAW_OFFSET           0x08
   #define IRQ_INTR_ENABLE_OFFSET   0x10
   #define IRQ_INTR_CLEAR_OFFSET    0x14

   #define IRQ_PROTECTION_OFFSET    0x20

   // for CPSR
   #define IRQ_CPSR_DISABLE_MASK   (0x1 << 7)

   void zx_reset_all_interrupts();
   void zx_vic_disable_all_interrupts();
   void zx_vic_enable_all_interrupts();

   void zx_vic_enable_interrupt( int device_number );
   void zx_vic_disable_interrupt( int device_number );
   
   int  zx_get_interrupt_source();   

#endif

