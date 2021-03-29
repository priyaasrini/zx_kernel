/*
 * zx_shortest_path.c
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#include "zx_uart_io.h"
#include "zx_system_calls.h"
#include "zx_helper.h"

#include "zx_project_track_data.h"
#include "zx_project_track_node.h"
#include "zx_project_shortest_path.h"
#include "zx_project_track_sensing.h"
#include "zx_project_track_functions.h"
#include "zx_project_calibration.h"
#include "zx_project_graphics.h"
#include "zx_project_path_reservation.h"

int track_calc_shortest_path_from_two_dest(track_node* track, int source_index_1, int source_index_2, int destination_index, track_node* route_nodes[], track_edge* route_edges[], zx_waypoint route_waypoints[], int route_turnouts[])
{

   // finding path from source to destination
   int path1_stack[TRACK_MAX];
   int path1_distance[TRACK_MAX];
   int path1_stack_top;

   int path2_stack[TRACK_MAX];
   int path2_distance[TRACK_MAX];
   int path2_stack_top;

   
   int found_1;
   int found_2;
   
   found_1 = zx_shortest_path( source_index_1, destination_index, path1_stack, path1_distance, &path1_stack_top, track, REVERSE_PENALTY);
   found_2 = zx_shortest_path( source_index_2, destination_index, path2_stack, path2_distance, &path2_stack_top, track, REVERSE_PENALTY);

   int distance_1 = ZX_INFINITY;
   int distance_2 = ZX_INFINITY;

   int route_length = 0; // make the route length 0
   
   if (!found_1 && !found_2) // not found
      return 0;
      
   int result = 0;
   
   if (found_1) // if found from one source, get the distance
      distance_1 = path1_distance[path1_stack[0]];
   
   if (found_2) // if found from one source, get the distance
      distance_2 = path2_distance[path2_stack[0]];
   
   if (distance_1 <= distance_2) // if the first route is shorter
   {
      zx_get_edges_waypoints_turnouts( route_waypoints, route_edges, route_turnouts, path1_stack, path1_distance, track, path1_stack_top );   

      while( path1_stack_top != -1 )
      {
         route_nodes[route_length++] = &track[path1_stack[path1_stack_top--]];
      }
      
      result = 1;
   }
   else // the second route is shorter
   {
      zx_get_edges_waypoints_turnouts( route_waypoints, route_edges, route_turnouts, path2_stack, path2_distance, track, path2_stack_top );   

      while( path2_stack_top != -1 )
      {
         route_nodes[route_length++] = &track[path1_stack[path2_stack_top--]];
      }
      
      result = 2;
   }   
   
   int i;
   
   // fill the rest with -1
   for (i = route_length; i < TRACK_MAX; i++)
   {
      route_nodes[i] = 0;
   }

      /*
      zx_put_string("[", result_path, result_path_length);   
   
      while( path1_stack_top != -1 )
      {
//         distance_1 = path1_distance[path1_stack[path1_stack_top]];

         zx_put_string(track[path1_stack[path1_stack_top]].name, result_path, result_path_length);
         zx_put_string(" ", result_path, result_path_length);          
         path1_stack_top--;
      }
      
      // printing route_waypoints
      zx_put_string("][", result_path, result_path_length);   
            
      zx_prepare_track( turnout_states, path1_stack, track, stack1_top );
      
      zx_get_route_waypoints( route_waypoints, path1_stack, path1_distance, track, stack1_top );
      
      int wp_index = 0;

      while (wp_index < WAYPOINT_COUNT)
      {
         if (route_waypoints[wp_index].node == 0)
            break;

         // (ID; offset; distance to the node)

         zx_put_string("(", result_path, result_path_length);             
         zx_put_string(route_waypoints[wp_index].node->name, result_path, result_path_length);
         zx_put_string(";", result_path, result_path_length); 
         zx_put_number(route_waypoints[wp_index].offset, result_path, result_path_length);
         zx_put_string(";", result_path, result_path_length); 
         zx_put_number(route_waypoints[wp_index].distance, result_path, result_path_length);         
         zx_put_string(")", result_path, result_path_length);   
         
         wp_index++;       
      }

      zx_put_string("]", result_path, result_path_length);  
      
      */ 
         
   return result;
}


