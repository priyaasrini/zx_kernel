/*
 * zx_queue.h
 *
 * Definitions for ready queue structure
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#ifndef ZX_QUEUE
#define ZX_QUEUE
 
   #define NULL 0

   /* 
    * This structure defines the structure of a single node
    * in the ready queue
    */ 
   struct ready_queue ; /* forward declaration */
   typedef struct ready_queue{
      int tid;
      struct ready_queue *next;
      struct ready_queue *prev;
   }zx_ready_queue_node;
   
   /* Receive queue which would queue up the messages that was
      sent to the task      
    */
    
   struct receive_queue_node;
   typedef struct receive_queue_node{
      int     tid;
      void   *msg;
      int     msglen;
      struct  receive_queue_node *next;
   }zx_receive_queue_node;

   /* Forward declarations for READY queue functions*/
   void zx_q_append_to_end(  int tid, int priority );
   void zx_q_append_to_penultimate(  int tid, int priority );

   void zx_q_remove_priority( int priority);
   void zx_q_add_priority( int priority);
   int zx_q_get_highest_priority();
   
   void zx_q_remove_node( int tid, int priority );
   int  zx_q_get_next_tid();
   
   void zx_q_free_node( zx_ready_queue_node *node );
   int* zx_q_get_head_addr( int priority );

   zx_ready_queue_node* zx_q_create_node( int tid);
   zx_ready_queue_node* zx_q_get_node( int tid );
   
   /* Forward declarations for RECEIVE queue functions*/
   zx_receive_queue_node* zx_receive_q_create_node( int tid, void *msg, int msglen);
   void zx_receive_q_append_to_end(  int tid, zx_receive_queue_node* new_node );
   zx_receive_queue_node*  zx_receive_q_get_next_node(int tid);
   void zx_receive_q_free_head( zx_receive_queue_node *node );
   zx_receive_queue_node* zx_receive_q_get_node( int array_index);
   int* zx_receive_q_get_tail_addr( int array_index );
   int* zx_receive_q_get_head_addr( int array_index );

#endif /* ZX_QUEUE */
