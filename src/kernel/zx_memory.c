/*
 * zx_memory.c
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#include <zx_ready_queue.h>
#include <zx_tasks.h>
#include <zx_helper.h>
#include <zx_kernel_config.h>
#include <zx_system_call_handlers.h>
#include <zx_memory.h>
#include <zx_err.h>
 
#include "bwio.h"
 
 void* zx_memcpy( void* dest, void* src, int bytes) // override for system function of memcpy
{
    unsigned char *src_c = (unsigned char*)src;
    unsigned char *dest_c = (unsigned char*)dest;
    
    while (bytes)
    {
        *dest_c++ = *src_c++;
        bytes--;
    }
    
    return dest;
}

/*
 * allocate requested memory 
 * ATTENTION: zx_alloc always return 16 bytes
 */
void* zx_alloc() 
{
   zx_td *mytd = (zx_td*)zx_get_active_td();
   
   if( mytd->heap_head == NULL ) 
   {
      return NULL;
   }
   
   /* get a pointer to the head */
   zx_heap_chunk *allocated_memory = mytd->heap_head;
   
   /* Move the head and store it into the task descriptor*/
   /* The head might as well become null if we are using the
      last chunk of memory
    */
   mytd->heap_head = mytd->heap_head->next;
   
   if( mytd->heap_head == NULL )
   {
      mytd->heap_tail = NULL;
   }
   
//   bwprintf( COM2, "zx_allocate: Allocated Memory %x\n", (int)allocated_memory );
   
   //debug
 //  bwprintf( COM2, "zx_allocate: Chunks Remaining:%d\n", debug_walk_heap() );

   return (void*)allocated_memory;
}

/*
 * free the allocated memory
 *
 * parameter : pointer to memory 
 *             to be freed
 */
void zx_free( void *memory) 
{
   zx_td *mytd = (zx_td*)zx_get_active_td();
   
   if( memory == NULL ) return;
   
   if (!( (int)memory < (int)mytd->stack_base && (int)memory > (int)mytd->stack_limit ))
   {
    //   bwprintf( COM2, "zx_free: Invalid Memory address\n stack_base=%x; stack_limit=%x, memory=%x\n", mytd->stack_base, mytd->stack_limit, (int)memory);
   }

   if( mytd->heap_head == NULL )
   {
      /* we used up the heap completely. Now we got a free node */
      mytd->heap_head = mytd->heap_tail = memory;
      mytd->heap_head->next=NULL;
   }
   else
   {
      /* Link the memory to be freed to the tail */
      mytd->heap_tail->next = (zx_heap_chunk*)memory;
      /* Move the tail to newly added memory */
      mytd->heap_tail = mytd->heap_tail->next;
      /* Make the next node of tail = nULL */
      mytd->heap_tail->next = NULL;
   }
   
  // bwprintf( COM2, "zx_free: Freed Memory %x\n", (int)memory );
   
   //debug
  // bwprintf( COM2, "Chunks Remaining:%d\n", debug_walk_heap() );
   
   memory = NULL;
   return;
}

/*
 * heap_create
 *
 * parameter : initilialize the heap of
 *             calling tasks address space
 */
void zx_heap_create( int *tdptr) 
{
   //debug
   int chunks = 1;
   
   //to avoid circular reference zx_tasks.h <--> zx_memory.h 
   zx_td *mytd = (zx_td*)tdptr;

   int stack_limit = (int)mytd->stack_limit;
   
  // bwprintf( COM2, "In Heap Create \n");
   
   /* stack grows downwards. To move towards the base,
    * increment address, increment. To move towards the
    * limit, decrement. Now you can proceed to look at 
    * the code :)
    *  --------
    * |        |----> stack base ( 0x123456 )
    * |        |
    * |        |
    * |        |
    * .        .
    * .        .
    * |        |
    * |        |----> heap offset from stack base
    * |        |
    * .        .
    * .        .   
    * |        |
    * |        |
    *  -------- ----> stack limit / heap ends here ( 0x0000000)
    */
    
  if( HEAP_SIZE < 16 ) return;
    
   /* get the starting point of the heap */
   zx_heap_chunk* heap_pointer = (zx_heap_chunk*)(stack_limit + HEAP_SIZE);
 
   zx_heap_chunk *temp;
   
   /* make head to be the heap base */
   mytd->heap_head = heap_pointer;   

   
   /* I know that this is bit confusing */
   while( (int)(heap_pointer-4) > stack_limit ) 
   {
      /* I have more than 16 bytes in available heap now.So add the chunk */
      
      /* keep moving until you reach end of heap */
      temp = heap_pointer;
      heap_pointer = heap_pointer-4; // this ll move 16 bytes
      temp->next = heap_pointer;

      chunks++;
   }

   heap_pointer->next = NULL; 
   
   mytd->heap_tail =  heap_pointer; 
}

/* debug function */
int debug_walk_heap( )
{
   int chunks = 0;
   zx_td *mytd = (zx_td*)zx_get_active_td();
   
   zx_heap_chunk *head = mytd->heap_head;
   zx_heap_chunk *temp = mytd->heap_tail;
   
   temp = head;
   
   bwprintf( COM2, "zx_heap_walk: Begin address read = %x\n", (int) temp );
   
   while( temp )
   {
      chunks++;
      head = temp;
      temp = temp->next;   
   }

   bwprintf( COM2, "zx_heap_walk: Last address read = %x\n", (int) head );

   bwprintf( COM2, "zx_heap_walk: number of chunks = %d\n", (int) chunks );

   return chunks;
}

// memset

void* zx_memset(void *s, int c, unsigned int n) 
{
  unsigned char *p = s;
  while(n --> 0) { *p++ = (unsigned char)c; }
  return s;
}


