/*
 * zx_a0_timer.h - definitions and declarations specific to clock control
 *
 */
 
#ifndef ZX_A0_TIMER
#define ZX_A0_TIMER

   #include <zx_a0_graphics.h>

   #define TIMER_CONTROL_REGISTER 0x80810088
   #define TIMER_LOAD_REGISTER    0x80810080
   #define TIMER_READ_REGISTER    0x80810084

   #define TIMER3_CONTROL       0x00
   #define TIMER3_EN_MASK       0x80
   #define TIMER3_DIS_MASK      0x3f
   #define TIMER3_MODE_PERIODIC  0x40

   #define TIMER_MAX_VALUE      64000
   #define FRACTION_OF_SECOND   10
   #define CLOCK_TICKS          200

   #define TIMER_POS_X          (DISPLAY_ROW_START+2)
   #define TIMER_POS_Y          (DISPLAY_COLUMN_END/2)

   /* Function declarations */
   //void timer();
   int  initialize_timer();
   
#endif /* ZX_A0_TIMER */
