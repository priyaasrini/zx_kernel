/*
 * zx_queue.c
 *
 * This is the file which has all the routines to insert tasks into the 
 * a queue
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /* To use these interfaces to maintain a circular queue
    make head and tail to be -1
  */
  
  /* INSERT QUEUE
   * 
   * queue           : Queue into which the data has to be inserted
   * queue_size      : number of elements in the queue
   * head            : head pointer for the queue
   * tail            : tail pointer for the queue
   * data            : data that has to be inserted
   * is_empty        : indicator that teh queue is full
   * is_full         : indicator that the queue is empty
   */
   
   
  #define ZX_Q_SUCCESS       1
  #define ZX_ERR_QUEUE_EMPTY 2
  #define ZX_ERR_QUEUE_FULL  3
  
  #define ZX_ERRMSG_QUEUE_FULL "Error: Queue Full\n"
  #define ZX_ERRMSG_QUEUE_EMPTY "Error: Queue Empty\n"
  
  typedef struct{
      void *queue;
      int  queue_size; // number of elements in the queue
      
      int  head;
      int  tail;
      
      int  is_empty_flag;
      int  is_full_flag;
      
      int  data_size; // in bytes
  }zx_circular_queue;
  
  int zx_queue_insert( zx_circular_queue **q, void *data);
  int zx_queue_remove( zx_circular_queue **q, void *data);
  int zx_is_queue_empty( int head, int tail);
  int zx_queue_is_full( int head, int tail, int queue_size);
  int zx_queue_initialize( zx_circular_queue **q, void *queue, int data_size, int queue_size );
