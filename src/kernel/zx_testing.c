/*
 * zx_kernel_testing.h
 *
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#include <ts7200.h>
#include <zx_system_calls.h>
#include <zx_kernel_body.h>
#include <zx_kernel_head.h>
#include <zx_tasks.h>
#include <zx_ready_queue.h>

#include <zx_kernel_config.h>
#include <zx_testing.h>

#include <zx_memory.h>
#include <zx_ns_tree.h>
#include <zx_ns.h>

#include <zx_queue.h>
#include <zx_uart_io.h>

#include <zx_project.h>

#include <zx_project_track_sensing.h>

#include <zx_project_test_functions.h>

/*
* This module is used for testing
* There are certain test tasks that are to be created in main task.
* Each task tests some aspects of the system: calling a function with many arguments,
* creating many tasks, creating many send-receive-reply transactions, etc.
*/

/*=========================================*/
/*=========================================*/
/*=========================================*/
/* Test: Assignment 1 */
/*=========================================*/
/*=========================================*/
/*=========================================*/


   /* Other task of Kernel Assignment 1 */
   void test1_other_task()
   {
      int tid       = MyTid();
      int parent_id = MyParentTid();
      
      zx_printf( COM2, "MyTid: %d, MyParentTid: %d\n", tid, parent_id );
      
      Pass();
      
      zx_printf( COM2, "MyTid: %d, MyParentTid: %d\n", tid, parent_id );
      
      Exit();
   }

/* First User task of Kernel Assignment 1 */
void test1()
{
   //Creating 2 tasks of lower priority
	int tid1 = Create( FIRST_USER_TASK_PRIORITY+1, &test1_other_task );
	zx_printf( COM2, "Created: %d\n", tid1 );
	
	int tid2 = Create( FIRST_USER_TASK_PRIORITY+1, &test1_other_task );
	zx_printf( COM2, "Created: %d\n", tid2 );
	
	//Creating tasks of higher priority
	int tid3 = Create( FIRST_USER_TASK_PRIORITY-1, &test1_other_task );
	zx_printf( COM2, "Created: %d\n", tid3 );
	
	int tid4 = Create( FIRST_USER_TASK_PRIORITY-1, &test1_other_task );
	zx_printf( COM2, "Created: %d\n", tid4 );
	
	zx_printf( COM2, "First: Exiting\n" );
//	Exit(); do not exit!!!
}

/*=========================================*/
/*=========================================*/
/*=========================================*/
/* TEST: Creating tasks and argument passing testing  */
/*=========================================*/
/*=========================================*/
/*=========================================*/

   void test2_other_task()
   {
      int tid       = MyTid();
      int parent_id = MyParentTid();
      
      zx_printf( COM2, "MyTid: %d, MyParentTid: %d\n", tid, parent_id );
      
      Pass();
      
      zx_printf( COM2, "MyTid: %d, MyParentTid: %d\n", tid, parent_id );
      
      Exit();
   }

void test2()
{
	zx_printf( COM2, "First: Starting\n" );
	int result = DebugManyArgs(0x11111112, 0x22222223, 0x33333334, 0x44444445, 0x55555556, 0x66666667, 0x77777778);
	zx_printf( COM2, "Result: %x. \n",  result);

   int i;
   for (i = 0; i < 66; i++)
   {
      int priority = 0;
      
      if (i == 2 || i == 20 || i == 60)
         priority = FIRST_USER_TASK_PRIORITY - 1;
      else
         priority = FIRST_USER_TASK_PRIORITY + 1;
         
   	int tid1 = Create( priority, &test2_other_task );
   	if (tid1 == -1)
   	{
   	   zx_printf( COM2, "Task Limit Exceeded");
   	   Exit();
   	}
   	zx_printf( COM2, "Created: %x\n", tid1 );   
   }

   zx_printf( COM2, "Value: %x\n", GLOBAL_VARIABLES_BASE + 0x4);   

//	Exit(); do not exit!!!
}

