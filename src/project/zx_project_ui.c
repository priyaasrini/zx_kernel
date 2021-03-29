/*
 * zx_ui.c
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /* This file contains functions to manage the 
  * screen output while the trains are running
  */

#include <zx_err.h>
#include <zx_uart_io.h>
#include <zx_tasks.h>
#include <zx_system_calls.h>
  
#include <zx_project_ui.h>
#include <zx_project_track_node.h>
#include <zx_project_track_sensing.h>
#include <zx_project_track_data.h>
#include <zx_project_graphics.h>
#include <zx_project_track_functions.h>
#include <zx_project_utilities.h>
#include <zx_project.h>

void train_ui_print_initial_screen(zx_train* train)
{
   char com2_output[500];
   int com2_output_size = 0;

   com2_output_size = 0;
      zx_set_cursor(train->ui_row, 1, com2_output, &com2_output_size);
      zx_put_string("===============================================\n", com2_output, &com2_output_size); 
      zx_put_string("Train: ", com2_output, &com2_output_size);
      zx_put_number(train->train_id, com2_output, &com2_output_size); 
      zx_put_string("\n", com2_output, &com2_output_size);
      zx_put_string("===============================================\n", com2_output, &com2_output_size); 
      zx_put_string("Head (Mark | off mm):\n", com2_output, &com2_output_size);       
      zx_put_string("Tail (Mark | off mm):\n", com2_output, &com2_output_size);       
      zx_put_string("Last sensor (ID | error mm):\n", com2_output, &com2_output_size);         
      zx_put_string("Direction:\n", com2_output, &com2_output_size); 
      zx_put_string("Edges:\n", com2_output, &com2_output_size); 
      zx_put_string("Velocity (mm / ticks):\n", com2_output, &com2_output_size);       
      zx_put_string("Acceleration state:\n", com2_output, &com2_output_size);       
      zx_put_string("Exp. sensors (id | dist mm):\n", com2_output, &com2_output_size);                          
      zx_put_string("Route waypoints:\n", com2_output, &com2_output_size); 
      zx_put_string("Route nodes:\n", com2_output, &com2_output_size); 
      zx_put_string("\n", com2_output, &com2_output_size); 
      zx_put_string("Route edges:\n", com2_output, &com2_output_size); 
      zx_put_string("\n", com2_output, &com2_output_size); 
      zx_put_string("\n", com2_output, &com2_output_size); 
      zx_put_string("Reservation:\n", com2_output, &com2_output_size); 
      zx_put_string("\n", com2_output, &com2_output_size); 
      zx_put_string("\n", com2_output, &com2_output_size); 
                                                            
   com2_output[com2_output_size++] = UART_PACKET_END_CHAR;
   PutMultiple( COM2, com2_output );      
}


void zx_print_error_message( char *message )
{

   char output[100];
   int  output_size = 0;
   
   output_size = 0;
         zx_set_cursor(  UI_TERMINAL_ROW + UI_TERMINAL_SIZE, 1, output, &output_size );
         zx_erase_line(output, &output_size);
           
         zx_set_cursor( UI_TERMINAL_ROW + UI_TERMINAL_SIZE, 1, output, &output_size);
        // zx_put_string( "Output>", output, &output_size);
         zx_put_string( message, output, &output_size);
         
   output[output_size++] = UART_PACKET_END_CHAR;
   PutMultiple( COM2, output );
}

void zx_print_success_message()
{

   char output[100];
   int  output_size = 0;
   
   output_size = 0;
         zx_set_cursor(  UI_TERMINAL_ROW + UI_TERMINAL_SIZE, 1, output, &output_size );
         zx_erase_line(output, &output_size);
           
         zx_set_cursor( UI_TERMINAL_ROW + UI_TERMINAL_SIZE, 1, output, &output_size);
        // zx_put_string( "Output>", output, &output_size);
         zx_put_string( "Command is sucessful", output, &output_size);
         
   output[output_size++] = UART_PACKET_END_CHAR;
   PutMultiple( COM2, output );
}


