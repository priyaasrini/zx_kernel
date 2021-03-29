/*
 * zx_Queue.c
 *
 * This is the file which has all the routines to insert tasks into the 
 * receive queue
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#include <bwio.h>
#include <zx_ready_queue.h>
#include <zx_kernel_config.h>
#include <zx_helper.h>
 
/*
 * Create and initialize the message node for the receive queue
 *
 * Parameters: task id, message, message len
 *
 * Returns : Pointer to the new node created
 */
zx_receive_queue_node* zx_receive_q_create_node( int tid, void *msg, int msglen)
{
    zx_receive_queue_node* node = zx_receive_q_get_node(tid  & TASK_ARRAY_INDEX_PART_MASK);
    node->tid    = tid;
    node->msg    = msg;
    node->msglen = msglen;
    node->next = NULL;
       
    return node;
}

/*
 * Append a task to end of the list
 *
 * Parameters: Priority of the task, task id
 *             Priority of the task should be from 0 to MAX_PRIORITY-1
 *
 */

void zx_receive_q_append_to_end(  int tid, zx_receive_queue_node* new_node )
{   
   int* tail_addr = (int*)zx_receive_q_get_tail_addr(tid  & TASK_ARRAY_INDEX_PART_MASK);
    
   if( *tail_addr == NULL ) {

      *tail_addr = (int)new_node;        
       
       
      /* which means that the queue was empty. Hence update head pointer too */
      int* head_addr = (int*)zx_receive_q_get_head_addr(tid  & TASK_ARRAY_INDEX_PART_MASK);
      *head_addr = (int)new_node;      
   }
   else
   {
      /* We have head already pointing to something */
      zx_receive_queue_node *temp = (zx_receive_queue_node *)(*tail_addr);
      temp->next =  new_node;
      *tail_addr = (int)new_node;
   }  
} 
 
/*
 * Return the ID of the task from the queue that is to be executed next 
 * and move the head pointer to next task in the list
 *
 * Parameter : none
 * 
 * Returns : task ID
 */
zx_receive_queue_node*  zx_receive_q_get_next_node(int tid)
{   
   int *head_addr = zx_receive_q_get_head_addr( tid & TASK_ARRAY_INDEX_PART_MASK );
   
   if( *head_addr == NULL ) return NULL;

   zx_receive_queue_node *temp = (zx_receive_queue_node *)(*head_addr);
   
   *head_addr = (int)(temp->next); // HERE IS THE CRASH!!!!
      
   if( *head_addr == NULL )
   {
      
      /* we just removed the last node. Therefore ... */
      int* tail_addr = zx_receive_q_get_tail_addr(tid  & TASK_ARRAY_INDEX_PART_MASK);
      *tail_addr = NULL;

   }
   
   return temp;
}
 
/*
 * Freeing the node means just to set the node parameters to all 0
 *
 * Parameter : pointer to node
 * 
 * Returns : nothing
 */
void zx_receive_q_free_head( zx_receive_queue_node *node )
{
   node->tid    = 0xffffffff;
   node->msg    = 0x0;
   node->msglen = 0;
   node->next   = 0;
}

/*
 * Get node of a task
 *
 * Parameters : Task ID
 *
 * Return : Pointer to the receive queue node of the task ID
 */
zx_receive_queue_node* zx_receive_q_get_node( int array_index)
{
   return ((zx_receive_queue_node*)(RECEIVE_QUEUE_BASE + ((array_index)*sizeof(zx_receive_queue_node))));
}


/*
 * Get tail pointer for a receive queue insertion
 *
 * Parameters : array_index 
 *
 * Return : pointer to the tail node
 */

int* zx_receive_q_get_tail_addr( int array_index )
{
   return ((int*)(RECEIVE_QUEUE_TAIL_HEADER_BASE + ((array_index)*sizeof(int*))));
}

/*
 * Get head pointer for a priority
 *
 * Parameters : array_index part of the task ID
 *
 * Return : head pointer
 */

int* zx_receive_q_get_head_addr( int array_index )
{
   return ((int*)(RECEIVE_QUEUE_HEAD_HEADER_BASE + ((array_index)*sizeof(int*))));
}

/* ----------------------------------------------------------------------- */