void zx_get_edges_waypoints_turnouts(  zx_waypoint route_waypoints[], track_edge* edges[], int route_turnouts[],  int path_stack[], int path_distance[], track_node track[], int path_stack_top)
{
//   zx_printf( COM2, "In prepare track function %d\n", path_stack_top);   
   
   track_node* last_node = 0;
   track_node* current_node = 0;
   
   int wp_index = 0;   
   int current_distance = 0;
   int edge_index = 0;
   
   while( path_stack_top != -1 )
   {
      int last_distance;      
      if (wp_index > 0)
      {
         last_distance = route_waypoints[wp_index - 1].distance; // getting last distance.
      }
      else last_distance = 0;
      
      current_distance = path_distance[path_stack[path_stack_top]];
      current_node = &track[path_stack[path_stack_top--]];      
      
      if (last_node != 0)
      {
      
         // updating edges
         if (last_node->type == NODE_BRANCH)
         {
            if (last_node->edge[DIR_AHEAD].dest == current_node )
            {
               edges[edge_index++] = &last_node->edge[DIR_AHEAD];
               route_turnouts[last_node->num] = DIR_STRAIGHT;
            }
            else
            {
               edges[edge_index++] = &last_node->edge[DIR_CURVED];
               route_turnouts[last_node->num] = DIR_CURVED;
            }
         }
         else
         {
            edges[edge_index++] = &last_node->edge[DIR_AHEAD];   
         }
         
         /* Checking for reverse points */         
               
         if (current_node->num == last_node->num)
         // we have got branch waypoint
         {
            // MERGE => BRANCH
         
            if (last_node->type == NODE_MERGE && current_node->type == NODE_BRANCH)
            {
               route_waypoints[wp_index].node = last_node;
               route_waypoints[wp_index].offset = reverse_offset;
               route_waypoints[wp_index].distance = current_distance - last_distance;
               wp_index++;
            }
            
            // BRANCH => MERGE
            
            if (last_node->type == NODE_BRANCH && current_node->type == NODE_MERGE)
            {
               route_waypoints[wp_index].node = current_node;
               route_waypoints[wp_index].offset = reverse_offset;
               route_waypoints[wp_index].distance = current_distance - last_distance;
               wp_index++;
            }         
         }
         else if (last_node->type == NODE_SENSOR && current_node->type == NODE_SENSOR) 
         // if both last and current are sensors
         {
            if ((last_node->num % 2 == 0) && (last_node->num + 1 == current_node->num)) 
            // if something like 0 and 1, 10 and 11
            {
               route_waypoints[wp_index].node = last_node;
               route_waypoints[wp_index].offset = reverse_offset;        
               route_waypoints[wp_index].distance = current_distance - last_distance;
               wp_index++; 
            }
            else if ((current_node->num % 2 == 0) && (current_node->num + 1 == last_node->num)) 
            // if something like 1 and 0, 11 and 10
            {
               route_waypoints[wp_index].node = last_node;
               route_waypoints[wp_index].offset = reverse_offset;
               route_waypoints[wp_index].distance = current_distance - last_distance;
               wp_index++;         
            }         
         }
      }
               
      last_node = current_node;   
      
   }

   // put the last node as well.
   route_waypoints[wp_index].node = last_node;
   route_waypoints[wp_index].offset = 0;
   route_waypoints[wp_index].distance = current_distance;
   wp_index++;         
   
//   int i;
   while ( wp_index < WAYPOINT_COUNT)
   {
      route_waypoints[wp_index].node = 0;
      route_waypoints[wp_index].offset = 0;  
      route_waypoints[wp_index].distance = 0;   
      wp_index++;
   }
}


/*

void zx_prepare_track(  zx_turnout_state turnout_states[], int path_stack[], track_node track[], int path_stack_top)
{
   while( path_stack_top != -1 )
   {
      int index = path_stack[path_stack_top--];
      
      if( track[index].type == NODE_BRANCH )
      {
         int turnout_num = track[index].num;
         // depends on where you wnat to go next
         if( track[index].edge[DIR_STRAIGHT].dest->index == path_stack[path_stack_top] )
         { 
            // move straight
            if( turnout_states[turnout_num].state != TURNOUT_STATE_STRAIGHT )
            {
               // change the state to straight
               turnout_states[turnout_num].state = TURNOUT_STATE_STRAIGHT;
               turnout_commit(&turnout_states[turnout_num]);
            }
         }
         else if( track[index].edge[DIR_CURVED].dest->index == path_stack[path_stack_top] )
         {
            // move curved
            if( turnout_states[turnout_num].state != TURNOUT_STATE_CURVED )
            {
               // change the state to straight
               turnout_states[turnout_num].state = TURNOUT_STATE_CURVED;
               turnout_commit(&turnout_states[turnout_num]);
            }
         }
         else
         {
            zx_printf( COM2, "Oh No!! Branch Error ");
         }
        
      }
      
   }
}
*/