/*=========================================*/
/*=========================================*/
/*=========================================*/
/* TEST: Send-receive-reply routines  */
/*=========================================*/
/*=========================================*/
/*=========================================*/

void sender_task();
void receiver_task();

void test3()
{
	zx_printf( COM2, "\nFirst: Starting\n" );

	int tid1 = Create( FIRST_USER_TASK_PRIORITY+2, &sender_task );
	zx_printf( COM2, "Created Sender1: %x\n", tid1 );
	
   tid1 = Create( FIRST_USER_TASK_PRIORITY+2, &sender_task );
	zx_printf( COM2, "Created Sender2: %x\n", tid1 );
	
	int tid2 = Create( FIRST_USER_TASK_PRIORITY+1, &receiver_task );
	zx_printf( COM2, "Created Receiver: %x\n", tid2 );
		
//	Exit(); do not exit!!!
}

   // nested functions for this test

   void SendMessageTo(int receiver_tid, int from_id, char* ptext)
   {
      char message[30]; 
      
      
      char reply[30];
      int reply_len  = 30;

      int msg_len  = 0;   
      
      char* text = ptext;
      
      while (*text != 0)
      {
         message[msg_len++] = *text;
         text++;      
      }
      
      message[msg_len] = 0;

      zx_printf( COM2, "--- oooo -- TASK %d: Sending to: %d of the length=%d...\n", from_id, receiver_tid, msg_len); 
      
      int no_of_bytes = Send( receiver_tid, &message, msg_len, reply, reply_len );
      
      zx_printf( COM2, "--- oooo -- TASK %d: Return value of Send() : %d bytes\n", from_id, no_of_bytes );
      
      if( no_of_bytes > 0 )
      {
         reply[no_of_bytes] = 0;
         zx_printf( COM2, "--- oooo -- TASK %d: Reply received: '%s'.\n",  from_id, reply );
      }
      else
      {
         zx_printf( COM2, "--- oooo -- TASK %d: Reply Not Received. Error: %d\n", from_id, no_of_bytes);
      } 

   }


   void ReplyMessageTo(int tid, int from_id, char* ptext)
   {
      char reply[30];
      
      int reply_len  = 0;
      
      char* text = ptext;   
         
      while (*text != 0)
      {
         reply[reply_len++] = *text;     
         text++; 
      }
      
      reply[reply_len] = 0;

      zx_printf( COM2, "--- oooo -- TASK %d: REPLYING with '%s'..\n", from_id,  reply); 
         
      int result = Reply(tid, &reply, reply_len);
      
      if( result == 0 )
      {
         zx_printf( COM2, "--- oooo -- TASK %d: REPLY SUCCESSFUL ___\n",  from_id);    
      }
      else
      {
         zx_printf( COM2, "--- oooo -- TASK %d: REPLYING ERROR :( %d\n", from_id, result );
      }
   }




   int ReceiveMessage(int from_id)
   {  
      char message[30];
      char msg_len=30;   
      int tid;  
      
      zx_printf( COM2, "\n\r--- oooo -- TASK %d: Receiving... \n", from_id);    
      
      int no_of_bytes = Receive( &tid, &message[0], msg_len );
     
      if( no_of_bytes > 0 )
      {
         zx_printf( COM2, "--- oooo -- TASK %d: Message received from tid = %x. Bytes:%d\n", from_id, tid, no_of_bytes );
         message[no_of_bytes] = 0;
         zx_printf(COM2,    "Message:'%s'\n", message);
      } 
      else 
         zx_printf( COM2, "--- oooo -- TASK %d: ERROR receiving. Error code: %d\n", from_id, no_of_bytes);     
         
      return tid; 
   }

   void sender_task()
   {
      SendMessageTo(3, MyTid(), "MESMESMES1");
      SendMessageTo(3, MyTid(), "MESMESMESMES2");
      SendMessageTo(3, MyTid(), "MESMESMESMESMESMES3");
      SendMessageTo(3, MyTid(), "MESMESMESMESMESMESMESMESMES");  
         
      int tid       = MyTid();
      int parent_id = MyParentTid();
      
      zx_printf( COM2, "MyTid: %x, MyParentTid: %x\n", tid, parent_id );   
            
      zx_printf( COM2, "--- oooo -- TASK %d: Finished... \n\r", MyTid());  
         
      Exit();
   }

   void receiver_task()
   {
      int sender;

      sender = ReceiveMessage(MyTid()); 
      ReplyMessageTo(sender, MyTid(), "REPLY1");
        
      sender = ReceiveMessage(MyTid()); 
      ReplyMessageTo(sender, MyTid(), "REPLY 2");
        
      sender = ReceiveMessage(MyTid()); 
      ReplyMessageTo(sender, MyTid(), "REPLY  3");
                   
      sender = ReceiveMessage(MyTid()); 
      ReplyMessageTo(sender, MyTid(), "REPLY   4");



      sender = ReceiveMessage(MyTid()); 
      ReplyMessageTo(sender, MyTid(), "REPLY1");
        
      sender = ReceiveMessage(MyTid()); 
      ReplyMessageTo(sender, MyTid(), "REPLY 2");
        
      sender = ReceiveMessage(MyTid()); 
      ReplyMessageTo(sender, MyTid(), "REPLY  3");
                   
      sender = ReceiveMessage(MyTid()); 
      ReplyMessageTo(sender, MyTid(), "REPLY   4");         
              
              
      zx_printf( COM2, "--- oooo -- TASK %d: Finished... \n\r", MyTid());   
      Exit();
   }

