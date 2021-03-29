/*
 * zx_track_sensing.c
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /* 
  * ASSUME : you know the orientation of the train
  */
 
 
#include <ts7200.h>
#include <zx_system_calls.h>
#include <zx_kernel_body.h>
#include <zx_kernel_head.h>
#include <zx_tasks.h>
#include <zx_ready_queue.h>
#include <zx_kernel_config.h>
#include <zx_memory.h>
#include <zx_queue.h>
#include <zx_uart_io.h>
#include <zx_err.h>
#include <zx_helper.h>

/* Train Files */
#include <zx_project_calibration.h>
#include <zx_project_train_functions.h>
#include <zx_project_track_functions.h>
#include <zx_project_ui.h>
#include <zx_project_sensor.h>
#include <zx_project_shortest_path.h>
#include <zx_project_track_node.h>
#include <zx_project_graphics.h>
#include <zx_project_utilities.h>
#include <zx_project_track_node.h>
#include <zx_project_track_sensing.h>
#include <zx_project_track_data.h>
#include <zx_project.h>
#include <zx_project_path_reservation.h>

/*
All velocities are in mm / sec

Train 39's velocity coefficient: 46.75 (linear regression)
velocity = speed * 46.75. Speed 14 == Speed 13.

Stopping distance coefficient: 65.88;
*/

int absolute(int x)
{
   if (x >= 0)
      return x;
      
   return -x;
}

void zx_route_task()
{  
   int tid;
   zx_route_request request;
   zx_route_response response;  
   
   while (1)
   {
      Receive(&tid, &request, sizeof(request));
      
      switch (request.type)
      {
         case ROUTE_REQUEST_SHORTEST:

            response.result = track_calc_shortest_path_from_two_dest(request.track_ptr, request.source1_id, request.source2_id, request.destination_id, request.route_nodes_ptr, request.route_edges_ptr, request.route_waypoints_ptr, request.route_turnouts_ptr);
       
            
            Reply(tid, &response, sizeof(response));            
            
            break; 
         default: 
         
            Reply(tid, &response, sizeof(response));
            break;
      }
  }
   
  Exit();
}

