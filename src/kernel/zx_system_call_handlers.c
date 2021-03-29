/*
 * zx_system_call_handlers.c
 *
 * File containing defintion of zx_kernel system 
 * call handler routines and their specific helpers
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#include <zx_ready_queue.h>
#include <zx_tasks.h>
#include <zx_helper.h>
#include <zx_kernel_config.h>
#include <zx_system_call_handlers.h>
#include <zx_system_calls.h>
#include <zx_memory.h>
#include <zx_err.h>
#include <zx_irq_device.h>
#include <zx_irq_vic.h>

#include <bwio.h>

/* 
 * HANDLER  OF SYSTEM CALL : int MyParentTid();
 *
 * The function that is executed in supervisor mode to get the parent
 * ID of the user task which made a call to the system call MyParentTid()
 *
 * Returns Parent ID of the task which called MyParentTid()
 * If the parent is in ZOMBIE_STATE, returns 0
 */
int zx_parent_tid()
{
   zx_td *current_td = zx_get_active_td(); // getting current task TD
   int parent_tid =  current_td->pid;
   zx_td *ptd = zx_get_td(parent_tid);
   
   if( ptd->state != TASK_STATE_ZOMBIE )
   {
      return parent_tid;
   }
   
   return 0;
}

/*
 * HANDLER  OF SYSTEM CALL : int MyTid();
 * 
 * The function that is executed in supervisor mode to get the ID
 * of the user task which made a call to the system call MyTid()
 *
 * Returns ID of the task which called MyTid()
 */
 
int zx_my_tid()
{
   return zx_get_active_task_id();
}

/* 
 * HANDLER  OF SYSTEM CALL : void Exit();
 *
 * The function that is executed in supervisor mode exit the
 * task which called Exit()
 */
void zx_exit()
{
   zx_td* mytd = zx_get_active_td();
   
   zx_kill( mytd->tid );
}

/* 
 * HANDLER  OF SYSTEM CALL : int Create( int priority, void *code(void));
 *
 * The function that is executed in supervisor mode to create to task
 */
int zx_create( int priority, void (*zx_task)() )
{
   int array_index;

   /* read the tid to be used from predefined location */
   /* This is a pseudoglobal */
   
  unsigned long long *td_bit_data_ptr = (unsigned long long*)(TD_BIT_DATA); // getting the 64-bit data about the available place for TDs.
   
   // Task id (32 bits) consists of two parts: left - unique part (24 bits), right - array index part (8 bits)
   
   unsigned long long td_bit_data = *td_bit_data_ptr;
   
   /* If IDLE_TASK, then give preassumed TASK ID */
   if( (int)zx_task == (int)IDLE_TASK )
   {
      /* We assume this task ID is always free when we initialize the kernel */
      array_index = IDLE_TASK_TID;
   }
   else
   {
      array_index = zx_count_trailing_zeros_64(td_bit_data); // 1 means the place is avaiable
   }
     
   if (array_index == TASK_COUNT) // there is no space for TDs at all!
      return ERR_CANNOT_CREATE_TASK;

   td_bit_data = zx_set_bit_64(td_bit_data, array_index, 0); // zero means the place is OCCUPIED!!!

   zx_memcpy(td_bit_data_ptr, &td_bit_data, sizeof(unsigned long long));
   
   zx_td *new_td = zx_get_td(array_index); 
 
   int generation_number = (new_td->tid >> 8);
  
   generation_number++;
   
   if( (int)zx_task == (int)zx_idle )
   {
      /* THE task ID and the generation number is always reserved for IDLE TASK */
      generation_number = 0;
   }
   
   new_td->tid &= ARRAY_INDEX_MASK;
   new_td->tid |= (generation_number << 8);
//   bwprintf(COM2, "zx_create: Creating Task with ID %x!!!!!\n", new_td->tid);
   
   new_td->pid      = zx_my_tid();
   new_td->state    = TASK_STATE_READY;
   new_td->priority = priority;

   new_td->stack_limit =  (int*)(USER_STACK_SPACE_BASE + (array_index * TASK_STACK_SPACE_SIZE));   
   new_td->stack_base  =  (int*)(new_td->stack_limit + TASK_STACK_SPACE_SIZE);
 
   // if we are creating a notifier, we make it uninterruptable
/*
   if 
   (
   (priority == ZX_CLOCK_NOTIFIER_PRIORITY) ||
   (priority == ZX_UART1_TX_NOTIFIER_PRIORITY) ||
   (priority == ZX_UART1_RX_NOTIFIER_PRIORITY) ||
   (priority == ZX_UART2_TX_NOTIFIER_PRIORITY) ||
   (priority == ZX_UART2_RX_NOTIFIER_PRIORITY)
   )
*/
//   if (priority <= 10) // just for all tasks with the priority less than or equal to 10               
//   {
//      new_td->spsr         =  TASK_NONINTERRUPTABLE_CPSR;   
//   }
//   else
//   {
      new_td->spsr         =  TASK_NORMAL_CPSR;
//   }
      
   new_td->return_value =  TASK_NO_RETURN_VALUE;   

   new_td->sp = (int*)zx_initialize_stack( new_td->stack_base, (void*)zx_task );
   
   /* 'new_td->heap_head' and 'new_td->heap_tail' are initialized in this call */
   zx_heap_create((int*)new_td);
   
   return new_td->tid;   
}