/*=========================================*/
/*=========================================*/
/*=========================================*/
/* TEST: Testing BST tree  */
/*=========================================*/
/*=========================================*/
/*=========================================*/
void test4()
{
	zx_printf( COM2, "\nFirst: Starting\n" );

	int tid1 = Create( FIRST_USER_TASK_PRIORITY+2, &nameserver_task );
	zx_printf( COM2, "Created Name Server: %x\n", tid1 );
}

void nameserver_task()
{
   char name[10];
   
   int tid;
   
   /* Get the address from the server. You cant do it this way anymore */
   int* root_addr = 0;//(int*)(NAME_SERVER_BST_ROOT);
   
   zx_bst_node *root = (zx_bst_node*)(*root_addr);

   zx_printf( COM2, "nameserver: Root Node : %x; Root Node ->left :%x; Root Node ->right :%x \n", (int) root, (int)(root->left), (int)(root->right) );
   
   zx_printf( COM2,  "nameserver: Registering as 12345\n");
   zx_memcpy( name, "12345", 6 );
   zx_bst_add_by_name( &root, name, 444);
   zx_printf( COM2, "nameserver: Root Node : %x; Root Node ->left :%x; Root Node ->right :%x \n", (int) root, (int)(root->left), (int)(root->right) );
   
   zx_printf( COM2, "nameserver: Who is 12345\n");
   tid = zx_bst_get_by_name( name, root);
   zx_printf( COM2, "nameserver: 12345 : %d\n", tid);
   zx_printf( COM2, "nameserver: Root Node : %x; Root Node ->left :%x; Root Node ->right :%x \n", (int) root, (int)(root->left), (int)(root->right) );
   
   zx_printf( COM2,  "nameserver: Registering as 123456\n");
   zx_memcpy( name, "123456", 7 );
   zx_bst_add_by_name( &root, name, 777);
   zx_printf( COM2, "nameserver: Root Node : %x; Root Node ->left :%x; Root Node ->right :%x \n", (int) root, (int)(root->left), (int)(root->right) );
   
   zx_printf( COM2, "nameserver: Who is 123456\n");
   tid = zx_bst_get_by_name( name, root);
   zx_printf( COM2, "nameserver: 123456 : %d\n", tid);
   zx_printf( COM2, "nameserver: Root Node : %x; Root Node ->left :%x; Root Node ->right :%x \n", (int) root, (int)(root->left), (int)(root->right) );
     

   zx_printf( COM2,  "nameserver: Registering as 1234\n");
   zx_memcpy( name, "1234", 5 );
   zx_bst_add_by_name( &root, name, 555);
   zx_printf( COM2, "nameserver: Root Node : %x; Root Node ->left :%x; Root Node ->right :%x \n", (int) root, (int)(root->left), (int)(root->right) );
   
   zx_printf( COM2, "nameserver: Who is 1234\n");
   tid = zx_bst_get_by_name( name, root);
   zx_printf( COM2, "nameserver: 1234 : %d\n", tid);
   zx_printf( COM2, "nameserver: Root Node : %x; Root Node ->left :%x; Root Node ->right :%x \n", (int) root, (int)(root->left), (int)(root->right) );

   zx_printf( COM2, "nameserver: Traversing Tree\n");
   zx_printf( COM2, "nameserver: Root Node : %x; Root Node ->left :%x; Root Node ->right :%x \n", (int) root, (int)(root->left), (int)(root->right) );
   debug_bst_traverse_postorder( root );
   
   zx_printf( COM2, "nameserver: Freeing Tree\n");
   zx_printf( COM2, "nameserver: Root Node : %x; Root Node ->left :%x; Root Node ->right :%x \n", (int) root, (int)(root->left), (int)(root->right) ); 
   Free_bst( &root );
   
   debug_walk_heap();
   
   Exit();
}

