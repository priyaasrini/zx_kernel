/* 
 * zx_clockserver_heap.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #ifndef ZX_CLOCKSERVER_HEAP
 #define ZX_CLOCKSERVER_HEAP
 
 /* During kernel initialization, we create an array of heap nodes.
    Address of this is predetermined.
    Check in kernel_config.h
  */
  typedef struct heap_node{
   int tid;
   int wake_up_time;
  }zx_clockserver_heap_node;
 
  void zx_clockserver_heap_init( zx_clockserver_heap_node *heap, int heap_size, int *end_node_index );
  void zx_clockserver_heap_insert( zx_clockserver_heap_node *heap, int *next_node_index, int tid, int wake_up_time );
  void zx_clockserver_heap_remove( zx_clockserver_heap_node *node, int *end_node_index);
  void zx_clockserver_min_heapify_after_delete( zx_clockserver_heap_node *heap, int index );
  void zx_clockserver_min_heapify_after_insert( zx_clockserver_heap_node *heap, int index );
  void  zx_clockserver_heap_node_swap( zx_clockserver_heap_node *parent_node, zx_clockserver_heap_node *child_node);
  
  void debug_print_clockserver_heap( zx_clockserver_heap_node *heap, int index );
  
 #endif /* ZX_CLOCKSERVER_HEAP */
  