/* 
 * HANDLER  OF SYSTEM CALL : int  Send( int tid, char *message, int msglen, char *reply, int replylen )
 *
 * The function that is executed in supervisor mode to send message to a task
 */
void  zx_send( int recv_tid, void *message, int msglen, void *reply, int replylen )
{ 
   int *sp; // define a stack pointer variable, we will use it to work with stack
   
   // getting sender task descriptor. This is a TD of the active task
   zx_td *sendertd   = (zx_td*)zx_get_active_td();
   
   // if trying to send to myselft of the taskid is not valid at all
   if((recv_tid == sendertd->tid) ||  !(zx_is_taskid_valid( recv_tid )) )
   {
      sendertd->return_value = ERR_IMPOSSIBLE_TASKID;
      // exit: impossible task ID
      return;
   }
      
   // if task does not exist
   if( !(zx_does_task_exist( recv_tid )) )
   {
      sendertd->return_value = ERR_NONEXISTENT_TASK;
      // exit: task does not exist
      return;
   }

   // getting the receiver task descriptor.
   zx_td *receivertd = (zx_td*)zx_get_td(recv_tid);

   if (receivertd->state == TASK_STATE_REPLY_BLOCKED)
   {
      sendertd->return_value = ERR_SEND_RECEIVE_REPLY_TRANSACTION_INCOMPLETE;
      // exit: send receive reply transaction is incomplete
      return;   
   }

   /* remove the sender task from ready queue */
   zx_q_remove_node( sendertd->tid , sendertd->priority );   
   
   /* push reply and replylen to stack of the sender to retrieve them later when the reply is ready */

   sp = sendertd->sp;   // load the saved value of the stack pointer of the sender  
      sp--;                // decrement stack pointer
      *sp = (int)reply;    // then push
      sp--;                // decrement stack pointer
      *sp = replylen;      // then push
   sendertd->sp = sp;   // save new value of stack pointer, since we pushed some values 
 
   
   if( TASK_STATE_SEND_BLOCKED == receivertd->state )
   /* There is a task in send blocked state waiting for this message */
   {
   
      /* 
       * popping the stack in same order as it was stored by the 
       * receive before the task went to blocked state 
       */
       
      sp = receivertd->sp;          // load the saved value of the stack pointer of the receiver      
         int *sender_tid = (int*)(*sp);         // get sender tid pointer stored on the stack 
         sp++;                                  // then increment the stack pointer
         void *receive_message = (void*) (*sp); // get the pointer of where to put the message to
         sp++;                                  // then increment the stack pointer
         int receive_msglen = (int)(*sp);       // get the message length
         sp++;                                  // then increment the stack pointer
      receivertd->sp = sp;          // store the stack pointer back, since we changed it
   
         
      *sender_tid = zx_get_active_task_id();                   // set the sender tid value to the CURRENT task tid
      zx_memcpy( receive_message, message, receive_msglen );   // copy the message to the appropriate place
         
      receivertd->return_value = msglen;                       // assign the return value
      
      /* Move the sender task to reply blocked state */
      sendertd -> state = TASK_STATE_REPLY_BLOCKED;
      
      // receiver has got the message, so it goes to the ready state to unblock it
      receivertd->state = TASK_STATE_READY;      
      // BUT NEED TO PUT RECEIVER BACK TO READY QUEUE!
      // AND NOT JUST TO THE END, but to the first place to run!!!

      zx_q_append_to_penultimate( recv_tid, receivertd->priority ); // TODO: IS IT RIGHT TO DO???
             
   }
   else
   /*There is no task waiting for this message. So add the message at the end of the queue */
   {    
      /* add the node to the receive queue */
      zx_receive_queue_node *receive_queue_node = zx_receive_q_create_node( sendertd->tid, message, msglen );      
      zx_receive_q_append_to_end( recv_tid, receive_queue_node );
      
      sendertd -> state = TASK_STATE_RECEIVE_BLOCKED; // switch the sender to the receive-blocked state      
   }
   
   return;
   
}