/*=========================================*/
/*=========================================*/
/*=========================================*/
/* TEST: Testing Heap  */
/*=========================================*/
/*=========================================*/
/*=========================================*/
void test5()
{
	zx_printf( COM2, "\nFirst: Starting\n" );

	int tid1 = Create( FIRST_USER_TASK_PRIORITY+2, &heap_test );
	zx_printf( COM2, "Testing Heap: %x\n", tid1 );
}

void heap_test()
{
   zx_printf( COM2, "heap_test: Allocating node\n" );
   int *mem1 = (int*)Alloc();
   zx_printf( COM2, "heap_test: Memory_Address = %x\n", (int)mem1 );
   
   zx_printf( COM2, "heap_test: Allocating node\n" );
   int *mem2 = (int*)Alloc();
   zx_printf( COM2, "heap_test: Memory_Address mem2= %x\n", (int)mem2 );
   
   zx_printf( COM2, "heap_test: Freeing node mem2\n" );
   Free(mem2);
   
   zx_printf( COM2, "heap_test: Allocating node\n" );
   int *mem3 = (int*)Alloc();
   zx_printf( COM2, "heap_test: Memory_Address = %x\n", (int)mem3 );
   
   zx_printf( COM2, "heap_test: Freeing node mem3\n" );
   Free(mem3);
   
   zx_printf( COM2, "heap_test: Freeing node mem1\n" );
   Free(mem1); 

   Exit();
       
}


/*=========================================*/
/*=========================================*/
/*=========================================*/
/* TEST: Testing Name Server  */
/*=========================================*/
/*=========================================*/
/*=========================================*/

   void ns_test_task()
   {
      RegisterAs("Priyaa");
      RegisterAs("Alex");   
      Exit();
   }

void test_ns()
{

   int tid = Create( FIRST_USER_TASK_PRIORITY, &zx_name_server );
	zx_printf( COM2, "Created Name Server: %x\n", tid );
	
	// save the name server tid	
	int* ns_addr = (int*)(NAME_SERVER_TID);		
   *ns_addr = tid;


   RegisterAs("Main");
	zx_printf( COM2, "Main task is: %d\n", WhoIs("Main"));	
	
	
   int tid1 = Create( FIRST_USER_TASK_PRIORITY-1, &ns_test_task );
	zx_printf( COM2, "Created Task 1: %x\n", tid1 );
	
	zx_printf( COM2, "Priyaa is: %d\n", WhoIs("Priyaa"));	
	zx_printf( COM2, "Alex is: %d\n", WhoIs("Alex"));	
		
	zx_printf( COM2, "Unknown is: %d\n", WhoIs("Unknown"));		
		
	CloseNameServer();
	
}


