/*
 * zx_kernel_body.h
 *
 * Apart from the kernel loop, main fucntion calls with which the 
 * the kernel continously schedules and runs one task after other
 * These routines constitute the core of the kernel
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /*
 * This structure will be used by the kernel to 
 * to pass the arguments of the system calls and 
 * SWI number between different handlers and main
 * loop
 */
 
#ifndef ZX_KERNEL_BODY
#define ZX_KERNEL_BODY
 
   typedef struct{

      int* arg1;
      int* arg2;
      int* arg3;
      int* arg4;
      int* arg5;
      int* arg6;
      int* arg7;
      int swi_number;

   } zx_request;
    
    void zx_handle( void *req );
    void zx_kernel_init(int arg);

    zx_request* zx_save_context_and_return_to_kernel();
    zx_request* zx_restore_context(int tid);
    
    zx_request* zx_get_next_request();
    
    zx_request* zx_get_closure_errors();
    
    void zx_initialize_globals();
    
    void zx_idle();
    void truly_idle();
    
#endif /* ZX_KERNEL_BODY */
