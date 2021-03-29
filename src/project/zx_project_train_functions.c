/*
 * zx_train_functions.c
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /* 
  * 1) This file contains the functions that reads and writes 
  *    train data
  *
  * 2) This file contains the functions that speak to the train
  */

#include "zx_uart_io.h"
#include "zx_tasks.h"
#include "zx_system_calls.h"

#include "zx_project_train_functions.h"
#include "zx_project_calibration.h"
#include "zx_project_track_sensing.h"
#include "zx_project_track_node.h"
#include "zx_project_track_data.h"

void train_init(zx_train* train, int train_id)
{
   train->train_id = train_id;

//   train->head_pos.node_id = -1;
   train->head_pos.time = 0;
   train->head_pos.dist = 0;
   
   train->distance_travelled_in_delta = 0;
   
   train->current_velocity = train->initial_velocity = train->final_velocity = 0;
   
   train-> t = train->t1 = train->t0 = 0;
   
   train->speed = 0;
   
   train->velocity_state = TRAIN_STATE_IMMOBILE;  
   
   // we don't care about these values at all
   train->speed_to_velocity[0][0]  = 0;
   train->speed_to_velocity[0][1]  = 35;   
   train->speed_to_velocity[0][2]  = 80;   
   train->speed_to_velocity[0][3]  = 130;   
   train->speed_to_velocity[0][4]  = 180;         

   // we don't care about these values as well
   train->stopping_distance[0]  = 0;
   train->stopping_distance[1]  = 0;

   train->speed_to_dec_time[0]  = 0;
   train->speed_to_dec_time[1]  = 0;
   train->speed_to_dec_time[2]  = 0;
   train->speed_to_dec_time[3]  = 0;
   train->speed_to_dec_time[4]  = 0;
   train->speed_to_dec_time[5]  = 0;
      
   if( train_id  == 49)
   {
      train->stopping_distance[2]  = 4987;
      train->stopping_distance[3]  = 12500;
      train->stopping_distance[4]  = 19450;
      train->stopping_distance[5]  = 25550;
      train->stopping_distance[6]  = 32487;
      train->stopping_distance[7]  = 41100;
      train->stopping_distance[8]  = 46737;
      train->stopping_distance[9]  = 52437;
      train->stopping_distance[10] = 58925;
      train->stopping_distance[11] = 66787;
      train->stopping_distance[12] = 73837;
      train->stopping_distance[13] = 81662;
      train->stopping_distance[14] = 81975;
      
      train->speed_to_velocity[0][5]  = 235;
      train->speed_to_velocity[0][6]  = 290;
      train->speed_to_velocity[0][7]  = 347;      
      train->speed_to_velocity[0][8]  = 404;      
      train->speed_to_velocity[0][9]  = 466;      
      train->speed_to_velocity[0][10] = 523;
      
      train->speed_to_velocity[0][11] = 582;
      train->speed_to_velocity[0][12] = 650;
      train->speed_to_velocity[0][13] = 684;
      train->speed_to_velocity[0][14] = 686;   
      

      train->speed_to_dec_time[6]  = 250;
      train->speed_to_dec_time[7]  = 338;
      train->speed_to_dec_time[8]  = 357;
      train->speed_to_dec_time[9]  = 359;
      train->speed_to_dec_time[10]  = 371;
      train->speed_to_dec_time[11]  = 337;
      train->speed_to_dec_time[12]  = 319;
      train->speed_to_dec_time[13]  = 277;
      train->speed_to_dec_time[14]  = 276;                              
   }

   if( train_id  == 50)
   {
      train->stopping_distance[2]  = 4987;
      train->stopping_distance[3]  = 12500;
      train->stopping_distance[4]  = 19450;
      train->stopping_distance[5]  = 25550;
      train->stopping_distance[6]  = 32487;
      train->stopping_distance[7]  = 41100;
      train->stopping_distance[8]  = 46737;
      train->stopping_distance[9]  = 52437;
      train->stopping_distance[10] = 58925;
      train->stopping_distance[11] = 66787;
      train->stopping_distance[12] = 73837;
      train->stopping_distance[13] = 81662;
      train->stopping_distance[14] = 81975;
      
      
      
      train->speed_to_velocity[0][5]  = 222;
      train->speed_to_velocity[0][6]  = 272;
      train->speed_to_velocity[0][7]  = 331;      
      train->speed_to_velocity[0][8]  = 384;      
      train->speed_to_velocity[0][9]  = 443;      
      train->speed_to_velocity[0][10] = 492;
      
      train->speed_to_velocity[0][11] = 534;
      train->speed_to_velocity[0][12] = 583;
      train->speed_to_velocity[0][13] = 646;
      train->speed_to_velocity[0][14] = 638;   
      
      train->speed_to_dec_time[6]  = 346;
      train->speed_to_dec_time[7]  = 385;
      train->speed_to_dec_time[8]  = 403;
      train->speed_to_dec_time[9]  = 393;
      train->speed_to_dec_time[10]  = 386;
      train->speed_to_dec_time[11]  = 363;
      train->speed_to_dec_time[12]  = 378;
      train->speed_to_dec_time[13]  = 314;
      train->speed_to_dec_time[14]  = 324;        
      
   }
      
   
/*   
   
   if( train_id  == 49)
   {
      // update stopping distance array. all distances in 100*mm ( zx_distance units )
      train->stopping_distance[0]  = 0;
      train->stopping_distance[1]  = 0;
      train->stopping_distance[2]  = 4987;
      train->stopping_distance[3]  = 12500;
      train->stopping_distance[4]  = 19450;
      train->stopping_distance[5]  = 25550;
      train->stopping_distance[6]  = 32487;
      train->stopping_distance[7]  = 41100;
      train->stopping_distance[8]  = 46737;
      train->stopping_distance[9]  = 52437;
      train->stopping_distance[10] = 58925;
      train->stopping_distance[11] = 66787;
      train->stopping_distance[12] = 73837;
      train->stopping_distance[13] = 81662;
      train->stopping_distance[14] = 81975;
      
            // update velocity to speed array
      // index 0 for velocity after acceleration
      train->speed_to_velocity[0][0]  = 0;
      train->speed_to_velocity[0][1]  = 35;
      train->speed_to_velocity[0][2]  = 80; // TODO
      train->speed_to_velocity[0][3]  = 130; // TODO
      train->speed_to_velocity[0][4]  = 181;
      train->speed_to_velocity[0][5]  = 233;
      train->speed_to_velocity[0][6]  = 286;
      train->speed_to_velocity[0][7]  = 347;
      
      train->speed_to_velocity[0][8]  = 396;      
      train->speed_to_velocity[0][9]  = 432;      
      train->speed_to_velocity[0][10] = 559;
      
      train->speed_to_velocity[0][11] = 569;
      train->speed_to_velocity[0][12] = 629;
      train->speed_to_velocity[0][13] = 660;
      train->speed_to_velocity[0][14] = 660;
      
   }
   
   if( train_id  == 50)
   {
      // update stopping distance array. all distances in 100*mm ( zx_distance units )
      train->stopping_distance[0]  = 0;
      train->stopping_distance[1]  = 0;
      train->stopping_distance[2]  = 4987;
      train->stopping_distance[3]  = 12500;
      train->stopping_distance[4]  = 19450;
      train->stopping_distance[5]  = 25550;
      train->stopping_distance[6]  = 32487;
      train->stopping_distance[7]  = 41100;
      train->stopping_distance[8]  = 46737;
      train->stopping_distance[9]  = 52437;
      train->stopping_distance[10] = 58925;
      train->stopping_distance[11] = 66787;
      train->stopping_distance[12] = 73837;
      train->stopping_distance[13] = 81662;
      train->stopping_distance[14] = 81975;
      
            // update velocity to speed array
      // index 0 for velocity after acceleration
      train->speed_to_velocity[0][0]  = 0;
      train->speed_to_velocity[0][1]  = 35;
      train->speed_to_velocity[0][2]  = 80; // TODO
      train->speed_to_velocity[0][3]  = 130; // TODO
      train->speed_to_velocity[0][4]  = 181;
      train->speed_to_velocity[0][5]  = 233;
      train->speed_to_velocity[0][6]  = 286;
      train->speed_to_velocity[0][7]  = 347;
      
      train->speed_to_velocity[0][8]  = 405;      
      train->speed_to_velocity[0][9]  = 448;      
      train->speed_to_velocity[0][10] = 435;
      
      train->speed_to_velocity[0][11] = 569;
      train->speed_to_velocity[0][12] = 629;
      train->speed_to_velocity[0][13] = 660;
      train->speed_to_velocity[0][14] = 660;
      
   }   
*/   
/*   
   
   if( train_id == 39 ) // TODO
   {
   
      train->stopping_distance[0]  = 0;
      train->stopping_distance[1]  = 0;
      train->stopping_distance[2]  = 4737;
      train->stopping_distance[3]  = 11950;
      train->stopping_distance[4]  = 19062;
      train->stopping_distance[5]  = 25100;
      train->stopping_distance[6]  = 32362;
      train->stopping_distance[7]  = 40187;
      train->stopping_distance[8]  = 44262;
      train->stopping_distance[9]  = 51662;
      train->stopping_distance[10] = 56900;
      train->stopping_distance[11] = 64675;
      train->stopping_distance[12] = 71487;
      train->stopping_distance[13] = 79125;
      train->stopping_distance[14] = 79612;
         
      // update velocity to speed array
      // index 0 for velocity after acceleration
      train->speed_to_velocity[0][0]  = 0;
      train->speed_to_velocity[0][1]  = 35;
      train->speed_to_velocity[0][2]  = 80; // TODO
      train->speed_to_velocity[0][3]  = 181; // TODO
      train->speed_to_velocity[0][4]  = 172;
      train->speed_to_velocity[0][5]  = 226;
      train->speed_to_velocity[0][6]  = 278;
      train->speed_to_velocity[0][7]  = 335;
      train->speed_to_velocity[0][8]  = 379;
      train->speed_to_velocity[0][9]  = 421;
      train->speed_to_velocity[0][10] = 456;
      train->speed_to_velocity[0][11] = 508;
      train->speed_to_velocity[0][12] = 553;
      train->speed_to_velocity[0][13] = 602;
      train->speed_to_velocity[0][14] = 602;
   }
*/
//TODO:   train->current_edge = nothing;
   
   train->direction = 1; // ahead
   
   int i;
   
   for (i = 0; i < NEXT_SENSOR_COUNT; i++)
   {   
      train->expected_sensors[i].time = 0;  
      train->expected_sensors[i].node = 0;   // null   
      train->expected_sensors[i].dist = -1; 
   }
   
   for (i = 0; i < WAYPOINT_COUNT; i++)
   {   
      train->route_waypoints[i].node = 0;  // null  
      train->route_waypoints[i].offset = 0;   
      train->route_waypoints[i].distance = 0; 
   }   
   
   for (i = 0; i < TRAIN_EDGE_COUNT; i++)
   {   
      train->edges[i] = 0; // null    
   }      
   
   for (i = 0; i < TRACK_MAX; i++)
   {   
      train->route_nodes[i] = 0;    
      train->route_edges[i] = 0;    
   }    
   
   for (i = 0; i < TURNOUT_BUF_SIZE; i++)
   {
      train->route_turnouts[i] = DIR_CURVED; // curved   
   }
   
   for (i = 0; i < TURNOUT_BUF_SIZE; i++)
   {
      train->route_turnouts_toggled[i] = 0;   
   }   

   for (i = 0; i < RESERVED_EDGES_COUNT; i++)
   {
      train->reserved_edges[i] = 0;    
   }    
   
   train->ui_route_updated = 1;
   train->waypoint_index = 0;   
   
   train->target.node = 0;
   
   train->last_triggered_sensor_node = 0;
   train->last_triggered_sensor_error = 0;
   train->last_triggered_sensor_time = 0;
   train->last_triggered_sensor_velocity = 0;
      
   train->ui_reservation_available = 0;
   train->speed_before_slowdown = 0;
   
   train->current_task = TRAIN_TASK_IDLE;
   train->stop_way = TRAIN_STOP_WAY_NONE;
   
}