void train_ui_print_data(zx_train* train)
{
   char com2_output[880];
   int com2_output_size = 0;
   
   int offset = train->ui_row + 2;
   int data_column = train->ui_column;
   int i;

   com2_output_size = 0;

//      zx_set_cursor(offset + 0, data_column, com2_output, &com2_output_size);
//      zx_put_number(time, com2_output, &com2_output_size);
//      zx_put_string("    ", com2_output, &com2_output_size);        

      zx_set_cursor(offset + 1, data_column, com2_output, &com2_output_size);
      zx_put_string(train->head_pos.node->name, com2_output, &com2_output_size);
      zx_put_string(" ", com2_output, &com2_output_size);
      zx_put_number(train->head_pos.dist / DISTANCE_UNIT, com2_output, &com2_output_size);
      
      zx_put_string(" [", com2_output, &com2_output_size);
      zx_put_string(train->head_pos.edge->src->name, com2_output, &com2_output_size);
      zx_put_string(" => ", com2_output, &com2_output_size);
      zx_put_string(train->head_pos.edge->dest->name, com2_output, &com2_output_size);     
      zx_put_string("]", com2_output, &com2_output_size);

      
      zx_put_string("         ", com2_output, &com2_output_size);  
      

      // tail

      zx_set_cursor(offset + 2, data_column, com2_output, &com2_output_size);
      zx_put_string(train->tail_pos.node->name, com2_output, &com2_output_size);
      zx_put_string(" ", com2_output, &com2_output_size);
      zx_put_number(train->tail_pos.dist / DISTANCE_UNIT, com2_output, &com2_output_size);

      zx_put_string(" [", com2_output, &com2_output_size);
      zx_put_string(train->tail_pos.edge->src->name, com2_output, &com2_output_size);
      zx_put_string(" => ", com2_output, &com2_output_size);
      zx_put_string(train->tail_pos.edge->dest->name, com2_output, &com2_output_size);     
      zx_put_string("]    ", com2_output, &com2_output_size);
      
      
      // last sensor
      
      zx_set_cursor(offset + 3, data_column, com2_output, &com2_output_size);

      if (train->last_triggered_sensor_node != 0)
      {
         zx_put_string(train->last_triggered_sensor_node->name, com2_output, &com2_output_size);
         zx_put_string(" ", com2_output, &com2_output_size);
         zx_put_number(train->last_triggered_sensor_error / DISTANCE_UNIT, com2_output, &com2_output_size);
         zx_put_string("    ", com2_output, &com2_output_size);
      }
      else
      {
         zx_put_string("none                 ", com2_output, &com2_output_size);       
      }

      // direction
      zx_set_cursor(offset + 4, data_column, com2_output, &com2_output_size);
      if (train->direction > 0)
      {
         zx_put_string("Direct  ", com2_output, &com2_output_size);   
      }
      else
         zx_put_string("Reverse ", com2_output, &com2_output_size);   

      // edges
      zx_set_cursor(offset + 5, data_column, com2_output, &com2_output_size);


      for (i = 0; i < TRAIN_EDGE_COUNT; i++)
      {
         if (train->edges[i] != 0)
         {
            zx_put_string("[", com2_output, &com2_output_size);
            zx_put_string(train->edges[i]->src->name, com2_output, &com2_output_size);
            zx_put_string(" => ", com2_output, &com2_output_size);
            zx_put_string(train->edges[i]->dest->name, com2_output, &com2_output_size);     
            zx_put_string("] ", com2_output, &com2_output_size);      
         }
      }      
      zx_put_string("                  ", com2_output, &com2_output_size);  
      
      zx_set_cursor(offset + 6, data_column, com2_output, &com2_output_size);
      zx_put_number(train->current_velocity, com2_output, &com2_output_size);
      
      zx_put_string(" [", com2_output, &com2_output_size);      
      zx_put_number(train->speed, com2_output, &com2_output_size);      
      zx_put_string(" ]    ", com2_output, &com2_output_size); 
      
      zx_set_cursor(offset + 7, data_column, com2_output, &com2_output_size);
            
      if (train->velocity_state == TRAIN_STATE_IMMOBILE)
      {
         zx_put_string("Immobile", com2_output, &com2_output_size);      
      }
      else if (train->velocity_state == TRAIN_STATE_ACCELERATING)      
      {
         zx_put_string("Accelerating", com2_output, &com2_output_size);      
      }
      else if (train->velocity_state == TRAIN_STATE_DECCELERATING)      
      {
         zx_put_string("Deccelerating", com2_output, &com2_output_size);      
      }
      else if (train->velocity_state == TRAIN_STATE_UNIFORM)      
      {
         zx_put_string("Moving uniformly", com2_output, &com2_output_size);      
      }    
      
      zx_put_string(" [", com2_output, &com2_output_size);      
      zx_put_number(train->t1, com2_output, &com2_output_size);      
      zx_put_string(" ]", com2_output, &com2_output_size);      
      zx_put_string("                ", com2_output, &com2_output_size);        
      
      zx_set_cursor(offset + 8, data_column, com2_output, &com2_output_size);
      
      for (i = 0; i < NEXT_SENSOR_COUNT; i++)
      {
         if (train->expected_sensors[i].node != 0)
         {
            zx_put_string(train->expected_sensors[i].node->name, com2_output, &com2_output_size); 
            zx_put_string(": ", com2_output, &com2_output_size);          
            zx_put_number(train->expected_sensors[i].dist / DISTANCE_UNIT, com2_output, &com2_output_size); 
                     
            zx_put_string("mm | ", com2_output, &com2_output_size);          
         }
      }
            
      zx_put_string("            ", com2_output, &com2_output_size);  
         

      if (train->ui_route_updated)
      {
         train->ui_route_updated = 0;         

         // route_waypoints:
         zx_set_cursor(offset + 9, data_column, com2_output, &com2_output_size);

         int wp_index = 0;

         if (train->route_waypoints[0].node != 0) // if there are route_waypoints
         {
            while (wp_index < WAYPOINT_COUNT)
            {
               if (train->route_waypoints[wp_index].node == 0)
                  break;

               // (ID; offset; distance to the node)

               zx_put_string("(", com2_output, &com2_output_size);             
               zx_put_string(train->route_waypoints[wp_index].node->name, com2_output, &com2_output_size);
               zx_put_string(";", com2_output, &com2_output_size); 
               zx_put_number(train->route_waypoints[wp_index].offset, com2_output, &com2_output_size);
               zx_put_string(";", com2_output, &com2_output_size); 
               zx_put_number(train->route_waypoints[wp_index].distance, com2_output, &com2_output_size);         
               zx_put_string(")", com2_output, &com2_output_size);   
               
               wp_index++;       
            }
            
            zx_put_string("                     ", com2_output, &com2_output_size);             
         }
         else
         {
            zx_put_string("Idle. No route is assigned.                                                                                        ", com2_output, &com2_output_size);
         }
         
         // nodes:
         zx_set_cursor(offset + 10, data_column, com2_output, &com2_output_size);

         int node_index = 0;       
         
         if (train->route_nodes[0] != 0) // if there are nodes
         {           
            while (node_index < TRACK_MAX)
            {
               if (train->route_nodes[node_index] == 0)
                  break;

               // (ID; offset; distance to the node)

               zx_put_string(train->route_nodes[node_index]->name, com2_output, &com2_output_size);
               zx_put_string(" ", com2_output, &com2_output_size);   
               
               node_index++;       
            }

            zx_put_string("                     ", com2_output, &com2_output_size);   
         }
         else
         {
            zx_put_string("Idle. No route is assigned.                                                                                       ", com2_output, &com2_output_size);
         }
         
         
         // edges:
         zx_set_cursor(offset + 12, data_column, com2_output, &com2_output_size);

         if (train->route_edges[0] != 0) // if there are edges
         { 
            int edge_index = 0;         
            while (edge_index < TRACK_MAX)
            {
               if (train->route_edges[edge_index] == 0)
                  break;

               // (ID; offset; distance to the node)

               zx_put_string("[", com2_output, &com2_output_size);   
               zx_put_string(train->route_edges[edge_index]->src->name, com2_output, &com2_output_size);
               zx_put_string(">", com2_output, &com2_output_size);   
               zx_put_string(train->route_edges[edge_index]->dest->name, com2_output, &com2_output_size);
               zx_put_string("]", com2_output, &com2_output_size);   
               
               edge_index++;       
            }

            zx_put_string("                     ", com2_output, &com2_output_size);   
                  
         }
         else
         {
            zx_put_string("Idle. No route is assigned.                                                                                       ", com2_output, &com2_output_size);
         }                  
                  
      }
      
   zx_set_cursor(offset + 15, data_column, com2_output, &com2_output_size);      
                               
   if (train->ui_reservation_available)
   {
      zx_put_string("Available ", com2_output, &com2_output_size);   
   }
   else
      zx_put_string("Not Enough", com2_output, &com2_output_size);  

   zx_set_cursor(offset + 16, 1, com2_output, &com2_output_size);      

   i = 0;   
   
   while( train->reserved_edges[i] != 0 )
   {  
      zx_put_string("[", com2_output, &com2_output_size);
      zx_put_string(train->reserved_edges[i]->src->name, com2_output, &com2_output_size);
      zx_put_string(" -> ", com2_output, &com2_output_size);
      zx_put_string(train->reserved_edges[i]->dest->name, com2_output, &com2_output_size);
      zx_put_string(": ", com2_output, &com2_output_size);
      zx_put_number(train->reserved_edges[i]->reservation_offset, com2_output, &com2_output_size);      
      zx_put_string(" out of ", com2_output, &com2_output_size);
      zx_put_number(train->reserved_edges[i]->dist, com2_output, &com2_output_size);     
      zx_put_string("] ", com2_output, &com2_output_size);

      i++;
               
      if( i == RESERVED_EDGES_COUNT )
         break;

   }
   zx_put_string("                     ", com2_output, &com2_output_size);
                                        
                        
   com2_output[com2_output_size++] = UART_PACKET_END_CHAR;
   PutMultiple( COM2, com2_output );      
}

