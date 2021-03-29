/*
 * zx_heap.c
 *
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #include <zx_kernel_config.h>
 #include <zx_clockserver_heap.h>
 #include <zx_tasks.h>
 #include <bwio.h>
 
 /* -----------------------------------------------------------------------------------------*/
 /* Initilalizing the HEAP */
 /* This is the data structure which our clock server will use
    to keep track of the tasks which have called delay()
    
    Parameters : 
    1. Array that will be used to store the heap
    2. Size of the heap , in other words size of the array
    3. pointer to the variable which will store the index of the last element of the heap(array)
  * ----------------------------------------------------------------------------------------- *
  */
 void zx_clockserver_heap_init( zx_clockserver_heap_node *heap, int heap_size, int *end_node_index )
 {  
   /* Set end node index as 0 */
   *end_node_index = -1;
   
  // bwprintf( COM2, "Initing end node index at memory %x\n", (int)end_node_index);
   
   /* Initialize the heap nodes */
   int i=0;   
   for( i=0; i<heap_size ; i++ )
   {
      zx_clockserver_heap_node* temp = (heap+i);
      
    //  bwprintf( COM2, "Initing heap node at memory %x\n", (int)temp);
      
      temp->tid          = INVALID_TASK_ID;
      temp->wake_up_time = 0xffffffff;
   }
   return;
 }
  
  
 /* -----------------------------------------------------------------------------------------/
  *
  *   INSERT A NODE INTO THE HEAP
  *   For this we find the next empty node to insert, and update the tid & wake_up_time
  *   Then run min_heap function to maintain the heap property for the newly created node
  * -----------------------------------------------------------------------------------------*/
 void zx_clockserver_heap_insert( zx_clockserver_heap_node *heap, int *next_node_index, int tid, int wake_up_time )
 {
 
   /* get the index in which we should insert the next node */
   *next_node_index = *next_node_index+1;
   
 //  bwprintf( COM2, "Inserting at index = %d\n", *next_node_index );
   
   if( *next_node_index >= TASK_COUNT )
   {
      *next_node_index = *next_node_index - 1;
      bwprintf( COM2, "zx_clockserver_heap_insert: Something seriously wrong. Index = %d\n", *next_node_index);
      return; 
   }
 
   /* Insert node into proper index */
   zx_clockserver_heap_node *node = heap + (*next_node_index);
   
   node->tid = tid;
   node->wake_up_time = wake_up_time;
   
 // bwprintf( COM2, "Next Node Index=%d\n", *next_node_index);
   
   zx_clockserver_min_heapify_after_insert( heap, (*next_node_index) );
   
   //debug
   //zx_clockserver_heap_node* node1 = heap;
   //zx_printf(COM2, "TID:%d. Time: %d.\n", node1->tid, node1->wake_up_time); 
 }
 
 /* -----------------------------------------------------------------------------------------/
  *
  *   DELETE A NODE FROM THE HEAP
  * -----------------------------------------------------------------------------------------*/
 void zx_clockserver_heap_remove( zx_clockserver_heap_node *heap, int *end_node_index)
 {
    int index = *end_node_index;
    
   // bwprintf( COM2, "In zx_clockserver_heap_remove\n");

    if( index >= TASK_COUNT )
    {
       //  bwprintf( COM2, "zx_clockserver_heap_remove: Something seriously wrong. Index = %d\n", index);
         return; 
    }
 
    /* Getting root node */
    zx_clockserver_heap_node *root_node = heap;
    /* Check if we are removing root node */
    if( index == 0 )
    { 
      /* Set end node index as 0 */
     // bwprintf( COM2, "zx_clockserver_heap_remove: Removed Node at tid=%d, wake_up_time=%d\n", root_node->tid, root_node->wake_up_time);
      
      *end_node_index = -1;
      
      root_node->tid = INVALID_TASK_ID;
      root_node->wake_up_time = 0xffffffff;
      
      return;
    }
        
    /* Getting end node */
    zx_clockserver_heap_node *end_node = heap;
    end_node = end_node + index;
   
  //  bwprintf( COM2, "zx_clockserver_heap_remove: Removed Node at tid=%d, wake_up_time=%d\n", root_node->tid, root_node->wake_up_time);
    
    /* Swapping the root and end node. Resetting the end node */
    zx_clockserver_heap_node_swap( root_node, end_node );
    end_node->tid = INVALID_TASK_ID;
    end_node->wake_up_time = 0xffffffff;     
    
    /* Update end_node_index and end_node_index */   
    /* Set end node index as 0 */
    *end_node_index = *end_node_index-1;
  //  bwprintf( COM2, " End Node Index after delete:%d\n ", *end_node_index );
    
    zx_clockserver_min_heapify_after_delete( heap, 0 );
 }
  
 /********************************************************************************************/
 /*               BELOW ARE HELPER FUNCTIONS USED BY ABOVE FUNCTIONS                         */
 /********************************************************************************************/
 
 /* -----------------------------------------------------------------------------------------/
  * 
  * When removing a node from the heap, we just swap the end node and root node. We have to 
  * run this fucntion starting from the root to maintain the heap property after this swap  
  *
  * -----------------------------------------------------------------------------------------*/
 void zx_clockserver_min_heapify_after_delete( zx_clockserver_heap_node *heap, int index )
 {
    int left     = (2*index)+1;
    int right    = (2*index)+2;
    int smallest = index;
    
    zx_clockserver_heap_node* base_node = heap;
    
    zx_clockserver_heap_node* left_child = heap;
    left_child = left_child + left;
    zx_clockserver_heap_node* right_child = heap;
    right_child = right_child + right;
    
    
    zx_clockserver_heap_node* swap_node;
    
    zx_clockserver_heap_node *smallest_node;
    smallest_node = base_node+smallest;
    
    if( left < TASK_COUNT && 
        left_child->tid != INVALID_TASK_ID &&
        left_child->wake_up_time < smallest_node->wake_up_time )
    {
          smallest = left;
          smallest_node = base_node+smallest;
          swap_node = left_child;
    }
    
    if( right < TASK_COUNT && 
        right_child->tid != INVALID_TASK_ID &&
        right_child->wake_up_time < smallest_node->wake_up_time ) 
    { 
         smallest = right;
         swap_node = right_child;
    } 
    
    if( index != smallest )
    {
       zx_clockserver_heap_node* parent_node = heap;
       parent_node = parent_node + index;
       zx_clockserver_heap_node_swap( parent_node, swap_node );
       
       zx_clockserver_min_heapify_after_delete(heap ,smallest );
    }
    
    return;
 }
 
 /* Used in INSERT function
    Each node is inserted in the next_node position
    Then we call this function to move to 
    proper position in the heap
    
    NOTE: This is a recursive function
  */
 void zx_clockserver_min_heapify_after_insert( zx_clockserver_heap_node *heap, int index )
 {
   int parent_index = 0;
   int left = 0;
   int right = 0;
   
   if(index <= 0 ) return;
      
   if( index%2 == 0 )
   {
      parent_index = (index-2)/2;
      right = index;
      left = index-1; 
   }
   else
   {
      parent_index = (index-1)/2;
      left = index;
      right = index+1;
   }

   int smallest = parent_index;
   
   zx_clockserver_heap_node *swap_node;   
   zx_clockserver_heap_node *base_node = heap ;
   
   zx_clockserver_heap_node *smallest_node = base_node + parent_index;   
   
   zx_clockserver_heap_node *left_child    = heap;
   left_child  = left_child + left;
   
   zx_clockserver_heap_node *right_child   = heap;
   right_child = right_child + right;
   
   if( left < TASK_COUNT && 
        left_child->tid != INVALID_TASK_ID &&
        left_child->wake_up_time < smallest_node->wake_up_time )
   {
      smallest = left;
      smallest_node = base_node+smallest;
      swap_node = left_child;
   }
    
    if( right < TASK_COUNT && 
        right_child->tid != INVALID_TASK_ID &&
        right_child->wake_up_time < smallest_node->wake_up_time ) 
    { 
       smallest = right;
       swap_node = right_child;
    } 
    
    
   if( smallest != parent_index )
   {
       zx_clockserver_heap_node* parent_node = heap;
       parent_node = parent_node + parent_index;
       zx_clockserver_heap_node_swap( parent_node, swap_node );
       
       zx_clockserver_min_heapify_after_insert( heap, parent_index );
   }
   return;
 }
 
/* 
 * Swap values of 2 heap nodes
 */
 void  zx_clockserver_heap_node_swap( zx_clockserver_heap_node *parent_node, zx_clockserver_heap_node *child_node)
 {
     int temp;
     
     temp = parent_node->tid;
     parent_node->tid = child_node->tid;
     child_node->tid  = temp;

     temp = parent_node->wake_up_time;
     parent_node->wake_up_time = child_node->wake_up_time;
     child_node->wake_up_time  = temp;        
 }
 
/*
 * Print clock server heap
 */
 void debug_print_clockserver_heap( zx_clockserver_heap_node *heap, int index )
 {
    zx_clockserver_heap_node* parent_node = heap;
    parent_node = parent_node + index;
    
    bwprintf( COM2, "Printing heap node at index %d:", index);
    bwprintf( COM2, "tid =  %d; up_time=%d\n",  parent_node->tid, parent_node->wake_up_time);
 }