void train_commit_reverse(zx_train* train)
{
   char com1_output[50];
   int com1_output_size = 0;
   
   com1_output_size = 0;
      com1_output[com1_output_size++] = 15;
      com1_output[com1_output_size++] = train->train_id;
      com1_output[com1_output_size++] = UART_PACKET_END_CHAR;      
   PutMultiple(COM1, com1_output); 
}


void train_commit(zx_train* train)
{
   char com1_output[50];
   int com1_output_size = 0;
   
   com1_output_size = 0;
      com1_output[com1_output_size++] = train->speed;
      com1_output[com1_output_size++] = train->train_id;
      com1_output[com1_output_size++] = UART_PACKET_END_CHAR;      
   PutMultiple(COM1, com1_output); 
}

void train_set_speed(zx_train* train, int new_speed)
{
   // update speed variables
   int time = Time();
   train->t = time;
   
   // TODO: we should not do it here becuase we may decclerate when we are accelerating and vice versa
   train->current_velocity = train->final_velocity;
   
   
   /* State1: IMMOBILE -> ACC -> UNI -> DEC */
   /* State2: UNI -> ACC ; UNI -> DEC */     
   
   if (new_speed > train->speed)
   {  
      train->t1 = time + train_calc_accelerating_delay(train, new_speed);
      train->final_velocity = train->speed_to_velocity[0][new_speed];
      train->speed = new_speed;
      train->velocity_state = TRAIN_STATE_ACCELERATING;
   }
   else if (new_speed < train->speed)
   {
      train->t1  = time + train_calc_deccelerating_delay(train, new_speed);
      train->final_velocity = train->speed_to_velocity[0][new_speed]; // TODO : train->speed_to_velocity[1][new_speed] in case the deccelerated velocity varies
      train->speed = new_speed;      
      train->velocity_state = TRAIN_STATE_DECCELERATING;   
   }
             
   train_commit(train);
}

