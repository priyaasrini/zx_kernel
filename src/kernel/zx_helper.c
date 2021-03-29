/*
 * zx_helper.c
 *
 * Contains Helper fucntions used by core kernel routines
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #include <bwio.h>
 
 #include <zx_ready_queue.h>
 #include <zx_tasks.h>
 #include <zx_kernel_config.h>
 #include <zx_helper.h>
 #include <zx_irq_device.h>
 #include <zx_irq_vic.h>

/*
 * --------------------------------------------------------------- 
 * Given a bit array and position, find postion of the next set bit 
 * --------------------------------------------------------------- 
 */
/* 
 * pos = 1 to 8 
 */
int find_next_bit_set( unsigned char byte , int pos )
{ 
 
   while( 1 )
   {     
      if( byte & (0x80 >> (pos-1)) )
      {  
         return (pos);
      }
      pos++;
      
      if( pos > 8 ) break;
   }
   return -1;
}

/* --------------------------------------------------------------- 
 *  Checks if a task ID is valid or not
 * ---------------------------------------------------------------
 */
int zx_is_taskid_valid(int tid)
{
   if( tid == INVALID_TASK_ID )
   {
      return 0;
   }

   int array_index = tid & TASK_ARRAY_INDEX_PART_MASK;
   
   if( array_index < 0 || array_index >= (TASK_COUNT) )
   {
      return 0;
   }
   return 1;
}

/* ---------------------------------------------------------------
 *  Check if the task exists or not
 * ---------------------------------------------------------------
 */
int zx_does_task_exist(int tid)
{
   zx_td *td = zx_get_td( tid );

   if( TASK_STATE_ZOMBIE == td->state)
   {
      return 0;
   }   
   
   if( td->tid != tid )
   {
      return 0;
   }
   return 1;
}


/* --------------------------------------------------------------- 
 * Returns the task ID of the specified by ID task
 * ---------------------------------------------------------------
 */
zx_td* zx_get_td(int tid)
 {
   int id = tid & TASK_ARRAY_INDEX_PART_MASK;
   
   zx_td *td = (zx_td*)(TASK_DESCRIPTOR_BASE + id * sizeof(zx_td));
   return td;
}
  
/* ---------------------------------------------------------------  
 * Returns the task TD of the currently running (if in user mode)
 * last run (if in kernel mode) user task
 * ---------------------------------------------------------------
 */
 zx_td* zx_get_active_td()
 {
   int* current_task_id_addr = (int*)ACTIVE_TASK_ID;
   int current_task_id = (*current_task_id_addr) & TASK_ARRAY_INDEX_PART_MASK; 
   
   zx_td *td = (zx_td*)(TASK_DESCRIPTOR_BASE + current_task_id * sizeof(zx_td));
   return td;
}


/* --------------------------------------------------------------- 
 * Gets the task ID that is currenty running
 * ---------------------------------------------------------------
 */
int zx_get_active_task_id()
{
   return *((int*)ACTIVE_TASK_ID);
}

/* 
 * Sets the task ID of the task to be active
 */
void zx_set_active_task_id(int tid)
{
   int* current_task_id = (int*)ACTIVE_TASK_ID;
   *current_task_id = tid;
}

/* ---------------------------------------------------------------
 * Returns the number of trailing zeros in the variable of 32 bits
 * ---------------------------------------------------------------
 */
int zx_count_trailing_zeros(int x)
{
   int n;
   if (x == 0)
      return 32;
      
   n = 1;
   
   if ((x & 0x0000FFFF) == 0) {n = n + 16; x = x >> 16;}
   if ((x & 0x000000FF) == 0) {n = n + 8; x = x >> 8;}
   if ((x & 0x0000000F) == 0) {n = n + 4; x = x >> 4;}
   if ((x & 0x00000003) == 0) {n = n + 2; x = x >> 2;}
   
   return n - (x & 1);      
}


/* ---------------------------------------------------------------
 * Returns the number of trailing zeros in the variable of 64 bits
 * ---------------------------------------------------------------
 */
