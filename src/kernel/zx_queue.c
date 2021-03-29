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
  
 #include <zx_queue.h>
 #include <zx_memory.h>
 #include <bwio.h>
  
  /* Initialize a circular queue */
  /* This function is for initializing head and tail pointers
   * We need an array to store the elements of the queue. 
   * Parameters :
   * 1. pointer to the circular_queue_struct
   * 2. pointer to array which stores elements of queue
   * 3. size of a single data node in the queue
   * 4. queue_size is number of elements in the queue 
   */
  int zx_queue_initialize( zx_circular_queue **q, void *queue, int data_size, int queue_size )
  {
      (*q)->queue          = queue;
      (*q)->queue_size     = queue_size;
      (*q)->head           = -1;
      (*q)->tail           = -1;
      (*q)->is_empty_flag  = 1;
      (*q)->is_full_flag   = 0;
      (*q)->data_size      = data_size;
      
      if( queue_size == 0 )
      {
        (*q)->is_full_flag   = 1; 
        (*q)->is_empty_flag  = 0;
      }
      return ZX_Q_SUCCESS;
  }
  
   
  /* Insert into the queue */
   
  int zx_queue_insert( zx_circular_queue **q, void *data)
  {
     //bwprintf( COM2, "in queue insert" );
     int tail       = (*q)->tail;
     int head       = (*q)->head;
     
     int data_size  = (*q)->data_size;
     int queue_size = (*q)->queue_size;
     
     /* Before inserting, check if the queue is full */
     if( (*q)->is_full_flag )
     {
         return ZX_ERR_QUEUE_FULL;
     }
     
     /* tail points to last node inserted */
     tail       = (tail+1)%queue_size;     
     (*q)->tail = tail;
     
     /* We need to check if the character pointer jumps only a single byte */
     char *queue = (char*)((*q)->queue) ;
     queue = queue + (tail*data_size);
     zx_memcpy( queue, data, data_size ); 
     
    // bwprintf( COM2, "Data inserted into the queue : %d\n", *((char*)(data)) );
     
     /* First Element being inserted into the queue */
     if( head == -1 )
     {   
         (*q)->head = (*q)->tail;
     }

     /* Modify the queue full / empty flag */
     (*q)->is_empty_flag  = 0;
     (*q)->is_full_flag = zx_queue_is_full( head, tail, queue_size);
     
     return ZX_Q_SUCCESS;
 
 #if 0    
     switch( data_size )
     {
        case 4: //integer
        queue       = (int*) queue + tail;
        queue[tail] = (int*) data;
        break;
        
        case 1: //character
        queue       = (char*) queue + tail;
        queue[tail] = (char*) data;
        break;
        
        default: //custom
        queue      = (char*) queue + (tail*data_size);
        zx_memcpy( queue, data, data_size ); 
        break;
     }
#endif      
  }
  
  /* REMOVE QUEUE
   *
   * Data : data will removed from the queue and placed in this variable 
   *
   */
  int zx_queue_remove( zx_circular_queue **q, void *data)
  {
     int tail       = (*q)->tail;
     int head       = (*q)->head;
     
     int data_size  = (*q)->data_size;
     int queue_size = (*q)->queue_size;
     
     /* Before removing, check if the queue is empty */
     if( (*q)->is_empty_flag )
     {
         return ZX_ERR_QUEUE_EMPTY;
     }     
     
     void *queue = (char*)((*q)->queue) + (head*data_size);
     zx_memcpy( data, queue, data_size ); 
     
     /* Modify the queue full / empty flag */
     (*q)->is_full_flag  = 0;        
     (*q)->is_empty_flag = zx_is_queue_empty( head, tail );
     
     head       = (head+1)%queue_size;
     (*q)->head = head;
     
     return ZX_Q_SUCCESS;
  }
  
  /* Check if queue is empty */
  /*
   * This function is called each time after we consume an item 
   * from the queue to set appropriate flag
   */
  int zx_is_queue_empty( int head, int tail)
  {
      // head points to next character to be read from queue
      if( head == tail )
         return 1;
      return 0;
  }
  
  /* Check if queue is full */
  /*
   * This function is called each time after we add an item 
   * to the queue to set appropriate flag
   */
  int zx_queue_is_full( int head, int tail, int queue_size)
  {
    // tail points to last node inserted
    if( (tail+1)%queue_size == head )
    {
      return 1;
    }
    return 0;
  }