void ui_print_data(int time, int idle_task_percent)
{
   char com2_output[200];
   int com2_output_size = 0;

   com2_output_size = 0;
      zx_set_cursor(4, UI_DATA_COLUMN, com2_output, &com2_output_size);

      int q;

      q = time / 100 / 60;
      zx_put_number(q, com2_output, &com2_output_size);     
      zx_put_string(":", com2_output, &com2_output_size);    
      time -= q * 100 * 60;
            
      q = time / 100;
      zx_put_number(q, com2_output, &com2_output_size);     
      zx_put_string(".", com2_output, &com2_output_size);    
      time -= q * 100;
      
      q = time / 10;      
      zx_put_number(q, com2_output, &com2_output_size);     
      zx_put_string("   ", com2_output, &com2_output_size);    

      zx_set_cursor(5, UI_DATA_COLUMN, com2_output, &com2_output_size);

      zx_put_number(idle_task_percent, com2_output, &com2_output_size);      
      zx_put_string("%", com2_output, &com2_output_size);      
      zx_put_string("   ", com2_output, &com2_output_size);    

                                                                  
   com2_output[com2_output_size++] = UART_PACKET_END_CHAR;
   PutMultiple( COM2, com2_output );   
}

void ui_print_initial_screen()
{
   char com2_output[200];
   int com2_output_size = 0;

   com2_output_size = 0;
      zx_clear_screen(com2_output, &com2_output_size);
      zx_set_cursor(1, 1, com2_output, &com2_output_size);
      zx_put_string("======================================================\n", com2_output, &com2_output_size); 
      zx_put_string("=======  Project 1 Demo  ==  Alex and Priyaa  ========\n", com2_output, &com2_output_size); 
      zx_put_string("======================================================\n", com2_output, &com2_output_size);                      
      zx_put_string("Time:\n", com2_output, &com2_output_size); 
      zx_put_string("Idle task time:\n", com2_output, &com2_output_size); 
                                                            
   com2_output[com2_output_size++] = UART_PACKET_END_CHAR;
   PutMultiple( COM2, com2_output );      
}

