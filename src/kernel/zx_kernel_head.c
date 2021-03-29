/*
 * zx_kernel_head.h
 *
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

#include <ts7200.h>
#include <zx_uart_io.h>
#include <zx_system_calls.h>
#include <zx_kernel_body.h>
#include <zx_kernel_head.h>
#include <zx_tasks.h>
#include <zx_ready_queue.h>
#include <zx_irq_device.h>
#include <zx_irq_vic.h>

#include <zx_kernel_config.h>
#include <zx_helper.h>

#include <zx_testing.h>
#include <zx_timer.h>

#define FOREVER for(;;)

/* My Kernel :) zx_kernel .. at last made it to work - 24-Jan-2013*/
int main( int argc, char *argv[])
{
   zx_request *req;

   /* Initialize kernel. Look zx_kernel_init() header for further details */
   zx_kernel_init(argc);
   
   /* Note : We enable interrupts in teh devices in their respective notifiers */
   
   FOREVER
   {
      req = zx_get_next_request();
      
      /* 
       * We enable interrupt from this device after we handle 
       * the current interrupt 
       */     
      if (req != NULL) // if request is ordinary
      {
         zx_handle(req); 
         
      }
      else // if no tasks
      {      
         req = zx_get_closure_errors();   
               
         if (req->swi_number != SWI_NONE)
            return -1; //error
            
         else return 0;  
      }
   }
   
   /* control will never reach here */
   return 0; 
}