/*=========================================*/
/*=========================================*/
/*=========================================*/
/* TEST: Usual Communication Testing  */
/*=========================================*/
/*=========================================*/
/*=========================================*/

void print_difference(int diff)
{
//   int diff2 = diff * 2; 
//   if (  *((int*)(TEMP_VAR)) == 1) // print time
//      zx_printf( COM2, "Time (508 KHz). Ticks: '%d'. ~Micro seconds: %d\n",  diff, diff2);
}

/*=========================================*/
/*=========================================*/
/*=========================================*/
/* Test: Kernel 3 */
/*=========================================*/
/*=========================================*/
/*=========================================*/

#define FOREVER for(;;)

typedef struct{
   int ticks;
   int count;
} k3_request;

void zx_clock_client()
{      
   k3_request request;
   k3_request reply;

   int first_task_tid;
   int i;
   int my_tid;
   
   my_tid = MyTid();
   
   first_task_tid = WhoIs("first_task_kernel_3");
   Send(first_task_tid, &request, sizeof(k3_request), &reply, sizeof(k3_request));
   
   for (i = 0; i < reply.count; i++)
   {   
      Delay(reply.ticks);
      zx_printf(COM2, "%d: Delay %d complete. Delay interval: %d. (Delay ticks total: %d)\n", my_tid, i, reply.ticks, reply.ticks * (i + 1));         
   }

   zx_printf(COM2, "%d: Exiting...\n", my_tid);   
   Exit();
}


void zx_first_user_task_kernel_3()
{
   #define task_count 4
 
   int delay_clients[task_count];

   int delay_priorities[task_count] = {2, 4, 5, 6}; 
   int delay_ticks[task_count] = {10, 23, 33, 71};   
   int delay_counts[task_count] = {20, 9, 6, 3};   

   int tid;
   int i;

   k3_request response;
   k3_request reply;
   
   zx_printf(COM2, "Hello, world!\n");   
   CreateNameServer();   
   CreateClockServer();

   RegisterAs("first_task_kernel_3");
   
   for (i = 0; i < task_count; i++)
   {
      delay_clients[i] = Create(delay_priorities[i], &zx_clock_client);
   }

   for (i = 0; i < task_count; i++)
   {
      Receive(&tid, &response, sizeof(k3_request));
   }

   for (i = 0; i < task_count; i++)
   {
      reply.ticks = delay_ticks[i];
      reply.count = delay_counts[i];
            
      Reply(delay_clients[i], &reply, sizeof(k3_request));
   }

   Exit();
}



/*=========================================*/
/*=========================================*/
/*=========================================*/
/* Test: Kernel 4 */
/*=========================================*/
/*=========================================*/
/*=========================================*/

void receive_from_uart1()
{
   while(1)
   {
      char c = GetC(COM1);
      zx_printf(COM2, "Data: %x\n", c);
   }

}

void zx_first_user_task_kernel_4()
{
   CreateNameServer();   
   CreateUARTServers();
   CreateClockServer();

   zx_printf(COM2, "Start");

   Create(FIRST_USER_TASK_PRIORITY - 1, &receive_from_uart1);

   char c;
   

   zx_printf(COM2, "Hello!");
   zx_printf(COM2, "World!");

   /* SENSORS */
   zx_printf(COM2, "Sensor query");
   c = 133; // sensor query;      
   PutC( COM1, c);    
  // Delay(500); 

   /* TRAIN */

   zx_printf(COM2, "Train query");
 
   c = 10; // speed;      
   PutC( COM1, c);    
   c = 45; // train number;           
   PutC( COM1, c);   
   
   c = 10; // speed;      
   PutC( COM1, c);    
   c = 44; // train number;           
   PutC( COM1, c);    

   while(1);

   Exit();
}

void zx_first_user_task_kernel_4_new()
{
   CreateNameServer();   
   CreateUARTServers();
   CreateClockServer();  
   
   // incomplete
   
}