#if 0
void zx_shortest_path_test()
{
   int source_index = SENSOR_E14;
   int destination_index = SENSOR_C10;
   
   // states of turnouts
   zx_turnout_state turnout_states [TURNOUT_BUF_SIZE]; 
   turnout_init(turnout_states, 'c'); 

  // definition of the track and init
   track_node track [TRACK_MAX]; 
   track_init(CURRENT_TRACK, &track[0]); 
  
   // finding path from source to destination
   int path1_stack[TRACK_MAX];
   int path1_distance[TRACK_MAX];
   int path1_stack_top = -1;
   
   zx_shortest_path( source_index, destination_index, path1_stack, path1_distance, &path1_stack_top, track);
  
   int  stack1_top  = path1_stack_top;
   int  distance_1 = 0;
   zx_printf( COM2, "Printing Path 1\n");
   while( path1_stack_top != -1 )
   {
      distance_1 = path1_distance[path1_stack[path1_stack_top]];
      
      zx_printf( COM2, "-->Node:%s (%d)", track[path1_stack[path1_stack_top]].name, distance_1 );
      path1_stack_top--;
   }
   
   
   // finding path from sensor reversed
   int path2_stack[TRACK_MAX];
   int path2_distance[TRACK_MAX];
   int path2_stack_top = -1;
   
   zx_shortest_path( source_index, track[destination_index].reverse->num, path2_stack, path2_distance, &path2_stack_top, track);
   
   int  distance_2 = 0;
   int  stack2_top  = path2_stack_top;
      
   zx_printf( COM2, "\n\nPrinting Path 2\n");
   while( path2_stack_top!= -1 )
   {
      distance_2 = path2_distance[path2_stack[path2_stack_top]];
      
      zx_printf( COM2, "-->Node:%s (%d)", track[path2_stack[path2_stack_top]].name, distance_2 );
      path2_stack_top--;
   }
   
   // shortest of the two
   if( distance_1 < distance_2 )
   {
      zx_printf( COM2, "\n\nShortest is path 1 !!\n");
      zx_prepare_track( turnout_states, path1_stack, track, stack1_top );
   }
   else
   {
      zx_printf( COM2, "\n\nShortest is path 2!!\n");
      zx_prepare_track( turnout_states, path2_stack, track, stack2_top );
   }
   
   Exit();
}
#endif

/* This function implements the shortest path algorithm by Dijkstra
   Takes as input the following:
   
   1. Source Index      - This is sensor ID. This gives the direction of the train
   2. Destination Index - This is also sensor ID . This also gives the direction from which
                          the train should approach target ( sensor)
   3. path stack        - Path in which the train should travel to reach from src to destination.
                          This is filled by the below function
   4. path_stack_top    - Top of the stack that will be updated by the function as the path is 
                          updated
   5. track             - The graph of the track in which the shortest path is to be found
   
   Returns : TRUE if path is found, FALSE if not
 */