void zx_command_task()
{
   int server_id = WhoIs("ui_server");

   zx_command_task_request command_request;

   char output[20];
   int  output_size = 0;
   
   char prompt[15];
   zx_initialize_prompt( prompt );
 
   zx_set_cursor( UI_TERMINAL_ROW, UI_TERMINAL_COLUMN, output, &output_size);
   zx_put_string( prompt, output, &output_size);
   output[output_size++] = UART_PACKET_END_CHAR;
   PutMultiple( COM2, output );

/* ------------------------------------------------------- */
/* BELOW CODE FOR MANAGING TRACK SWITCHES AND DISPLAY INFO */
/* ------------------------------------------------------- */
     
/* ------------------------------------------------------- */
/*        FORVER LOOP FOR COMMANDS BEGINS                  */
/* ------------------------------------------------------- */

   char c;
   
   //buffers
   char read_buffer[RECEIVE_BUF_LEN]; 
   int  read_buffer_pos=-1;

   int  command_flag=0;
   int  line = 0;
   int  char_printed= TERMINAL_PROMPT_LEN;
   
   int result = 0;
   
   FOREVER
   {
      // wait till you receive a proper character
      while( (result = GetC(COM2)) == RECEIVE_ERROR );

      c = result;
      /* User pressed Enter which means we received a command now */
      if( c == '\r')
      {
         // we have received a complete command from the user
         command_flag = 1;

         //update receive buffer
         read_buffer_pos++;
         add_byte_to_buff( '\0', read_buffer, read_buffer_pos );
         read_buffer_pos = -1;
         
         //referesh terminal display if needed
         line=(line+1)%UI_TERMINAL_SIZE;
         
         if( line == 0 )
         {            
            output_size = 0;
               zx_set_cursor( UI_TERMINAL_ROW, UI_TERMINAL_COLUMN, output, &output_size );
               zx_erase_from_current_to_scrend(output, &output_size);
            output[output_size++] = UART_PACKET_END_CHAR;
            PutMultiple( COM2, output );
         }
         
         output_size = 0;
            zx_set_cursor( UI_TERMINAL_ROW+line, UI_TERMINAL_COLUMN, output, &output_size );
            print_prompt( prompt, output, &output_size );  
         output[output_size++] = UART_PACKET_END_CHAR;
         PutMultiple( COM2, output );    
         
         char_printed = TERMINAL_PROMPT_LEN;  
      }
      
      /* User pressed back space */
      else if( c == '\b' )
      {
         if (read_buffer_pos >= 0)
         {
      
            //remove the character
            read_buffer_pos--;
            
            //add appropriate characters to send buffer
            output_size = 0;
               zx_set_cursor( UI_TERMINAL_ROW+line, UI_TERMINAL_COLUMN+char_printed, output, &output_size );
               zx_erase_line( output, &output_size );
            output[output_size++] = UART_PACKET_END_CHAR;
            PutMultiple( COM2, output );  
                     
            char_printed--;
         }
         else 
         {
            // cannot erase         
         }
      }
      else
      {
         //update receive buffer
         read_buffer_pos++;
         add_byte_to_buff( c, read_buffer, read_buffer_pos );

         //add data to be printed to send buffer
         char_printed++;
         
         // Print the data
         output_size = 0;
            zx_set_cursor( UI_TERMINAL_ROW+line, UI_TERMINAL_COLUMN+char_printed, output, &output_size );
            output[output_size++] = c;
         output[output_size++] = UART_PACKET_END_CHAR;
         PutMultiple( COM2, output );  
      }   
      
      //////////////////////////////
      //////////////////////////////
            
      // we have received a command completely
      if( command_flag )
      {
         command_flag = 0;
         
         command_request.arg1 = command_request.arg2 = 
         command_request.arg3 = command_request.arg4 =  -1;
               
         process_command(read_buffer, &command_request.arg1, &command_request.arg2, 
                                      &command_request.arg3, &command_request.arg4
                                      ) ;
                                  
         switch( command_request.arg1 )
         {
            case TR_CMD:
            case SW_CMD:
               if( command_request.arg2 == -1 || command_request.arg3 == -1 )
               {
                  zx_print_error_message( "Incorrect arg" ); 
               }  
               else
               {
                  Send(server_id, &command_request, sizeof(command_request), 
                                    &command_request, sizeof(command_request));
                                    
                 zx_print_success_message();
               }
               break;
            
            case RV_CMD:
            case RR_CMD:
               Send(server_id, &command_request, sizeof(command_request),
                                    &command_request, sizeof(command_request));
               zx_print_success_message();

               break;
            
            case GO2_CMD:
               if( command_request.arg2 == -1)
               {
                  zx_print_error_message( "Incorrect arg(2)" ); 
               }
               else if( command_request.arg2 == -1)
               {
                  zx_print_error_message( "Incorrect arg(3)" ); 
               }
//               else if( command_request.arg4 == -1 )
//               {
//                  zx_print_error_message( "Incorrect arg(4)" ); 
//               }
               else
               {
                  Send(server_id, &command_request, sizeof(command_request), 
                                    &command_request, sizeof(command_request));
                  zx_print_success_message();
               }
               break;

            case ST_CMD:
               if( command_request.arg2 == -1)
               {
                  zx_print_error_message( "Incorrect arg" ); 
               }
               else
               {
                  Send(server_id, &command_request, sizeof(command_request), 
                                    &command_request, sizeof(command_request));
                  zx_print_success_message();
                                    
               }
               break;
            
            case QUIT_CMD:
               Send(server_id, &command_request, sizeof(command_request), 
                                 &command_request, sizeof(command_request));
               zx_print_success_message();
               Exit(); // EXIT here          
               break;  
            
            
            default:
              zx_print_error_message( "Incorrect command" ); 
              break;
            
         }
              
      }      
   } // forever  
   Exit();
}