/* IMMPORTANT FUNCTION*/

void train_update_velocity_and_offset(zx_train* train)
{
   int time = Time();
   
   train->initial_velocity = train->current_velocity;
   train->t0               = train->t; // last time
   
   train->t                = time;
   
//   train->last_offset = train->head_pos.dist; // 100 * mm

   int changed = 0;

   if ((time >= train->t1) && (train->velocity_state == TRAIN_STATE_ACCELERATING || train->velocity_state == TRAIN_STATE_DECCELERATING) ) 
   {
      changed = 1;
      
      train->t                = train->t1; // to complete the change!
   
//      train->initial_velocity = train->final_velocity;  
      
   }
   
   if( train->velocity_state != TRAIN_STATE_IMMOBILE )
   {
      train_find_velocity_and_distance_in_delta( train );
   }
   else
   {
      train->distance_travelled_in_delta = 0;
   }
   
   if (changed)
   {       
      int distance_part_1 = train->distance_travelled_in_delta;
   
      train->current_velocity = train->final_velocity;   
      train->initial_velocity = train->current_velocity;
      train->t0               = train->t; // last time
      

//      train->t1 = (1 << 30); // makes to keep updating all the time!!!
      if (train->speed == 0)  // DECCELERATING TO IMMOBILE
      {
         train->velocity_state = TRAIN_STATE_IMMOBILE;
      }
      else  // ACCELERATING TO UNIFORM
      {
         train->velocity_state = TRAIN_STATE_UNIFORM;  
      }   
      
      train->t                = time;
      
      if( train->velocity_state != TRAIN_STATE_IMMOBILE )
      {
         train_find_velocity_and_distance_in_delta( train );
      }
      else
      {
         train->distance_travelled_in_delta = 0;
      }      
      
      train->distance_travelled_in_delta = train->distance_travelled_in_delta + distance_part_1;
      
   }
}

