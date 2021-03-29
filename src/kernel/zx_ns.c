/*
 * zx_ns.c
 *
 * Contains tree data structures for Name Server
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #include <bwio.h>
 
 #include <zx_ns.h>
 #include <zx_ns_tree.h>
 #include <zx_system_calls.h>
 #include <zx_kernel_config.h>
   
void zx_name_server()
{
   int client_tid;
   zx_ns_request req;
   int reply_result;
   
   int to_exit = 0;
   
   zx_bst_node *root = 0;

   while (0 == to_exit)
   {
//      bwprintf(COM2, "Receive\n");
   
      int result = Receive(&client_tid, &req, sizeof(zx_ns_request));
      
//      bwprintf(COM2, "Request type: %d.\n", req.type);
      
      /* check request type */
      switch (req.type)
      {
         case API_NS_WHOIS: // WhoIs request
        
            result = zx_bst_get_by_name( req.name, root);           
            if (result >= 0)
            {
               req.tid = result; // put the return value to the tid 
            }
            else
            {
               /* Error : Something incorrect */
               req.tid = API_NS_WHOIS_FAIL;
            }
            
            break;
            
         /* Register request from a task */   
         case API_NS_REGISTER: 
         
            result = zx_bst_add_by_name( &root, req.name, req.tid);  
            if (result >= 0)
            {
               req.tid = API_NS_REGISTER_SUCCESS;  // put the return value to the tid 
            }
            else
            {
               req.tid = API_NS_REGISTER_FAIL;  // put the return value to the tid
            }
            
            break;
            
         /* Hand Shake request */
         case API_NS_HANDSHAKE: 
            req.tid = MyTid(); // return the task id here
            break;
            
         case API_NS_EXIT: // Exit request         
            req.tid = 0; // just for checking
            to_exit = 1;         
            break;
            
         default:
            /* modify TYPE here to make sure we are not confusing */
            req.type = API_NS_UNSUPPORTED;
            break;
      }
      
      reply_result = Reply(client_tid, &req, sizeof(zx_ns_request));
   }
  // debug_bst_traverse_postorder(root);
   Exit();
}

#if 0
/* This function is analogous to a main function 
   which keeps track of the root of the tree 
   
   tid   - Used for registering a task offering a 
          certain service
         
   name  - Name of the task offering service. Used 
          for both  who_is and register_As
          
   query - type of the query. RegisterAs or WhoIs?
 */
int name_server_query_processor( int tid, char *name, int query_type )
{
   switch( query_type )
   {
      case API_NS_WHOIS:
      tid = zx_bst_get_by_name( name, root);
      bwprintf( COM2, "WhoIs - name :%s ; tid:%d; root:%x, %x\n", name, tid, (int)root, *root );
      return tid;
      
      case API_NS_REGISTER:
      zx_bst_add_by_name( &root, name, tid);          
      bwprintf( COM2, "Registere: root :%x %x\n",(int*)root, (int)root);
      return 0;
      
      default:
      bwprintf( COM2, "Debbug\n" );
      debug_bst_traverse_postorder(root);
      break;
   }
   return -1;  
}

/* Helper Function for WHOIS request */
int zx_who_is(char* name)
{
   //int* root_addr = (int*)(NAME_SERVER_BST_ROOT);   
  //zx_bst_node *root = (zx_bst_node*)(*root_addr);
  
   //int tid = zx_bst_get_by_name( name, root);
   
   //return tid;
   
   return( name_server_query_processor( -1, name, API_NS_WHOIS) );
}

/* Helper Function for REGISTERAS request */
int zx_register_as(int tid, char* name)
{
  // int* root_addr = (int*)(NAME_SERVER_BST_ROOT);   
  // zx_bst_node *root = (zx_bst_node*)(*root_addr);

  // zx_bst_add_by_name( &root, name, tid);
   
  // *root_addr = (int)root;

  // return 0;
  return( name_server_query_processor(tid, name, API_NS_REGISTER) );
}

#endif