/* Stores requests from UI  */
void zx_ui_server_task()
{

   RegisterAs("ui_server");
   
   int tid;
   int ui_input_tid = Create(FIRST_USER_TASK_PRIORITY - 1, zx_command_task );//zx_ui_input_task);
   
   int command_task_tid = 0;
   int command_waiting = 0;
   
   zx_command_task_request command_request; 
   zx_command_task_request command;  

   while (1)
   {   
      //  we receive either from the command task or from the controller task
      Receive(&tid, &command, sizeof(command)); 

      if (tid == ui_input_tid)
      {
         /* we reply to the command task after we sent this command to the controller */
         command_task_tid = tid;
         
         /* copy the command arguments */
         command_request.arg1 = command.arg1;
         command_request.arg2 = command.arg2;
         command_request.arg3 = command.arg3;
         command_request.arg4 = command.arg4;
         command_waiting =1;
      }
      else
      {
         if( command_waiting == 1 )
         {
 /* Reply to the controller with command if we have already received a command */
            Reply(tid, &command_request, sizeof(command_request));
            
 /* Reply to the command task so that it will be unblocked to receive more commands */
            Reply(command_task_tid, &command, sizeof(command));
            
            command_waiting = 0;
            
           /* We received indication to quit */
           if 
               (command.arg1 == QUIT_CMD)
              break;              
         }
         else
         {
            /* we dont have any command  yet from the user */
            command.arg1 = -1;
            Reply(tid, &command, sizeof(command));
         }
     }
      

   }  

   Exit();
}