void train_update_expected_sensors_rec(zx_train* train, track_node* start, int depth, int start_distance) // distance is in DISTANCE_UNIT!!!
{

   track_node* node = start; 

   int array_index = -1;
   int i;
   
   if (depth == 0)
      return;
   
   for (i = 0; i < NEXT_SENSOR_COUNT; i++)
   {   
      if (train->expected_sensors[i].node == 0)
      {
         array_index = i;
         break;
      }  
   }

   if (array_index == -1)
      return; // no more place
         
   int current_count = 0;   
   int current_distance = start_distance;
   
   while( node->type != NODE_EXIT )
   {
      if (node->type == NODE_SENSOR)
      {
         // if we need to calc expected sensors
         
         train->expected_sensors[array_index].node = node;
         train->expected_sensors[array_index].dist = current_distance;
         array_index++;
         current_count++;
         
         if (current_count == NEXT_SENSOR_LOOKUP_BREADTH)
         {
            break;            
         }
         
         if (array_index == NEXT_SENSOR_COUNT) // max count
         {
            break;
         }         
      }

      else if (node->type == NODE_BRANCH) // if we are on the branch node
      {

         // run the recursion for both straight and curved directions. Because we have to be aware of cases if turnout is not switched properly
         
         int distance_straight = current_distance + node->edge[DIR_STRAIGHT].dist * DISTANCE_UNIT;         
         int distance_curved = current_distance + node->edge[DIR_CURVED].dist * DISTANCE_UNIT;
         
         train_update_expected_sensors_rec(train, node->edge[DIR_STRAIGHT].dest, depth - 1, distance_straight);
         train_update_expected_sensors_rec(train, node->edge[DIR_CURVED].dest, depth - 1, distance_curved);
         break;           
      }
      
      if (node == train->target.node) // if this is a node we need to get to
      {
         train->target.visible = 1; // yes! we see it!     
         train->target.distance_to_node = current_distance; // yes, now we can estimate distance! yahoo!!!     
      }

      current_distance += node->edge[DIR_AHEAD].dist * DISTANCE_UNIT;      
      node = node->edge[DIR_AHEAD].dest;
      
   }

   
}

