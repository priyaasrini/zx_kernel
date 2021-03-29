/*
 * zx_clock_server.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
#if 0
#ifndef ZX_CLOCK_SERVER

   #define ZX_CLOCK_SERVER

   #define API_CS_UNSUPPORTED 0
   #define API_CS_DELAY 1
   #define API_CS_DELAY_UNTIL 2
   #define API_CS_TIME 3
   #define API_CS_EXIT 4


   typedef struct {
      int type;
      int value;
   } zx_time_request;


   // for notifier
   #define TIME_REQUEST_NONE 0
   #define TIME_REQUEST_READY 1
   #define TIME_REQUEST_TICK 2

   // for server
   #define TIME_REQUEST_CONFIG 1

   void zx_clock_server();

    
   // timer

   unsigned short timer_getValue();
   int timer_getControl();
    
   void timer_setLoad(unsigned short newValue);
   void timer_setEnable();
   void timer_setClkSel();
   void timer_setDisable();


#endif /* ZX_CLOCK_SERVER */
#endif /* 0 */