/*=========================================*/
/*=========================================*/
/*=========================================*/
/* Test: Kernel 4 - Assignment 0 */
/*=========================================*/
/*=========================================*/
/*=========================================*/
#if 0
void zx_first_user_task_kernel_4_a0()
{
   CreateClockServer();  
   CreateNameServer();   
   CreateUARTServers();
   
//   zx_printf( COM2, "Creating A0 First User Task %d %d \n", sizeof(zx_uart_request), sizeof(zx_uart2_request));
   Create( FIRST_USER_TASK_PRIORITY - 1, zx_a0_command_task );
   
//   while(1);
   
   Exit();
   
   // incomplete
   
}
#endif


/*=========================================*/
/*=========================================*/
/*=========================================*/
/* Test: Kernel 4 - Milestone 1 */
/*=========================================*/
/*=========================================*/
/*=========================================*/
void zx_first_user_task_kernel_4_a0()
{
   CreateClockServer();  
   CreateNameServer();   
   CreateUARTServers();

//   Create( FIRST_USER_TASK_PRIORITY - 1,   acceleration_profile_testing ); //zx_train_controller_task);

   Create( FIRST_USER_TASK_PRIORITY - 1,   PROJECT_FIRST_USER_TASK ); //zx_train_controller_task);


//   Create( FIRST_USER_TASK_PRIORITY - 1,   zx_shortest_path_test );

//   Create( FIRST_USER_TASK_PRIORITY - 1,  zx_context_switch_test_task );

//   Create( FIRST_USER_TASK_PRIORITY - 1, zx_a0_command_task );   
//   Create( FIRST_USER_TASK_PRIORITY - 1, zx_a0_milestone_1_task_stopping_distance );
//   Create( FIRST_USER_TASK_PRIORITY - 1, zx_a0_milestone_1_task_speed );

//   Create( FIRST_USER_TASK_PRIORITY - 1, zx_a0_milestone_1_task_stopping_time );
   
   Exit();
   
}

