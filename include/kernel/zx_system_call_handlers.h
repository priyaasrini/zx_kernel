/*
 * zx_system_call_handlers.h
 *
 * Contains signatures of system call handlers 
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

/* Handlers */

#ifndef ZX_SYSTEM_CALL_HANDLERS
#define ZX_SYSTEM_CALL_HANDLERS

   #include <zx_kernel_body.h>


   int  zx_create( int priority, void (*code)() );
   void zx_exit();
   int  zx_my_tid();
   int  zx_parent_tid();

   /* Helper of Handler */
   int  zx_initialize_stack( int* base, void *zx_task );
   
   /* Debug handlers */
   
   int debug_many_args( zx_request* req);
   
   void zx_await_event(int event_number);
   void zx_handle_hwi(int device_number);
   
   void  zx_reply( int sendertid, void *reply, int reply_len);
   void  zx_receive( int *sendertid, void *message, int msglen);
   void  zx_send( int recv_tid, void *message, int msglen, void *reply, int replylen );
   
   void zx_shutdown();
   void zx_kill( int );

#endif /* ZX_SYSTEM_CALL_HANDLERS */