/* 
 * HANDLER  OF SYSTEM CALL : int  Receive( int *tid, char *message, int msglen )
 *
 * The function that is executed in supervisor mode to receive from a task
 */
void  zx_receive( int *sendertid, void *message, int msglen)
{ 
   zx_td *receivertd  = (zx_td*)zx_get_active_td();   // get the reciever task descriptor - an active TD 
   int   recv_tid     = receivertd->tid;              // get the receiver task ID - and active task id
      
   // get somebody that has send the message to this task
   zx_receive_queue_node *receive_queue_node = zx_receive_q_get_next_node( recv_tid );
        
   // if no senders at all
   if( receive_queue_node == NULL )
   {
   //   bwprintf(COM2, "Enter 5! \n"); 
      
      /* go to TASK_STATE_SEND_BLOCKED state */
      receivertd -> state = TASK_STATE_SEND_BLOCKED;
      
      /* remove the receiver task from ready queue */
      zx_q_remove_node( recv_tid,  receivertd->priority );
      
      /* push the arguments of the receiver task into the receiver stack */
      /* pop in the same order in zx_send when you want to fill in the values*/
      int *sp = receivertd -> sp;
         sp--;
         *sp = msglen;
      
         sp--;
         *sp = (int)message;
      
         sp--;
         *sp = (int)sendertid;
      receivertd -> sp = sp; // write SP back
      
   }
   else
   {
      int sender_tid_from_q = receive_queue_node->tid; // get sender's tid from the queue node
   
      *sendertid = sender_tid_from_q;                  // set sender's tid to the one from the queue
      
      zx_td *sendertd  = zx_get_td( sender_tid_from_q ); // get sender's td
      
      sendertd->state = TASK_STATE_REPLY_BLOCKED;        // change sender's task state

      //copy the message from sender's address space to receiver's address space
      zx_memcpy( message ,receive_queue_node->msg, msglen ); 

      // Copy the number of bytes received to receiver's return value
      receivertd->return_value = receive_queue_node ->msglen;  
      
      // free the node which had the message
      zx_receive_q_free_head( receive_queue_node );
   }
  
   
}

/* 
 * HANDLER  OF SYSTEM CALL : int  Reply( int *tid, char *message, int msglen )
 *
 * The function that is executed in supervisor mode to receive from a task
 */
void  zx_reply( int sendertid, void *reply, int reply_len)
{ 

   zx_td *reply_td = (zx_td*)zx_get_active_td(); // get the task descriptor of the task that is replying (active task)
   int sender_reply_buffer_len = 0;
   
   /* ------------------ ERROR CHECKING -------------------------------*/
   
   // check if the sendertid is valid
   if( !(zx_is_taskid_valid(sendertid )) )
   {
      reply_td -> return_value = ERR_IMPOSSIBLE_TASKID;
      return;
   }
   
   // check if the sender is existent
   if( !(zx_does_task_exist(sendertid )) )
   {
      reply_td -> return_value = ERR_NONEXISTENT_TASK;
      return;
   }
   
   zx_td *sender_td = zx_get_td( sendertid ); // get the TD of the sender we are replying to
   
   int   *sender_sp = sender_td->sp;            // copy the sender's stack pointer
   
      
   // check if the sender is reply blocked
   if( sender_td -> state != TASK_STATE_REPLY_BLOCKED )
   {
      reply_td -> return_value = ERR_SENDER_NOT_REPLY_BLOCKED;
      return;        
   }
   
   sender_reply_buffer_len = *sender_sp;        // get the replylen from the top of the sender's stack
   sender_sp++;
   
   //check if the sender buffer has enough space to receive reply
   if( sender_reply_buffer_len < reply_len )
   {
      reply_td -> return_value = ERR_INSUFFICIENT_REPLY_BUFFER;
      return;
   }   

   /* ------------------ ERROR CHECKING ENDS--------------------------*/

   void *sender_reply_buffer_ptr = (void*)(*sender_sp);  // get the reply buffer of the sender. It is at the top of its stack
   sender_sp++;
   
   //write the sp back
   sender_td->sp = sender_sp;
   
   // copy the message to sender's address space
   zx_memcpy( (char*)sender_reply_buffer_ptr, reply, reply_len );
   
   // update the return value of sender's task which is waiting for reply
   sender_td->return_value = reply_len;
   
   // update the state of the sender's task as READY
   sender_td->state = TASK_STATE_READY;
   
   // Add the sender's task to back of the ready queue
   if( sender_td->priority == reply_td->priority )
   {
      /* at this point the task which called the reply system call
       * will be suspended and at the end of the ready queue. But by 
       * kernel spec, the sender task should run first . So we add the
       * sender node to the penultimate node, so that it would be before
       * the reply task in the queue
       
       * WE DO ALL THIS BECAUSE OUR READY QUEUE's HEAD ALWAYS POINTS 
       * THE NEXT TASK TO BE EXECUTED FROM THE READY QUEUE RATHER THAN
       * THE TASK LAST RUN FROM THE READY QUEUE
       */       
       zx_q_append_to_penultimate( sendertid, sender_td->priority );       
    }
    else
    {
      /* no problem :) reply task and sender task are of different priority
         so just sender to end of its queue
       */
       zx_q_append_to_end( sendertid, sender_td->priority );
    }
    
    reply_td -> return_value = 0; // reply successful
    return;
}

