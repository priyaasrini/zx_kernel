/*
 * zx_Queue.c
 *
 * This is the file which has all the routines to insert tasks into the 
 * ready queue
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#include <bwio.h>
#include <zx_ready_queue.h>
#include <zx_kernel_config.h>
#include <zx_helper.h>
 
/*
 * Create and initialize the node for the task
 *
 * Parameters: task id
 *
 * Returns : Pointer to the new node created
 */
zx_ready_queue_node* zx_q_create_node( int tid)
{
    zx_ready_queue_node* node = zx_q_get_node(tid  & TASK_ARRAY_INDEX_PART_MASK);
    node->tid  = tid;
    node->next = NULL;
    node->prev = NULL;
       
    return node;
}

/*
 * Append a task to end of the list
 *
 * Parameters: Priority of the task, task id
 *             Priority of the task should be from 0 to MAX_PRIORITY-1
 *
 */

void zx_q_append_to_end(  int tid, int priority )
{   
   int* head_addr = zx_q_get_head_addr(priority);
   zx_ready_queue_node* new_node = zx_q_create_node( tid);
   
   zx_td *td = zx_get_td(tid);
   if( td->state == TASK_STATE_ZOMBIE )
   {
      return;
   }
    
   if( *head_addr == NULL ) {
      *head_addr = (int)new_node;     
      new_node->next = new_node->prev = new_node;
   }
   else
   {
      /* We have head already pointing to something */
      zx_ready_queue_node *next_node = (zx_ready_queue_node *)(*head_addr);
      zx_ready_queue_node *prev_node = ((zx_ready_queue_node *)(*head_addr))->prev;
    
      prev_node->next = new_node;
      new_node->next  = next_node;
      next_node->prev = new_node;
      new_node->prev  = prev_node;
   }  
   
   zx_q_add_priority(priority);
} 

/* 
 * This function is used to add the send task before the reply task
 * when the reply task awakes the sender task that the reply is ready
 */

void zx_q_append_to_penultimate(  int tid, int priority )
{   
   int* head_addr = zx_q_get_head_addr(priority);
   zx_ready_queue_node* new_node = zx_q_create_node( tid);
    
   if( *head_addr == NULL ) {
      /* Ideally we should not reach here. penultimate means a
         task is already in the ready queue
       */
      *head_addr = (int)new_node;     
      new_node->next = new_node->prev = new_node;
   }
   else
   {
      /* We have head already pointing to something */
      zx_ready_queue_node *end_node          = ((zx_ready_queue_node *)(*head_addr))->prev;
      zx_ready_queue_node *pen_ultimate_node = end_node->prev;
    
      pen_ultimate_node->next = new_node;
      new_node->next  = end_node;
      end_node->prev  = new_node;
      new_node->prev  = pen_ultimate_node;
      
      /* if only reply task was running, move the head pointer to this task*/
      if( *head_addr == (int)end_node )
      {
         *head_addr = (int)new_node;
      }
   }  
   
   zx_q_add_priority(priority);
} 

/*
 * add a priority, meaning that there is at least one task of such priority
 *
 * priority : task priority
 *
 * return none
 */
void zx_q_add_priority( int new_priority)
{
  unsigned int *priority_addr = (unsigned int*)(PRIORITY_BIT_DATA);
  unsigned int priority_data = *priority_addr;
  priority_data |= (1 << (new_priority));
  *priority_addr = priority_data;
}

/*
 * remove a priority, meaning that there are more tasks of such priority
 *
 * priority : task priority
 *
 * return none
 */

void zx_q_remove_priority( int priority)
{
  unsigned int *priority_addr = (unsigned int*)(PRIORITY_BIT_DATA);
  unsigned int priority_data = *priority_addr;
  priority_data = priority_data & (~(1 << (priority)));
  *priority_addr = priority_data;
}



/*
 * get the highest priority
 *
 * priority : read priority
 *
 * return the highest priority
 */
int zx_q_get_highest_priority()
{
  unsigned int *priority_addr = (unsigned int*)(PRIORITY_BIT_DATA);  
  unsigned int priority_data = *priority_addr;
 
  int result = zx_count_trailing_zeros(priority_data);
  
  return result; 
}



/*
 * Remove node from the list
 *
 * Parameter : task id of the node to be removed from the queue
 * 
 * Returns : nothing
 */
void zx_q_remove_node( int tid, int priority )
{
    zx_ready_queue_node* node = zx_q_get_node(tid & TASK_ARRAY_INDEX_PART_MASK);
 
    if ( node->next == NULL || node->prev == NULL ) return;
 
    zx_ready_queue_node *prev = node->prev;
    zx_ready_queue_node *next = node->next;
    
    if( node == prev && node == next ) 
    {
        // removing last node from the queue
        int* head_addr = zx_q_get_head_addr ( priority );
        zx_q_remove_priority(priority);
        *head_addr = NULL;
    }
    else
    {
        prev->next = node->next;
        next->prev = node->prev;
    }
    
    zx_q_free_node(node);   
 }
 
/*
 * Return the ID of the task from the queue that is to be executed next 
 * and move the head pointer to next task in the list
 *
 * Parameter : none
 * 
 * Returns : task ID
 */
int  zx_q_get_next_tid()
{   
   int priority = zx_q_get_highest_priority();
   
   if (priority == PRIORITY_COUNT) // there are no more tasks
      return -1;
      
   int *head_addr = zx_q_get_head_addr( priority );

   zx_ready_queue_node* head = (zx_ready_queue_node *)(*head_addr);
   
   int tid = head->tid; 

   *head_addr = (int)head->next;   
   
   return tid;
}
 
/*
 * Freeing the node means just to set the node parameters to all 0
 *
 * Parameter : pointer to node
 * 
 * Returns : nothing
 */
void zx_q_free_node( zx_ready_queue_node *node )
{
   node->tid  = 0;
   node->next = 0;
   node->prev = 0;
}

/*
 * Get node of a task
 *
 * Parameters : Task ID
 *
 * Return : Pointer to the node of the task ID
 */
zx_ready_queue_node* zx_q_get_node( int tid )
{
   return ((zx_ready_queue_node*)(READY_QUEUE_BASE + ((tid)*sizeof(zx_ready_queue_node))));
}

/*
 * Get head pointer for a priority
 *
 * Parameters : Priority
 *
 * Return : head pointer
 */

int* zx_q_get_head_addr( int priority )
{
   return ((int*)(READY_QUEUE_HEADER_BASE + (priority*sizeof(int*))));
}

/* ----------------------------------------------------------------------- */