int zx_count_trailing_zeros_64(unsigned long long x)
{
   unsigned long long n;
   if (x == 0)
      return 64;
      
   n = 1;

   if ((x & 0x00000000FFFFFFFF) == 0) {n = n + 32; x = x >> 32;}
   if ((x & 0x000000000000FFFF) == 0) {n = n + 16; x = x >> 16;}
   if ((x & 0x00000000000000FF) == 0) {n = n + 8; x = x >> 8;}
   if ((x & 0x000000000000000F) == 0) {n = n + 4; x = x >> 4;}
   if ((x & 0x0000000000000003) == 0) {n = n + 2; x = x >> 2;}
   
   return (int)(n - (x & 1));      
}

unsigned long long zx_set_bit_64(unsigned long long x, int index, int value)
{
   unsigned long long lon_value = (unsigned long long) index;
   lon_value = ((unsigned long long)1 << lon_value);
    
   if (value == 1)
      return (unsigned long long)(x | lon_value);
      
   else // value == 0
      return (unsigned long long)(x & (unsigned long long)(~lon_value));
}

/* -----------------------------------------------------------------------
 * Debug function: print prority queue. The tasks will be printed starting 
 * from the highest priority
 * -----------------------------------------------------------------------
 */
void debug_print_list()
{
   int i=0;
   for( i=0; i<5; i++ )
   {
      bwprintf( COM2, "%x is the current task\n\r", zx_q_get_next_tid() );
   }
   
}


/* ---------------------------------------------------------------------------
 * Debug function: print receive queue. The contents of the receive queue of a 
 * particular task will be printed
 *
 * ATTENTION !!! : Printing this will empty your queue
 *----------------------------------------------------------------------------
 */
void debug_print_receive_queue( int receiver_tid )
{
//   int i=0;
   bwprintf( COM2, "Printing Receiver Queue for task %d\n\r", receiver_tid );
  
   zx_receive_queue_node *node= zx_receive_q_get_next_node( receiver_tid );
   while( node != NULL )
   {
      bwprintf( COM2, "%d is the sender node\n\r", node->tid);
      node = node->next;
   }
   
}

/*
 * Debug function: print the stack contents
 * Argument 1: The type of the stack to print
 *  DEBUG_PRINT_STACK_SP - print current SP
 *  DEBUG_PRINT_STACK_IP - print current IP
 *  DEBUG_PRINT_STACK_CUSTOM - print the stack defined by the pointer in source argument
 * Argument 2: The pointer to the stack if printing DEBUG_PRINT_STACK_CUSTOM
 */

void debug_print_stack(int stack_register, int* source)
{
   int* stack_pointer;
   if (stack_register == DEBUG_PRINT_STACK_SP)
      asm("mov %[v], sp" : [v]"=r"(stack_pointer)); 
   else if (stack_register == DEBUG_PRINT_STACK_IP)
      asm("mov %[v], ip" : [v]"=r"(stack_pointer)); 
   else // custom stack pointer
      stack_pointer = source;
            
   bwprintf( COM2, "Stack (printing, then incrementing): \n");
   int i = 0;
   for( i = 0; i < 10; i++ )
   {
      bwprintf( COM2, "Addr (hex): %x. Value (hex): %x. Value (dec): %d.\n", stack_pointer, *stack_pointer, *stack_pointer);
      stack_pointer++;     
   }
   
}

// pseudo-random values generator

unsigned int zx_random(unsigned int previous)
{
   return (previous * 214013 + 2531011) % (1 << 15);
}

unsigned int zx_random_range(unsigned int previous, unsigned int limit, unsigned int* new_random)
{
   int divisor = MAX_RANDOM / (limit + 1);
   unsigned int result;
   unsigned int current_random = previous;
   
   while (1)
   {
      current_random = zx_random(current_random);      
      result = current_random / divisor;
      if (result <= limit)
         break;
   }
   
   *new_random = current_random;
   
   return result;
}