/* 
 * HANDLER  OF SYSTEM CALL : int  AwaitEvent( int Event_ID )
 *
 * The function that is executed in supervisor mode to wait for a particular event
 * For list of events, look in file ###
 */
void zx_await_event(int event_number)
{
   int* addr;

   switch (event_number)
   {
      case EVENT_TIMER:
         addr = (int*)(AWAIT_TIMER_TID); 
         //zx_device_intr_on( INTR_SOURCE_TIMER_1 );  because we are turning it off and on  
         break;
         
      case EVENT_UART1_RX:
         addr = (int*)(AWAIT_UART1_RX_TID);    
         zx_device_intr_on(INTR_SOURCE_UART1_RX); // IMPORTANT: Enabling the interrupt      
         break;
         
/* ----------- Since we have 2 different interrupt assosciated with transmit ------ */
      case EVENT_UART1_TX:
         addr = (int*)(AWAIT_UART1_TX_TID);     
         zx_device_intr_on(INTR_SOURCE_UART1_TX); 
         zx_device_intr_on(INTR_SOURCE_UART1_MODEM);
     
         break;         
/* -------------------------------------------------------------------------------- */

      case EVENT_UART2_RX:
         addr = (int*)(AWAIT_UART2_RX_TID);  
         zx_device_intr_on(INTR_SOURCE_UART2_RX); // IMPORTANT: Enabling the interrupt      
         break;
      case EVENT_UART2_TX:
         addr = (int*)(AWAIT_UART2_TX_TID);
         zx_device_intr_on(INTR_SOURCE_UART2_TX); // IMPORTANT: Enabling the interrupt
         break;
      default:
         bwprintf(COM2, "zx_await_event: Unsupported event_number: %d.\n", event_number);
         return;
         break;
   }

   zx_td* td = zx_get_active_td();
   
   /* Move the task to event blocked state */
   td->state = TASK_STATE_EVENT_BLOCKED;
   
   /* Remove the node from ready queue */
   zx_q_remove_node( td->tid , td->priority );
   *addr = td->tid;
}

/*
 * Not a system call
 * Fucntion called by main kernel loop when a hardware interrupt is generated 
 * Parameter : Source of Interrupt
 */
void zx_handle_hwi(int device_number)
{
   switch (device_number)
   {
      case INTR_SOURCE_TIMER_1:
         zx_handle_timer_interrupt(0);
         break;
      case INTR_SOURCE_UART1_RX:
         zx_handle_uart_interrupt(INTR_SOURCE_UART1_RX, 0);
         break;
      case INTR_SOURCE_UART1_TX:
         zx_handle_uart1_transmit_interrupt(INTR_SOURCE_UART1_TX, 0);
         break;
      case INTR_SOURCE_UART1_MODEM:
         zx_handle_uart1_transmit_interrupt(INTR_SOURCE_UART1_MODEM, 0);
         break;
      case INTR_SOURCE_UART2_RX:
         zx_handle_uart_interrupt(INTR_SOURCE_UART2_RX, 0);
         break;
      case INTR_SOURCE_UART2_TX:
         zx_handle_uart_interrupt(INTR_SOURCE_UART2_TX, 0);
         break;
      default:
//         bwprintf(COM2, "zx_handle_hwi: Unsupported device_number: %d.\n", device_number);
         break;
   }
}