int zx_shortest_path( int source_index, int target_index, int path_stack[], int distance[], int *path_stack_top, track_node track[], int reverse_penalty)
{
  
   *path_stack_top = -1;   

    int i = 0;

    /* Data Structures needed for route calculation */
    char visited[TRACK_MAX];
    int  previous[TRACK_MAX];
    
    // lets have a counter to reduce extra work
    int number_of_nodes_visited = 0;
    
    int smallest_node_index=-1;
    int distance_from_source=-1;
    
    track_edge *edge_under_consideration;
    
    /* Initialization */
    for( i=0; i< TRACK_MAX; i++ )
    {
      visited[i]  = NO;
      distance[i] = ZX_INFINITY;
      previous[i] = source_index;
    }   
    
    distance[source_index] = 0;
    
    while( number_of_nodes_visited < TRACK_MAX )
    {
      smallest_node_index = find_shortest_distance_node( distance, visited );      

      visited[smallest_node_index] = YES;
      number_of_nodes_visited++;
           
      if( smallest_node_index == -1 )
      {
         // we are done
         // the remaining nodes cannot be reached from the source
         // no path found - this should not happen
         return FALSE;
      }
           
            
      //  check if we have already reached the target
      if( smallest_node_index == target_index )
      {
         int path_length=0;
         int current_node_index=0;
              
//         int previous_node_index=0;
              
         // we are done. Return the path
         for( path_length=0, current_node_index = target_index; 
         current_node_index != source_index; path_length++ )
         {        
            // add the node to the path
            path_stack[path_length] = current_node_index;
            
            // move to previous node in the path
            current_node_index = previous[current_node_index];
            
         }
         path_stack[path_length] = source_index;

         *path_stack_top = path_length;          
         return TRUE;   
      }
      
      else if( track[smallest_node_index].type == NODE_EXIT )
      {
         // we dont get any fruit by travelling in this path
         continue;
      }
      
      else if( track[smallest_node_index].type == NODE_ENTER  )
      {
         // we will have only one path from here 
         
         edge_under_consideration = &track[smallest_node_index].edge[DIR_STRAIGHT];
         
         int next_node_index;
         next_node_index = edge_under_consideration->dest->index;
         
         distance_from_source = distance[smallest_node_index] + edge_under_consideration->dist;
         
         if( ( distance_from_source < distance[next_node_index]) && (visited[next_node_index] != NO) && 
             ( check_reservation_status( edge_under_consideration,  
               edge_under_consideration->dist ) == RESERVATION_AVAILABLE )
           )
         {         
            previous[ next_node_index ] = smallest_node_index;
            distance[ next_node_index ] = distance[smallest_node_index] + edge_under_consideration->dist;
         }         
      } 
      else if( track[smallest_node_index].type == NODE_MERGE || track[smallest_node_index].type == NODE_SENSOR) 
      {
         // we will have only one path from here  if we go straight
         
         edge_under_consideration = &track[smallest_node_index].edge[DIR_STRAIGHT];
         
         int next_node_index;
         next_node_index = edge_under_consideration->dest->index;
         distance_from_source = distance[smallest_node_index] + edge_under_consideration->dist;
         
         if( distance_from_source < distance[ next_node_index] && visited[next_node_index] == NO && 
             ( check_reservation_status( edge_under_consideration,  
               edge_under_consideration->dist ) == RESERVATION_AVAILABLE )
           )
         {         
            previous[ next_node_index ] = smallest_node_index;
            distance[ next_node_index ] = distance[smallest_node_index] + edge_under_consideration->dist;
         }
         
         // considering the reverse case         
         // Reverse has no distance, but has penalty  
         edge_under_consideration = edge_under_consideration->reverse;  
         next_node_index      = track[smallest_node_index].reverse ->index;
         distance_from_source = distance[smallest_node_index] + reverse_penalty;
         // change the reverse node only if we have not visited it previously
         if( distance_from_source < distance[ next_node_index] && 
             visited[next_node_index] == NO &&
             (check_reservation_status( edge_under_consideration,  
             edge_under_consideration->dist) == RESERVATION_AVAILABLE)
         )
         { 
            distance[next_node_index] = distance[smallest_node_index] + reverse_penalty;
            previous[next_node_index] = smallest_node_index; //previous[smallest_node_index];
         }
      }     
      
      else if( track[smallest_node_index].type == NODE_BRANCH )
      {
         // a turn out
         // we will have two paths from here
         
                  // straight path
         edge_under_consideration = &track[smallest_node_index].edge[DIR_STRAIGHT];
         
         track_node *next_track_node = edge_under_consideration->dest;
         int next_node_index  = next_track_node->index;
         
         distance_from_source = distance[smallest_node_index] + edge_under_consideration->dist;
         
         if( distance_from_source < distance[ next_node_index] && 
         (check_reservation_status( edge_under_consideration, edge_under_consideration->dist) == RESERVATION_AVAILABLE))
         {
            previous[ next_node_index ] = smallest_node_index;
            distance[ next_node_index ] = distance_from_source;
         }
         
                 // curved path
         edge_under_consideration = &track[smallest_node_index].edge[DIR_CURVED];        
                 
         next_track_node = edge_under_consideration->dest;
         next_node_index = next_track_node->index;
                  
         distance_from_source     = distance[smallest_node_index] + edge_under_consideration->dist;
         
         
         
         if( distance_from_source < distance[ next_node_index] && 
             (check_reservation_status( edge_under_consideration, edge_under_consideration->dist) == RESERVATION_AVAILABLE) )
         {         
            previous[ next_node_index ] = smallest_node_index;
            distance[ next_node_index ] = distance_from_source;
         }
      }
      else
      {
         zx_printf( COM2, "INVALID NODE TYPE" );
      }   
   }
   return FALSE;
}

int find_shortest_distance_node( int distance[], char visited[])
{
   int smallest_distance = ZX_INFINITY;
   int smallest_index = -1;
   int i=0;
   for ( i=0 ; i< TRACK_MAX; i++ )
   {
      if( (visited[i] == NO) && (distance[i] < smallest_distance) )
      {
         smallest_index = i;
         smallest_distance = distance[i];
      }
   }
   return smallest_index;
}