void train_update_expected_sensors(zx_train* train)
{
   int i;
   
   for (i = 0; i < NEXT_SENSOR_COUNT; i++)
   {   
      train->expected_sensors[i].time = 0;    
      train->expected_sensors[i].node = 0;   
      train->expected_sensors[i].dist = -1; 
   }
      
   if (train->velocity_state == TRAIN_STATE_IMMOBILE)
      return;
      
   track_node* node = train->head_pos.edge->dest; 
   
   // get the destination of the edge the train is on
   // this is more reliable than getting the source, because of branches
      
   // if destination is exit node, then we will get nothing but list of NULL nodes.    
   
   int current_distance = ((train->head_pos.edge->dist * DISTANCE_UNIT) - train->head_pos.dist);
   
//   zx_printf("OK!!!");
   
   train_update_expected_sensors_rec(train, node, 2, current_distance); // recursive call
   
//   zx_printf("OK!!!");
   
}



int train_get_run_speed_from_distance(zx_train* train, int distance)
{

//   return 5;

   int i;
   int result = 0;
   
   for (i = 10; i >= 0; i--)
   {
      if (train->stopping_distance[i] * 2 + 200 * 100 <= distance)
      {
         result = i;
         break;
      }
   }
   
   return result;
}

void train_stop_task(void )
{
   int tid = 0;
   
   zx_train_stop_request train_stop_request;

   FOREVER
   {
      Receive( &tid, &train_stop_request, sizeof( train_stop_request ) );
      Reply( tid, &train_stop_request , sizeof ( train_stop_request ) ); 
      
      zx_train *train = train_stop_request.train;
            
      if (train_stop_request.expected_time < 0)
      {
         train_set_speed(train, 0);
         train->stop_way = TRAIN_STOP_WAY_VOLUNTARY;   
         break; 
      }
     
      Delay ( train_stop_request.expected_time );
      
      train_set_speed(train, 0);      
   }
   Exit();
}


void train_update_vertices_by_distance_traveled(zx_train* train, int current_time, int turnout_states[])
{


   train->head_pos.dist = train->head_pos.dist + train->distance_travelled_in_delta;
   train->tail_pos.dist = train->tail_pos.dist + train->distance_travelled_in_delta;
   
   train->head_pos.time = current_time; 
   train->tail_pos.time = current_time;   
   
   while (train->head_pos.dist >= train->head_pos.edge->dist * DISTANCE_UNIT)
   {
      int last_edge_length = train->head_pos.edge->dist * DISTANCE_UNIT;      
      track_node* new_node = train->head_pos.edge->dest; // get the new node we are supposed to pass       
      train->head_pos.node = new_node;
      train->head_pos.dist = train->head_pos.dist - last_edge_length;
      
      // when we get edge, we should pay attention if it is a branch node 
      if (new_node->type == NODE_BRANCH)
      {
         if (turnout_states[new_node->num] == DIR_STRAIGHT)
         {
            train->head_pos.edge = &new_node->edge[DIR_STRAIGHT];
         }
         else
         {
            train->head_pos.edge = &new_node->edge[DIR_CURVED];
         }
      }
      else
         train->head_pos.edge = &new_node->edge[DIR_AHEAD];
               
   }
   
   

   while (train->tail_pos.dist >= train->tail_pos.edge->dist * DISTANCE_UNIT)
   {
      int last_edge_length = train->tail_pos.edge->dist * DISTANCE_UNIT;      
      track_node* new_node = train->tail_pos.edge->dest; // get the new node we are supposed to pass 
      train->tail_pos.node = new_node;   
      
      train->tail_pos.dist = train->tail_pos.dist - last_edge_length;
      
      // when we get edge, we should pay attention if it is a branch node 
      if (new_node->type == NODE_BRANCH)
      {
         if (turnout_states[new_node->num] == DIR_STRAIGHT)
         {
            train->tail_pos.edge = &new_node->edge[DIR_STRAIGHT];
         }
         else
         {
            train->tail_pos.edge = &new_node->edge[DIR_CURVED];
         }
      }
      else
         train->tail_pos.edge = &new_node->edge[DIR_AHEAD];
         
      
               
   }
   
   
/*   
   if (train->head_pos.dist >= last_edge_length) // it means we have passed this node
   {            
      track_node* new_node = train->head_pos.edge->dest; // get the new node we are supposed to pass         

      train->head_pos.node = new_node;
      train->head_pos.dist = train->head_pos.dist - last_edge_length;
      
      // when we get edge, we should pay attention if it is a branch node 
      if (new_node->type == NODE_BRANCH)
      {
         if (turnout_states[new_node->num].state == DIR_STRAIGHT)
         {
            train->head_pos.edge = &new_node->edge[DIR_STRAIGHT];
         }
         else
         {
            train->head_pos.edge = &new_node->edge[DIR_CURVED];
         }
      }
      else
         train->head_pos.edge = &new_node->edge[DIR_AHEAD];
             
   }
*/   

/*   
   last_edge_length = (train->tail_pos.edge->dist * DISTANCE_UNIT);

   if (train->tail_pos.dist >= last_edge_length) // it means we have passed this node
   {            
      track_node* new_node = train->tail_pos.edge->dest; // get the new node we are supposed to pass         

      train->tail_pos.node = new_node;
      train->tail_pos.time = current_time; 
      train->tail_pos.dist = train->tail_pos.dist - last_edge_length;
      
      // when we get edge, we should pay attention if it is a branch node 
      if (new_node->type == NODE_BRANCH)
      {
         if (turnout_states[new_node->num].state == DIR_STRAIGHT)
         {
            train->tail_pos.edge = &new_node->edge[DIR_STRAIGHT];
         }
         else
         {
            train->tail_pos.edge = &new_node->edge[DIR_CURVED];
         }
      }
      else
         train->tail_pos.edge = &new_node->edge[DIR_AHEAD];
      
   }  
*/      
   
   train_update_edges(train);

}

