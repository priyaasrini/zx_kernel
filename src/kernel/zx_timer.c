/*
 * zx_timer.c
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /* Contains set, enable and disable function related to timer1 and timer2 */
 
 /* Intialize Timer Value */
 
 #include <zx_timer.h>
 
 void zx_timer_load_val( int timer, int val )
 {
   unsigned int *addr;
   
   switch (timer )
   {
      case TIMER_1:
         addr  = (unsigned int *)(TIMER_1 + TIMER_LOAD_OFFSET);
         break;
          
      case TIMER_2:
         addr  = (unsigned int *)(TIMER_2 + TIMER_LOAD_OFFSET);
         break;
         
      case TIMER_3:
         addr  = (unsigned int *)(TIMER_3 + TIMER_LOAD_OFFSET);
         break;         
   }  
   *addr = val;
 }
  
  
 /* Set Mode of the timer as periodic */
 void zx_timer_set_periodic( int timer, int periodic )
 {
   unsigned int *addr, value;
   
   switch (timer )
   {
      case TIMER_1:
         addr  = (unsigned int *)(TIMER_1 + TIMER_CONTROL_OFFSET);
         break;
          
      case TIMER_2:
         addr  = (unsigned int *)(TIMER_2 + TIMER_CONTROL_OFFSET);
         break;
         
      case TIMER_3:
         addr  = (unsigned int *)(TIMER_3 + TIMER_CONTROL_OFFSET);
         break;
   }
   value = *addr; 
   
   if (periodic)
      value = value | TIMER_PERIODIC_MODE_MASK;
   else
      value = value & (~TIMER_PERIODIC_MODE_MASK);
   
   *addr = value;
 }
  
 /* Select Clock of the timer */
 void zx_timer_select_clock( int timer, int clock_mask )
 {
   unsigned int *addr, value;
   
   switch (timer )
   {
      case TIMER_1:
         addr  = (unsigned int *)(TIMER_1 + TIMER_CONTROL_OFFSET);
         break;
          
      case TIMER_2:
         addr  = (unsigned int *)(TIMER_2 + TIMER_CONTROL_OFFSET);
         break;

      case TIMER_3:
         addr  = (unsigned int *)(TIMER_3 + TIMER_CONTROL_OFFSET);
         break;
   }
   value = *addr;
   *addr = value | clock_mask; 
 }
 
 /* Enable Timer */
 void zx_timer_enable( int timer )
 {
   unsigned int *addr, value;
   
   switch (timer )
   {
      case TIMER_1:
         addr  = (unsigned int *)(TIMER_1 + TIMER_CONTROL_OFFSET);
         break;
          
      case TIMER_2:
         addr  = (unsigned int *)(TIMER_2 + TIMER_CONTROL_OFFSET);
         break;

      case TIMER_3:
         addr  = (unsigned int *)(TIMER_3 + TIMER_CONTROL_OFFSET);
         break;
   } 
   value = *addr;
   *addr = value | TIMER_ENABLE_MASK; 
 }
 
 /* Disable Timer */ 
 void zx_timer_disable( int timer )
 {
   unsigned int *addr, value;
   
   switch (timer )
   {
      case TIMER_1:
         addr  = (unsigned int *)(TIMER_1 + TIMER_CONTROL_OFFSET);
         break;
          
      case TIMER_2:
         addr  = (unsigned int *)(TIMER_2 + TIMER_CONTROL_OFFSET);
         break;

      case TIMER_3:
         addr  = (unsigned int *)(TIMER_3 + TIMER_CONTROL_OFFSET);
         break;
   } 
   value = *addr;
   value = value & (~TIMER_ENABLE_MASK);
   *addr = value;
 }
 
 /* get timer value */
 int zx_timer_get_value( int timer )
 {
   unsigned int *addr;
   
   switch (timer )
   {
      case TIMER_1:
         addr  = (unsigned int *)(TIMER_1 + TIMER_VALUE_OFFSET);
         break;
          
      case TIMER_2:
         addr  = (unsigned int *)(TIMER_2 + TIMER_VALUE_OFFSET);
         break;

      case TIMER_3:
         addr  = (unsigned int *)(TIMER_3 + TIMER_VALUE_OFFSET);
         break;
   }  
   return (*addr);  
   
 }
