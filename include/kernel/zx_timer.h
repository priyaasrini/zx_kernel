/*
 * zx_timer.h
 *
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /* Contains set, enable and disable function related to timer1 and timer2 */
 
 #ifndef ZX_TIMER_H
 #define ZX_TIMER_H
  
     #define ON 1 
     
      /* 
       * When you use a timer, update the definition inside these
       * comment statement too........  
       *
        #define IRQ_TIMER           TIMER_1 // defined in zx_irq.h
        #define IDLE_TASK_TIMER     TIMER_2 // defined in zx_tasks.h
       */
 
   #define TIMER_1 0x80810000
   #define TIMER_2 0x80810020 
   #define TIMER_3 0x80810080

      #define TIMER_LOAD_OFFSET         0x0
      #define TIMER_VALUE_OFFSET       0x04
      #define TIMER_CONTROL_OFFSET     0x08

         #define TIMER_ENABLE_MASK           0x80
         #define TIMER_PERIODIC_MODE_MASK    0x40
         #define TIMER_2KHZ_CLKSEL_MASK      0x00
         #define TIMER_508KHZ_CLKSEL_MASK    0x08

      #define TIMER_CLEAR_OFFSET       0x0C
    
     void zx_timer_load_val( int timer, int val );
     void zx_timer_set_periodic( int timer, int periodic );
     void zx_timer_select_clock( int timer, int clock_mask );
     void zx_timer_enable( int timer ) ;
     void zx_timer_disable( int timer ) ;
     int  zx_timer_get_value( int timer ) ;
     
#endif /* ZX_TIMER_H */ 