void train_reverse(zx_train* train)
{
   /* REVERSING */         
   
   zx_train_pos temp_pos;
   
   
   // temp = head_pos
   
   temp_pos.time = train->head_pos.time;
   temp_pos.node = train->head_pos.node;
   temp_pos.dist = train->head_pos.dist;
   temp_pos.edge = train->head_pos.edge;

   // head_pos = tail_pos
   
   train->head_pos.time = train->tail_pos.time;
   train->head_pos.node = train->tail_pos.node;
   train->head_pos.dist = train->tail_pos.dist;
   train->head_pos.edge = train->tail_pos.edge;
      
   // tail_pos = temp
   
   train->tail_pos.time = temp_pos.time;
   train->tail_pos.node = temp_pos.node;
   train->tail_pos.dist = temp_pos.dist;
   train->tail_pos.edge = temp_pos.edge;
   

   // head: get reverse of the edges and adjust distances
   train->head_pos.edge = train->head_pos.edge->reverse;
   train->head_pos.dist = train->head_pos.edge->dist * DISTANCE_UNIT - train->head_pos.dist; 
   
   // tail: get reverse of the edges and adjust distances
   train->tail_pos.edge = train->tail_pos.edge->reverse;
   train->tail_pos.dist = train->tail_pos.edge->dist * DISTANCE_UNIT - train->tail_pos.dist; 
   
   
   // head: flip the reference node
   train->head_pos.node = train->head_pos.edge->src;
   
   // tail: flip the reference node
   train->tail_pos.node = train->tail_pos.edge->src;

   
   // reverse the direction   
   train->direction = -train->direction;
   
   // update expected sensors, because now they are different
   train_update_expected_sensors(train);
   
   train_update_edges(train);
   
   train_commit_reverse(train); // reverse the train  

}

int train_next_waypoint(zx_train* train, int reset)
{  

   if (!reset)
   {
      train->waypoint_index = train->waypoint_index + 1;
   }
   else
   {  
      train->waypoint_index = 0;   
   }
      
   if ((train->waypoint_index < WAYPOINT_COUNT) && (train->route_waypoints[train->waypoint_index].node != 0))
   {            
      train->target.node = train->route_waypoints[train->waypoint_index].node;
      
      train->target.distance_to_node = train->route_waypoints[train->waypoint_index].distance * DISTANCE_UNIT;              
      train->target.offset_from_node = train->route_waypoints[train->waypoint_index].offset * DISTANCE_UNIT;                        
      train->target.visible = 0; // assume the train cannot sense it yet. It is too far away, and it is not worth talking about distance    
      
      if (reset)
      {
         train->target.distance_to_node += (train->head_pos.edge->dist * DISTANCE_UNIT - train->head_pos.dist);
         
      }
       
      return 1;
   }
   else
   {
      train->target.node = 0;
      train->target.visible = 0; 
      
      train->target.distance_to_node = 0;              
      train->target.offset_from_node = 0;                 
      train->waypoint_index = 0;   
         
      return 0;   
   }

}