/* Kill a task */
void zx_kill( int tid )
{
   zx_td* mytd = zx_get_td(tid);
   
   int part_array = (mytd->tid) & (TASK_ARRAY_INDEX_PART_MASK);
   
   unsigned long long * td_bit_data_ptr = (unsigned long long*)(TD_BIT_DATA);
   unsigned long long td_bit_data = * td_bit_data_ptr;
   
   td_bit_data = zx_set_bit_64(td_bit_data, part_array, 1); // setting to 1 means the place is free!
   
   zx_memcpy(td_bit_data_ptr, &td_bit_data, sizeof(unsigned long long));
   
   mytd->state = TASK_STATE_ZOMBIE;
   zx_q_remove_node(part_array, mytd->priority );
}

/* ShutDown the Kernel and go back home */
void zx_shutdown()
{
   /* Unblock all the tasks waiting for interrupts because these interrupts
      will not be generated anymore 
    */
   zx_handle_timer_interrupt(1); 
   zx_handle_uart_interrupt(INTR_SOURCE_UART1_RX, 1);
   zx_handle_uart_interrupt(INTR_SOURCE_UART2_RX, 1);
   zx_handle_uart_interrupt(INTR_SOURCE_UART2_TX, 1);
   zx_handle_uart1_transmit_interrupt(INTR_SOURCE_UART1_TX, 1);
   
   zx_timer_disable( IDLE_TASK_TIMER );
   zx_timer_disable( IRQ_TIMER );
   
   zx_reset_all_interrupts(); 
      
   /* REMOVING IDLE TASK FROM READY QUEUE ..................*/
   
      zx_td *idletd = zx_get_td(IDLE_TASK_TID);
      idletd->state = TASK_STATE_ZOMBIE;
      zx_q_remove_node(IDLE_TASK_TID, idletd->priority );
}

/* 
 * Function to initialize the stack of newly created task. This is to make the newly created task
 * look like it has been already running and had been context switched by the kernel sometime ago.
 * This saves us from an extra task state which is NEWLY_CREATED_TASK
 */
int zx_initialize_stack( int* base, void *zx_task )
{
   int* stack_top = base;

   *stack_top = (int)(zx_task); // PC
      stack_top--;
   *stack_top = R12_INIT_VAL;//(int)(base); // R12 (IP) 14 decrements by 4
      stack_top--;
   *stack_top = R11_INIT_VAL; // R11
      stack_top--;
   *stack_top = R10_INIT_VAL; // R10
      stack_top--;
   *stack_top = R9_INIT_VAL;  // R9
      stack_top--;
   *stack_top = R8_INIT_VAL;  // R8
      stack_top--;
   *stack_top = R7_INIT_VAL;  // R7
      stack_top--;
   *stack_top = R6_INIT_VAL;  // R6
      stack_top--;
   *stack_top = R5_INIT_VAL;  // R5
      stack_top--;
   *stack_top = R4_INIT_VAL;  // R4
      stack_top--;
   *stack_top = R3_INIT_VAL;  // R3
      stack_top--;
   *stack_top = R2_INIT_VAL;  // R2
      stack_top--;
   *stack_top = R1_INIT_VAL;  // R1
      stack_top--;
   *stack_top = R0_INIT_VAL;  // R0         
      stack_top--;

   *stack_top = (int)(zx_task); // LR
   
   return (int)stack_top; // return the top of the stack
}

int debug_many_args( zx_request* req)
{
	bwprintf(COM2, "Arg1: %x. \n", req->arg1);
	bwprintf(COM2, "Arg2: %x. \n", req->arg2);
	bwprintf(COM2, "Arg3: %x. \n", req->arg3);
	bwprintf(COM2, "Arg4: %x. \n", req->arg4);
	bwprintf(COM2, "Arg5: %x. \n", req->arg5);
	bwprintf(COM2, "Arg6: %x. \n", req->arg6);
	bwprintf(COM2, "Arg7: %x. \n", req->arg7);
	return 0x99999999;
}


