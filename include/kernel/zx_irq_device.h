/*
 * zx_irq_device.h
 *
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #ifndef ZX_IRQ_DEVICE_H 
 #define ZX_IRQ_DEVICE_H
 
 /*--------------------------------------------------------------------------
                             UART REGISTER ADDRESSES
 *--------------------------------------------------------------------------*/ 
   
   #define UART1_BASE_ADDR 0x808C0000
   #define UART2_BASE_ADDR 0x808D0000

     /* ------------------------ 
      * CONTROL REGISTER Address
      * ------------------------
      */      
      #define UART1_CONTROL (UART1_BASE_ADDR + 0x0014)      
      #define UART2_CONTROL (UART2_BASE_ADDR + 0x0014)      
          
        /* -------------------------------------------------------- 
         * CONTROL REGISTER MASKS enable individual UART interrupts
         * --------------------------------------------------------
         */   
         #define RIE_MASK (0x1 << 4)  // receive interrupt enable  
         #define TIE_MASK (0x1 << 5)  // transmit interrupt enable
         #define MIE_MASK (0x1 << 3)  // modem status interrupt enable
         
     /* ------------------------ 
      * STATUS REGISTER Address
      * ------------------------
      */      
      #define UART1_STATUS (UART1_BASE_ADDR + 0x001C)
      #define UART2_STATUS (UART2_BASE_ADDR + 0x001C)
      
        /* -------------------------------------------------------- 
         * STATUS REGISTER MASKS enable individual UART interrupts
         * --------------------------------------------------------
         */
         #define RIS_MASK (1 << 1)
         #define TIS_MASK (1 << 2) 
         #define MIS_MASK (1 << 0) 

/*--------------------------------------------------------------------------
            UART ( Source number of each device and respective masks )
 *--------------------------------------------------------------------------*/ 

   #define INTR_SOURCE_UART1_RX    23  // TODO 
   #define INTR_SOURCE_UART1_TX    24
   
   #define INTR_SOURCE_UART1_MODEM 1 // number just for identification
   
   #define INTR_SOURCE_UART2_RX    25
   #define INTR_SOURCE_UART2_TX    26 

/* ------------------------------------------------------------------------- */

   void zx_device_intr_disable_all();
   void zx_device_intr_clear_all();
   
   void zx_device_init( int device_number);
   void zx_init_modem_intr();
   
   void zx_device_intr_on( int device_number );
   void zx_device_intr_off( int device_number );
   void zx_device_intr_clear( int device_number );   
   
   void zx_handle_uart1_transmit_interrupt(int source, int make_default);
   void zx_handle_uart_interrupt(int source, int make_default);
   void zx_handle_timer_interrupt(int make_default);
   
 #endif /*  ZX_IRQ_DEVICE_H */  