void train_update_edges(zx_train* train)
{
   // for one direction of the graph
   train->edges[0] = train->head_pos.edge;
   train->edges[1] = train->tail_pos.edge;


   if (
      // if two edges are actually adjacent OR the same      
      train->edges[1]->dest == train->edges[0]->src
      ||
      (
      
      train->edges[1]->dest == train->edges[0]->dest
      &&
      train->edges[1]->src == train->edges[0]->src
      
      )      
      
   )
   {
      /*
      
      ==== TAIL_EDGE_SRC ================ TAIL_EDGE_DEST ===================== HEAD_EDGE_DEST =====>
                           edges[0]        HEAD_EDGE_SRC       edges[1]            
      
      */


      train->edges[2] = 0;   
   }
   else
   {
      // edges are not adjacent, so there is one in between
      
      
      /*
      
                                                    //==============================
                                                  //
      ==== TAIL_EDGE_SRC ========= TAIL_EDGE_DEST ============== HEAD_EDGE_SRC =========== HEAD_EDGE_DEST =====>
                          edges[0]                    edges[4]                   edges[1]                    
      
      */
      
      // we assume that the destination node of the tail edge cannot be EXIT node,
      // so there is an edge from that
      
      // we use DIR_AHEAD 
      
      track_edge* edge = &train->tail_pos.edge->dest->edge[DIR_AHEAD];
      
      if (edge->dest == train->head_pos.edge->src)
      // then we have found this intermediate edge successfully
      {
         train->edges[2] = edge;   
      }
      
      else
      {
         if (train->tail_pos.edge->dest->type == NODE_BRANCH) // then it has a DIR_CURVED edge
         {
            edge = &train->tail_pos.edge->dest->edge[DIR_CURVED];
            

            /*
                                                            edges[4]                       edges[1]
                                                          //============== HEAD_EDGE_SRC =========== HEAD_EDGE_DEST ===>
                                                        //
            ==== TAIL_EDGE_SRC ========= TAIL_EDGE_DEST =============================================
                                edges[0]                                                           
            
            */
            
            
            if (edge->dest == train->head_pos.edge->src)
            // then we have found this intermediate edge successfully
            {
               train->edges[2] = edge;   
            }
            else
            {
               train->edges[2] = 0;   
            // ERROR !!! CANNOT FIND EDGE!!!
            }           
            
         } 
         else
         {
            train->edges[2] = 0;       
         // ERROR !!! CANNOT FIND EDGE!!!
         }           
      }
         
      
   }
   
}


int train_sensor_search_rec(track_node* start, track_node* sensor_node)
{
   track_node* node = start; 
   
   int current_count = 0;   

   while( node->type != NODE_EXIT )
   {
      if (node->type == NODE_SENSOR)
      {
         if (node == sensor_node)
            return 1; // found the sensor
         
         current_count++;
         
         if (current_count == NEXT_SENSOR_LOOKUP_BREADTH)
         {
            break;            
         }
      }

      else if (node->type == NODE_BRANCH) // if we are on the branch node
      {

         // run the recursion for both straight and curved directions. Because we have to be aware of cases if turnout is not switched properly
         
         return 
            train_sensor_search_rec(node->edge[DIR_STRAIGHT].dest, sensor_node)
            ||            
            train_sensor_search_rec(node->edge[DIR_CURVED].dest, sensor_node);
      }

      node = node->edge[DIR_AHEAD].dest;
      
   }
   
   return 0; // not found
   
}

