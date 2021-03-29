/*
 * zx_memory.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#ifndef ZX_MEMORY
#define ZX_MEMORY

  struct heap_chunk;
    
  typedef struct heap_chunk{
      struct heap_chunk *next;
  }zx_heap_chunk;
         
 
   void* zx_memcpy( void* dest, void *src, int bytes);
 
   /* we always allocate memory as in chunks of 16 bytes.
      for simplicity. If you want more than that, better 
      not use this routine
    */
   void* zx_alloc();
   void  zx_free();
   
   void zx_heap_create( int* td); 
   
   void nameserver_task();   
   
   int debug_walk_heap( );
   
   void* zx_memset(void *s, int c, unsigned int n);
#endif /* ZX_MEMORY */
 