/*=========================================*/
/*=========================================*/
/*=========================================*/
/* TEST: Testing zx circular queues  */
/*=========================================*/
/*=========================================*/
/*=========================================*/
void zx_first_user_task_queue_test()
{
   zx_circular_queue int_myqueue;   
   zx_circular_queue *int_myqueueptr;
   
   int_myqueueptr = &int_myqueue;

   zx_circular_queue  char_myqueue;   
   zx_circular_queue *char_myqueueptr;
   
   char_myqueueptr = &char_myqueue;
   
   int int_queue_elements[3]={0,0,0};
   char char_queue_elements[2];
 
   zx_queue_initialize( &int_myqueueptr, int_queue_elements, 4, 3 );
   
   int data;
   int *dataptr = &data;
   
   int result;
   
   data = 1;
   result = zx_queue_insert( &int_myqueueptr, (void*)dataptr);
   zx_printf( COM2, "Reading queue after insert: %d\n", int_queue_elements[0] );
   
   data = 2;
   result = zx_queue_insert( &int_myqueueptr, (void*)dataptr);
   zx_printf( COM2, "Reading queue after insert: %d\n", int_queue_elements[1] );
   
   data = 3;
   result = zx_queue_insert( &int_myqueueptr, (void*)dataptr);
   zx_printf( COM2, "Reading queue after insert: %d\n", int_queue_elements[2] );
   
   data = 4;
   result = zx_queue_insert( &int_myqueueptr, (void*)dataptr);
   
   if( result == ZX_ERR_QUEUE_FULL )   
      zx_printf( COM2, ZX_ERRMSG_QUEUE_FULL );
   else
      zx_printf( COM2, "Queue not full: errno: %d\n", result );
      
   result = zx_queue_remove( &int_myqueueptr, dataptr);
   if( result == ZX_Q_SUCCESS )
      zx_printf( COM2, "Data read from queue: %d\n", *dataptr );
   else
      zx_printf( COM2, "Data not read from queue: errno: %d\n", result );
   
   
   result = zx_queue_remove( &int_myqueueptr, dataptr);
   if( result == ZX_Q_SUCCESS )
      zx_printf( COM2, "Data read from queue: %d\n", *dataptr );
   else
      zx_printf( COM2, "Data not read from queue: errno: %d\n", result );
   
   result = zx_queue_remove( &int_myqueueptr, dataptr);
   if( result == ZX_Q_SUCCESS )
      zx_printf( COM2, "Data read from queue: %d\n", *dataptr );
   else
      zx_printf( COM2, "Data not read from queue: errno: %d\n", result );
   
   result = zx_queue_remove( &int_myqueueptr, dataptr);
   if( result == ZX_ERR_QUEUE_EMPTY )   
      zx_printf( COM2, ZX_ERRMSG_QUEUE_EMPTY );
   else
      zx_printf( COM2, "Data read from queue: %d\n", *dataptr );
      
   /* character data insert */
   zx_queue_initialize( &char_myqueueptr, char_queue_elements, 1, 2 );
   
   char cdata;
   char *cdataptr = &cdata;
   
   cdata = 'A';
   result = zx_queue_insert( &char_myqueueptr, (void*)cdataptr);
   if( result != ZX_ERR_QUEUE_FULL )   
      zx_printf( COM2, "Reading queue after insert: %c\n", char_queue_elements[0] );
   else
      zx_printf( COM2, ZX_ERRMSG_QUEUE_FULL );    
   
   cdata = 'B';
   result = zx_queue_insert( &char_myqueueptr, (void*)cdataptr);
   if( result != ZX_ERR_QUEUE_FULL )   
      zx_printf( COM2, "Reading queue after insert: %c\n", char_queue_elements[1] );
   else
      zx_printf( COM2, ZX_ERRMSG_QUEUE_FULL );
   
   cdata = 'C';
   result = zx_queue_insert( &char_myqueueptr, (void*)cdataptr);
   if( result != ZX_ERR_QUEUE_FULL )   
      zx_printf( COM2, "Reading queue after insert: %c\n", char_queue_elements[2] );
   else
      zx_printf( COM2, ZX_ERRMSG_QUEUE_FULL );
   
   cdata = 4;
   result = zx_queue_insert( &char_myqueueptr, (void*)cdataptr);
   if( result != ZX_ERR_QUEUE_FULL )   
      zx_printf( COM2, "Reading queue after insert: %c\n", char_queue_elements[3] );
   else
      zx_printf( COM2, ZX_ERRMSG_QUEUE_FULL );
      
      
    result = zx_queue_remove( &char_myqueueptr, cdataptr);
      if( result == ZX_Q_SUCCESS )
         zx_printf( COM2, "Data read from queue: %c\n", *cdataptr );
      else if( result == ZX_ERR_QUEUE_EMPTY )   
         zx_printf( COM2, ZX_ERRMSG_QUEUE_EMPTY );
      
   
    result = zx_queue_remove( &char_myqueueptr, cdataptr);
      if( result == ZX_Q_SUCCESS )
         zx_printf( COM2, "Data read from queue: %c\n", *cdataptr );
      else if( result == ZX_ERR_QUEUE_EMPTY )   
         zx_printf( COM2, ZX_ERRMSG_QUEUE_EMPTY );
      
    result = zx_queue_remove( &char_myqueueptr, cdataptr);
      if( result == ZX_Q_SUCCESS )
         zx_printf( COM2, "Data read from queue: %c\n", *cdataptr );
      else if( result == ZX_ERR_QUEUE_EMPTY )   
         zx_printf( COM2, ZX_ERRMSG_QUEUE_EMPTY );
      
    result = zx_queue_remove( &char_myqueueptr, cdataptr);
      if( result == ZX_Q_SUCCESS )
         zx_printf( COM2, "Data read from queue: %c\n", *cdataptr );
      else if( result == ZX_ERR_QUEUE_EMPTY )   
         zx_printf( COM2, ZX_ERRMSG_QUEUE_EMPTY );
      
   Exit();
}