void train_adjust_position_by_sensor_toggle(zx_train* train, track_node* sensor_node, int time, int turnout_states[])
{
   if (train->direction > 0)
   {
   /*
                sensor
     ====|==========|==|=========>
        tail          head
   */
      
   
      train->head_pos.node = sensor_node;
      train->head_pos.time = time; 
      train->head_pos.dist = TRAIN_HEAD_OFFSET * DISTANCE_UNIT; 
      // we always assume that TRAIN_HEAD_OFFSET is less than the length of any edge containing a sensor
      
      train->head_pos.edge = &train->head_pos.node->edge[DIR_AHEAD];

      track_edge* reverse_edge = &sensor_node->reverse->edge[DIR_AHEAD];
      track_edge* direct_edge = reverse_edge->reverse;

      int temporary_distance = direct_edge->dist;

      if (temporary_distance >= TRAIN_TAIL_OFFSET)
      // if previous edge is long enough to fit all the part of the train from sensor to tail
      {
         // direct_edge.src will be exactly the previous node
         train->tail_pos.node = direct_edge->src;
         train->tail_pos.time = time; 
         train->tail_pos.dist = (direct_edge->dist - TRAIN_TAIL_OFFSET) * DISTANCE_UNIT;
         train->tail_pos.edge = direct_edge;         
      }
      else
      // it means we need to look behind further
      {
         track_node* next_node = reverse_edge->dest;
         if (next_node->type != NODE_BRANCH) // if no branching
         {
            // then we simply take the edge, and that's it
            direct_edge = next_node->edge[DIR_AHEAD].reverse;         
         }      
         else
         {
            // else the node is branch, and we need to search for the next few sensors on CURVED path
            // if one of them matches the last_triggered_sensor, then it means we have come from the CURVED branch
            // in all other cases we assume we have come from the STRAIGHT branch.
            
            track_node* branch_node = next_node; 
            
            if (train_sensor_search_rec(branch_node->edge[DIR_CURVED].dest, train->last_triggered_sensor_node->reverse))
            // we search for the last triggered sensor on this curved direction
            {
               direct_edge = branch_node->edge[DIR_CURVED].reverse; // OK, the tail is on the branch then!
            }
            else
            {
               direct_edge = branch_node->edge[DIR_STRAIGHT].reverse; // else the tail is on the straight branch
            }  
         }
            
         train->tail_pos.node = direct_edge->src;
         train->tail_pos.time = time; 
         train->tail_pos.dist = (direct_edge->dist - TRAIN_TAIL_OFFSET + temporary_distance) * DISTANCE_UNIT;
         train->tail_pos.edge = direct_edge;            
      
      }

   }
   else
   {
   /*
            sensor          
     ====|==|==========|=========>
        tail          head
   */
      
   // this case is easier

      track_edge* reverse_edge = &sensor_node->reverse->edge[DIR_AHEAD];
      track_edge* direct_edge = reverse_edge->reverse;
      // getting the edge right behind the sensor

      train->tail_pos.node = direct_edge->src;
      train->tail_pos.time = time; 
      train->tail_pos.dist = (direct_edge->dist - TRAIN_HEAD_OFFSET) * DISTANCE_UNIT;       
      train->tail_pos.edge = direct_edge;
   
      // next, we want to calculate the head position      
      // for this purpose, we will look ahead. If there are branch nodes, use turnout_states to get the direction    

      track_edge* edge_ahead = &sensor_node->edge[DIR_AHEAD];
      
      if (edge_ahead->dist >= TRAIN_TAIL_OFFSET)
      {
         train->head_pos.node = sensor_node;
         train->head_pos.time = time; 
         train->head_pos.dist = TRAIN_TAIL_OFFSET * DISTANCE_UNIT;       
         train->head_pos.edge = edge_ahead;      
      }
      else // have to look further
      {
         track_edge* edge_for_head;
      
         if (edge_ahead->dest->type == NODE_BRANCH) // if after that is branch
         {
            if (turnout_states[edge_ahead->dest->num] == DIR_STRAIGHT)
               edge_for_head = &edge_ahead->dest->edge[DIR_STRAIGHT];
            else
               edge_for_head = &edge_ahead->dest->edge[DIR_CURVED];               
         }   
         else
         {
            edge_for_head = &edge_ahead->dest->edge[DIR_AHEAD];
         }   
          
         train->head_pos.node = edge_for_head->src;
         train->head_pos.time = time; 
         train->head_pos.dist = (TRAIN_TAIL_OFFSET - edge_ahead->dist) * DISTANCE_UNIT;       
         train->head_pos.edge = edge_for_head;             
           
          
      }
   
   }
      
   train_update_edges(train);
      
}


void train_calibrate_velocity(zx_train* train, track_node* current_sensor_node, int current_time)
{
   if (current_time <= train->last_triggered_sensor_time)
      return;
      
   if (train->last_triggered_sensor_velocity != train->current_velocity)
      return;

   if (train->last_triggered_sensor_node->edge[DIR_AHEAD].dest != current_sensor_node) // only adjacent
      return;
      
   if (
   (train->last_triggered_sensor_node->index == SENSOR_C15 && current_sensor_node->index == SENSOR_D12)
   ||
   (train->last_triggered_sensor_node->index == SENSOR_D4 && current_sensor_node->index == SENSOR_B6)   
   ||
   (train->last_triggered_sensor_node->index == SENSOR_B1 && current_sensor_node->index == SENSOR_D14)
   )
   {
      int old_velocity = train->speed_to_velocity[0][train->speed];      
      int calc_velocity = train->last_triggered_sensor_node->edge[DIR_AHEAD].dist * DISTANCE_UNIT / (current_time - train->last_triggered_sensor_time);   
      int new_velocity = ( 3 * old_velocity + calc_velocity) / 4; 
      
      train->speed_to_velocity[0][train->speed] = new_velocity;
   }

}