void zx_train_controller_task()
{
   int sensor_secretary_tid = Create(FIRST_USER_TASK_PRIORITY - 5, &zx_sensor_secretary_task);  

   zx_sensor_request request; 
   zx_sensor_request reply;      
   
   //create UI server
   int ui_server_tid = Create(FIRST_USER_TASK_PRIORITY - 1, &zx_ui_server_task);
   zx_command_task_request ui_request; 
   zx_command_task_request ui_reply;     

   //create route finding and preparing
   int route_task_tid = Create(FIRST_USER_TASK_PRIORITY - 2, &zx_route_task);
   
   // for printing to the COM2   
//   char com2_output[400];
//   int com2_output_size = 0;
   
   // definition of the track
   track_node track [TRACK_MAX];
   
   // states of turnouts
   int turnout_states [TURNOUT_BUF_SIZE]; 

   // initialize the track   
   track_init(CURRENT_TRACK, &track[0]); 
   
   // initialize the train
   zx_train train [TRAIN_COUNT];   
   train_init(&train[0], 49);
   train[0].ui_column = UI_DATA_COLUMN;
   train[0].ui_row = 7;

   train_init(&train[1], 50);
   train[1].ui_column = UI_DATA_COLUMN;
   train[1].ui_row = 29;

   
   // print the startup screen
   ui_print_initial_screen();
   
   int train_id;

   int train_stop_task_tid[TRAIN_COUNT];
   
   for (train_id = 0; train_id < TRAIN_COUNT; train_id++)
   {   
      train_ui_print_initial_screen(&train[train_id]);
   }
   
   
   for (train_id = 0; train_id < TRAIN_COUNT; train_id++)
   {   
      train_stop_task_tid[train_id] = Create(FIRST_USER_TASK_PRIORITY -5, &train_stop_task );
      train[train_id].stop_command_issued_flag = 0;
   // move train to initial position   
   // we will accelerate the train once it reaches a sensor
      train_set_speed(&train[train_id], 1); 
      train[train_id].routine_state = TRAIN_ROUTINE_INIT; 
   }

   /* Initialize sensors */   
   turnout_init(turnout_states); 

   
   /* row to print sensor statistics (expected and actual time) */
//   int stat_row = 0;
//   int stat_row_offset = 50;   
//   int stat_row_count = 10;      
   
   zx_route_response route_response;
   
   zx_route_request route_request;   
   
   int quit_command = 0;
   
   while (1)
   {
      /* Send a sensor request */
      
      int time = Delay(10);
      
      if (!quit_command)
      {
         /* Waiting for next location to go from the user */
         Send(ui_server_tid, &ui_request, sizeof(zx_command_task_request), &ui_reply, sizeof(zx_command_task_request));
         
         if (ui_reply.arg1 >= 0)
         {
            int current_command = ui_reply.arg1;
                     
            if (current_command == QUIT_CMD) // quit
            {
               quit_command = 1;
            }
            else if (current_command == SW_CMD) // REVERSE!!! BUT DOES NOT UPDATE ANYTHING, JUST ISSUES COMMAND
            {
               if (ui_reply.arg2 > 0 && ui_reply.arg2 < TURNOUT_BUF_SIZE)
               {
                  int state;
                  if (ui_reply.arg3 == 'C')
                     state = DIR_CURVED;
                  else
                     state = DIR_STRAIGHT;

                  turnout_toggle(turnout_states, ui_reply.arg2, state);

                  int i;

                  for (i = 0; i < TRAIN_COUNT; i++)
                  {
                     if (train[i].current_task != TRAIN_TASK_GOTO)
                     {
                        train[i].route_turnouts[ui_reply.arg2] = state;
                     }
                  }

               }
            } 
            else
            {
               int current_train = ui_reply.arg2;
            
               if (ui_reply.arg2 == train[0].train_id)
               {
                  current_train = 0;  
               }
               else if (ui_reply.arg2 == train[1].train_id)
               {
                  current_train = 1;
               }

               if (current_train >= 0 || current_train < TRAIN_COUNT)
               {
                  if (current_command == GO2_CMD) // GOTO
                  {   
                  
                     train[current_train].current_task = TRAIN_TASK_GOTO;
                      
                     int destination_id = ui_reply.arg3;
                     
                     route_request.source1_id = train[current_train].head_pos.edge->dest->index; 
                     // we will start route finding from the point right closer to the head, which is the destination of the current head edge 
                     
                     route_request.source2_id = train[current_train].tail_pos.edge->src->reverse->index;
                     // we will start route finding from the point right closer to the tail, which is the reverse of the source of the current tail edge 
                     
                     route_request.destination_id = destination_id;
                     route_request.type = ROUTE_REQUEST_SHORTEST;

                     route_request.track_ptr = &track[0];
                     route_request.route_waypoints_ptr = &train[current_train].route_waypoints[0];
                     route_request.route_nodes_ptr = &train[current_train].route_nodes[0];
                     route_request.route_edges_ptr = &train[current_train].route_edges[0];
                     route_request.route_turnouts_ptr = &train[current_train].route_turnouts[0];

                     Send(route_task_tid, &route_request, sizeof(route_request), &route_response, sizeof(route_response));                   
                     // this will update the route
                     
      //               Delay(300);


                     int i = 0;
                     for (i = 0; i < TURNOUT_BUF_SIZE; i++)
                     {
                        train[current_train].route_turnouts_toggled[i] = 0;
                     }

                     if (route_response.result == 0) // not_found
                     {
                        train[current_train].current_task = TRAIN_TASK_IDLE;
                        // no route
                     }
                     else
                     {               
                        train[current_train].ui_route_updated = 1;
                     
                        if (route_response.result == 2) // if need to move in reverse direction
                        {
                           train_reverse(&train[current_train]);
                        }
                        
                        if (train_next_waypoint(&train[current_train], 1) ) // reset to the first one
                        {                  
                           int preferred_speed = train_get_run_speed_from_distance(&train[current_train], train[current_train].target.distance_to_node);
                           train_set_speed(&train[current_train], preferred_speed); // accelerate to the desired speed                 
                           //train_set_speed(&train[0], 2); // accelerate to the desired speed                 
                           
                           train_update_expected_sensors(&train[current_train]);                               
                           train[current_train].routine_state = TRAIN_ROUTINE_RUN; 
                        }
                    }
                  }
                  else if (current_command == TR_CMD) // TR
                  {
                  
                     // to make the train know the turnout states
                     
                     int i = 0;
                     
                     for (i = 0; i < TURNOUT_BUF_SIZE; i++)
                     {
                        train[current_train].route_turnouts[i] = turnout_states[i];
                     }
                                       
                     train_set_speed(&train[current_train], ui_reply.arg3); // for now ignoring the second argument
                     train_update_expected_sensors(&train[current_train]);                     
                  }
                  else if (current_command == ST_CMD) // STOP
                  {
                     train_set_speed(&train[current_train], 0); // for now ignoring the second argument
                  }
                  else if (current_command == RV_CMD)
                  {            
                     train_reverse(&train[current_train]); 
                  }
                  
                  else if (current_command == RR_CMD) // REVERSE!!! BUT DOES NOT UPDATE ANYTHING, JUST ISSUES COMMAND
                  {
                  
                     // this does physical stuff only
                     char com1_output[50];
                     int com1_output_size = 0;
                     
                     com1_output_size = 0;
                        com1_output[com1_output_size++] = 15;
                        com1_output[com1_output_size++] = train[current_train].train_id;
                        com1_output[com1_output_size++] = UART_PACKET_END_CHAR;      
                     PutMultiple(COM1, com1_output);            
                  }
          
               }
             }
         }
      }
      
      if (quit_command)
      {
         request.value = -1;
      }
      else
         request.value = 0;
      
      Send(sensor_secretary_tid, &request, sizeof(request), &reply, sizeof(reply));
      
      if (quit_command)
         break;
         
//      int time = Time();
      
      if (reply.time != -1) // if there was a change
      {
         /* process the response  */
         int change = reply.value & 0xff;
         int sensor_byte_index = (reply.value >> 8);      
         int sensor_time = reply.time;
             
         int p = 0;
         int sensor_id = -1;

         // loop through all the sensors within the control unit that have been triggered
         while(1)
         {                                 
            p = find_next_bit_set( change, p + 1 );
             
            if( p == -1 ) break; // no more triggered sensors   
            
            int i = sensor_byte_index / 2;
            int j = p - 1;
            if( sensor_byte_index % 2 == 1 ) 
            {
               //bytes from 9 to 16
               j += 8;
            }
            
            // we have got sensor id. This is the sensor that was triggered now 
            sensor_id = (i * 16) + j;             
            
            
            // remove broken sensors! FIXED!!!
            
//            if (sensor_id == SENSOR_C5 || sensor_id == SENSOR_D10) // C5 and D10 are broken
//               continue;             
                   
            /* ----------------------------------------------------------------------------- */
    
//            zx_node_info* matched_sensor[TRAIN_COUNT];
    
            for (train_id = 0; train_id < TRAIN_COUNT; train_id++)
            {
//               matched_sensor[train_id] = 0;
    
               if (train[train_id].routine_state == TRAIN_ROUTINE_INIT)
               {
                  train_set_speed(&train[train_id], 0);       
                  train_adjust_position_by_sensor_toggle(&train[train_id], &track[sensor_id], sensor_time, turnout_states);                  
                  train[train_id].velocity_state = TRAIN_STATE_IMMOBILE; // first, the train is considered immobile

                  // accelerate the train
                  train[train_id].routine_state = TRAIN_ROUTINE_RUN_FIRST;       // change the system state
                  train[train_id].expected_sensors[0].node = &track[sensor_id]; // make next sensor to be A8 to go the next execution branch    
               } // train_state_init
            
               // NO ELSE!!!
               if (train[train_id].routine_state != TRAIN_ROUTINE_INIT)
               {         

                  /* --------  Lets now start asking a series of questions --------- */
                  /* 1. Is this one of the sensors that we are expecting to be triggered? */      
                                  
                  // For some reason we may lose signal from the first two of the sensors.
                                 
                  int triggered_good = 0; // has an expected sensor been triggered?
   //               int untriggered_sensor_count = 0; 
                              
                  // Hit the first expected sensor
                  
                  int triggered_index = -1;
                  int i;
                  
                  for (i = 0; i < NEXT_SENSOR_COUNT; i ++)
                  {
                     if (sensor_id == train[train_id].expected_sensors[i].node->index)
                     {
                     
                        triggered_good = 1;                           
                        triggered_index = i;   
                        
                        int foreign_train_id;                     
                           
                        // nested loop for sensor attribution
                        for (foreign_train_id = 0; foreign_train_id < TRAIN_COUNT; foreign_train_id++)
                        {  
                           int j;
                           if (foreign_train_id != train_id)
                              for (j = 0; j < NEXT_SENSOR_COUNT; j ++)
                              {
                                 if (
                                 // if the same sensor is expected by other train
                                    (sensor_id == train[foreign_train_id].expected_sensors[j].node->index)
                                    &&
                                    (
                                       // and the sensor is closer to the other train  
                                       absolute( train[train_id].expected_sensors[i].dist) > 
                                       absolute( train[foreign_train_id].expected_sensors[j].dist)
                                    )
                                    )
                                 {
                                    // then we are wrong with this sensor
                                    triggered_good = 0;
                                    break;
                                 
                                 }
                              }
                        }                      

                        break;
                     }
                  }                                
                  
                  if (triggered_good) // if expected sensor has been triggered
                  {
                     int error = train[train_id].expected_sensors[triggered_index].dist;
                     if (error < 0) // error might be negative, but we acare about the absolute value
                        error = -error;                             
                     
                     train[train_id].last_triggered_sensor_error = error;                   
                     train_adjust_position_by_sensor_toggle(&train[train_id], &track[sensor_id], sensor_time, turnout_states);  
                     
                     train_calibrate_velocity( &train[train_id], &track[sensor_id], time);
                     
                     train[train_id].last_triggered_sensor_node = &track[sensor_id];
                     train[train_id].last_triggered_sensor_time = sensor_time;
                     train[train_id].last_triggered_sensor_velocity = train[train_id].current_velocity;                     
                     
                     train_update_expected_sensors(&train[train_id]);                     

                     // if reached the destination
                     if ((train[train_id].routine_state == TRAIN_ROUTINE_RUN_FIRST) && (sensor_id == train[train_id].expected_sensors[0].node->index))
                     {
                        train_set_speed(&train[train_id], 0); // stop the train  
                        train[train_id].routine_state = TRAIN_ROUTINE_STOP_WAIT; // wait for stopping                                  
                     }
                     
                     break; // break to prevent the same routine for other train
                                          
                  }
                                             
              } // if (state == TRAIN_ROUTINE_RUN)
            } // for, train loop
            
                            
           #if 0                 
                            
           /* Print expected and actual time */
            com2_output_size = 0;
               zx_set_cursor(stat_row + stat_row_offset, 1, com2_output, &com2_output_size);       

               zx_put_string("[", com2_output, &com2_output_size);                                             
               
               zx_put_string(track[sensor_id].name, com2_output, &com2_output_size);                                             
               
               zx_put_string("] [", com2_output, &com2_output_size);                                             

               zx_put_number(sensor_time, com2_output, &com2_output_size);        
               
               zx_put_string("] [", com2_output, &com2_output_size);                                                                                                       

               zx_put_number(time, com2_output, &com2_output_size);        

               zx_put_string("]", com2_output, &com2_output_size);                                                                                                       

            com2_output[com2_output_size++] = UART_PACKET_END_CHAR;                  
            PutMultiple( COM2, com2_output );
            stat_row = (stat_row + 1) % stat_row_count;             
            
            #endif
            
         }// sensor loop while
      } // if sensor changed
                        
                        
      
      /* UPDATING */
      
      for (train_id = 0; train_id < TRAIN_COUNT; train_id++)
      {      
      
         // update the data, if not initialization  
         if (train[train_id].routine_state != TRAIN_ROUTINE_INIT) 
         {                  
            train_update_velocity_and_offset(&train[train_id]);
            
            /* update head and tail position according to distance_traveled by delta */
            train_update_vertices_by_distance_traveled(&train[train_id], time, turnout_states);

      
            track_node* temp_dest = train[train_id].head_pos.edge->dest;
                  
                  
            if (train[train_id].current_task == TRAIN_TASK_GOTO)
            {
               if (temp_dest->type == NODE_BRANCH && !train[train_id].route_turnouts_toggled[temp_dest->num])
               {
                  turnout_toggle(turnout_states, train[train_id].head_pos.edge->dest->num, train[train_id].route_turnouts[temp_dest->num]);
                  train[train_id].route_turnouts_toggled[temp_dest->num] = 1;
               }   
            }            
            
            int i;
            
            // decrease the expected distance to each sensor
            for (i = 0; i < NEXT_SENSOR_COUNT; i++)
            {
               if (train[train_id].expected_sensors[i].node != 0)
                  train[train_id].expected_sensors[i].dist = train[train_id].expected_sensors[i].dist - train[train_id].distance_travelled_in_delta;
            }
            
            if (train[train_id].current_task == TRAIN_TASK_GOTO)
            // if we are moving to some destination
            {
            
               train[train_id].target.distance_to_node = train[train_id].target.distance_to_node - train[train_id].distance_travelled_in_delta;
               int required_distance = train[train_id].target.distance_to_node + train[train_id].target.offset_from_node;

               if ( 
                  train[train_id].current_velocity != 0 // cannot be zero, because error will come
                  && !train[train_id].stop_command_issued_flag // not asked to stop yet
                  && ((required_distance - train[train_id].distance_travelled_in_delta) <= train[train_id].stopping_distance[train[train_id].speed]) // if our next iteration will probably bring to closer distance than we need          
               )
               
               {
                  zx_train_stop_request stop_request, stop_reply;
                  stop_request.train = &train[train_id];
                  stop_request.expected_time = (required_distance - train[train_id].stopping_distance[train[train_id].speed]) / train[train_id].current_velocity;  
                  if (stop_request.expected_time <= 0) // who knows!
                     stop_request.expected_time  = 1; // should be 0
                            
                  Send( train_stop_task_tid[train_id], &stop_request, sizeof(stop_request), &stop_reply, sizeof(stop_reply));
                  train[train_id].stop_command_issued_flag = 1;

                  train[train_id].routine_state = TRAIN_ROUTINE_STOP_WAIT;
               }
            }
            
            /* reserving */
            
            if ((train[train_id].routine_state != TRAIN_ROUTINE_SLOWDOWN) )
            {               
               train[train_id].ui_reservation_available = reserve_path(&train[train_id], train[train_id].speed);
                  
               if (!train[train_id].ui_reservation_available)
               {
                  if (train[train_id].routine_state != TRAIN_ROUTINE_STOP_WAIT && train[train_id].velocity_state != TRAIN_STATE_IMMOBILE)
                  {
                     train[train_id].speed_before_slowdown = train[train_id].speed;
                     train_set_speed(&train[train_id], TRAIN_SLOW_SPEED);
                     train[train_id].routine_state = TRAIN_ROUTINE_SLOWDOWN;
                  }
               }                           
            }
         
            // if the slowdown is complete, and the train is moving uniformly at speed TRAIN_SLOW_SPEED
            if ((train[train_id].routine_state == TRAIN_ROUTINE_SLOWDOWN) && (train[train_id].velocity_state == TRAIN_STATE_UNIFORM))
            {
               // try to reserve for the initial speed
               train[train_id].ui_reservation_available = reserve_path(&train[train_id], train[train_id].speed_before_slowdown);           
               
               // if able to reserve for the initial speed
               if (train[train_id].ui_reservation_available)
               {
                  // accelerate to the initial speed
                  train_set_speed(&train[train_id], train[train_id].speed_before_slowdown);
                  train[train_id].routine_state = TRAIN_ROUTINE_RUN;
               }                  
               else
               {
                  // try to reserve further for the TRAIN_SLOW_SPEED
                  train[train_id].ui_reservation_available = reserve_path(&train[train_id], TRAIN_SLOW_SPEED); 
               
                  // if cannot reserve even for the slow speed
                  if (!train[train_id].ui_reservation_available)
                  {
                     // just stop
                     train_set_speed(&train[train_id], 0);
                     train[train_id].routine_state = TRAIN_ROUTINE_STOP_WAIT;
                     train[train_id].stop_way = TRAIN_STOP_WAY_FORCED;
                  }
               } 
            
            }   
                     
            train_ui_print_data(&train[train_id]);
            
//            if (!train[train_id].ui_reservation_available)
//               Exit();

         }
      


         // if we are waiting for stop, and it has stopped
         if ((train[train_id].routine_state== TRAIN_ROUTINE_STOP_WAIT) && (train[train_id].velocity_state == TRAIN_STATE_IMMOBILE))
         {      
         
            train[train_id].stop_command_issued_flag = 0;

            // the train is stopped. But did it stop itself or was forced by lack of reservation?
            
            if (train[train_id].stop_way == TRAIN_STOP_WAY_VOLUNTARY)
            {            
               if (train_next_waypoint(&train[train_id], 0))
               {
                  train_reverse(&train[train_id]);
                  train[train_id].routine_state = TRAIN_ROUTINE_RUN;               
                                                      
                  int preferred_speed = train_get_run_speed_from_distance(&train[train_id], train[train_id].target.distance_to_node);
                  train_set_speed(&train[train_id], preferred_speed); // accelerate to the desired speed  
               }

               else
               {        
                  // we have completed our path.
                  train[train_id].route_waypoints[0].node = 0;
                  train[train_id].route_nodes[0] = 0;
                  train[train_id].route_edges[0] = 0;
                  train[train_id].ui_route_updated = 1;
                  train[train_id].current_task = TRAIN_TASK_IDLE;            
                  train[train_id].routine_state = TRAIN_ROUTINE_RUN;
               }
            }
            else // was forced to stop
            {
            
            
            }
         }  
      }
      
               
      /* Get time spent in idle task */
      unsigned int *idle_time = (unsigned int*)(VAR_IDLE_TASK_TIME);
    
      int clock_server_time = time * 10; //milli seconds
    
      /* Percentage of time spent in idle task */
      int percentage = ((*idle_time)*100)/(clock_server_time);      
      ui_print_data(time, percentage);
      
                              
   } // while


   for (train_id = 0; train_id < TRAIN_COUNT; train_id++)
   {   
      zx_train_stop_request stop_request, stop_reply;
      stop_request.train = &train[train_id];
      stop_request.expected_time = -1; // exit
       
      Send( train_stop_task_tid[train_id], &stop_request, sizeof(stop_request), &stop_reply, sizeof(stop_reply));
   }       
   
   route_request.type = ROUTE_REQUEST_EXIT;
   Send(route_task_tid, &route_request, sizeof(route_request), &route_response, sizeof(route_response));         
   
   zx_printf( COM2, "\n\n\n\n\n\n\n\n\n\n\nExiting...\n");  
   
   
   char buf[10];
   int buf_size = 0;
   
   zx_clear_screen( &buf[0], &buf_size );
   buf[buf_size] = 0;
   
   zx_printf( COM2, "%s\n", buf);  
   zx_printf( COM2, "Stats.\n");
   
   int t, k;
   
   for (t = 0; t < TRAIN_COUNT; t++)
   {
      zx_printf( COM2, "Train %d:\n", train[t].train_id); 
      zx_printf( COM2, "------------\n", train[t].train_id); 
         
      for (k = 0; k < 14; k++)
      {
         zx_printf( COM2, "[%d]: %d\n", k, train[t].speed_to_velocity[0][k]);    
      }
   }
   
   Shutdown();
   Exit();
}


void acceleration_profile_testing()
{
   zx_printf(COM2, "Started");

   track_node track [TRACK_MAX];

   // initialize the track   
   track_init(CURRENT_TRACK, &track[0]); 
   
   // initialize train structure
   // lets assume train 44;
   zx_train train [TRAIN_COUNT];
   train_init(&train[0], 44);  
   
   /* lets make the set up */
   train[0].head_pos.node = &track[SENSOR_A8];
   train[0].head_pos.time = 0;
   train[0].head_pos.dist = 0;
   
   train_set_speed( &train[0], 7 );
   train_set_speed( &train[0], 0 );
    
   zx_printf( COM2, "\n Current Velocity | Distance Travelled | State of the Train " );
   
   int i;
   
   for (i = 0; i < 100; i++)
   {
      // keep updating train data and print it on screen
     train_update_velocity_and_offset(&train[0]);
     train[0].head_pos.dist += train[0].distance_travelled_in_delta;
      
     zx_printf( COM2, "\n %d               | %d                 | %d          | %d)",
              train[0].current_velocity,  train[0].head_pos.dist,  train[0].velocity_state, train[0].t  );  
       
//     Delay(2);
   }
   
   Shutdown();
   Exit();
     
}


