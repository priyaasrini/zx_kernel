/*
 * zx_track_test_functions.c
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 #include <zx_project_track_functions.h>
 #include <zx_project_track_node.h>
 #include <zx_project_track_sensing.h>
 #include <zx_project_track_data.h>
 #include <zx_project.h>
 #include <zx_project_train_functions.h>
 #include <zx_project_path_reservation.h>
 #include <zx_project_shortest_path.h>
 #include <zx_uart_io.h>
 #include <zx_system_calls.h>

/*   
#define TEST_SRC SENSOR_A8 
#define TEST_DEST SENSOR_C7 
#define TEST_SPEED 14 
#define TEST_DEST_OFFSET 0
*/
#define TEST_SRC SENSOR_E8 
#define TEST_DEST SENSOR_B16
#define TEST_SPEED 14 
#define TEST_DEST_OFFSET 0

void reservation_testing()
{
   zx_printf(COM2, "Hello\n");
   
   
// definition of the track
   track_node track [TRACK_MAX];
   
   // states of turnouts
   int turnout_states [TURNOUT_BUF_SIZE]; 

   // initialize the track   
   track_init(CURRENT_TRACK, &track[0]); 
   turnout_init(turnout_states);
   
   // initialize the train
   zx_train train [TRAIN_COUNT];   
   train_init(&train[0], 49);
   train[0].ui_column = 0;
   train[0].ui_row = 6;

   train_adjust_position_by_sensor_toggle(&train[0], &track[TEST_SRC], 0, turnout_states);
   
   //
   //
   //
   
   train[0].head_pos.dist += 500 * DISTANCE_UNIT;
   train[0].tail_pos.dist += 500 * DISTANCE_UNIT - train[0].tail_pos.edge->dist * DISTANCE_UNIT;
   train[0].tail_pos.node = &track[TEST_SRC];
   train[0].tail_pos.edge = &track[TEST_SRC].edge[DIR_AHEAD]; 
   
   //
   
   
   /* Filling the parameters */
   int source_index_1 = train[0].head_pos.edge->dest->index;
   int source_index_2 = train[0].tail_pos.edge->src->reverse->index;
   
   int destination_index = TEST_DEST;
   
 //  track[SENSOR_A3].edge[DIR_AHEAD].reservation_status = EDGE_RESERVED;
 //  track[SENSOR_A3].edge[DIR_AHEAD].reservation_offset = track[SENSOR_A3].edge[DIR_AHEAD].dist;
 //  track[SENSOR_A3].edge[DIR_AHEAD].reservation_train_id = 50;   
   
   track_calc_shortest_path_from_two_dest(track, source_index_1, source_index_2, destination_index, train[0].route_nodes, train[0].route_edges, train[0].route_waypoints, train[0].route_turnouts);
   zx_printf(COM2, "End1\n");
   
   zx_printf(COM2, "%s\n", train[0].route_nodes[0]->name);
   zx_printf(COM2, "%s\n", train[0].route_nodes[1]->name);
   zx_printf(COM2, "%s\n", train[0].route_nodes[2]->name);
   zx_printf(COM2, "%s\n", train[0].route_nodes[3]->name);
   zx_printf(COM2, "%s\n", train[0].route_nodes[4]->name);
   
   /* test case 1 */
   
    train_next_waypoint(&train[0], 1);
   

//   track[SENSOR_A5].edge[DIR_AHEAD].reservation_status = EDGE_RESERVED;
//   track[SENSOR_A5].edge[DIR_AHEAD].reservation_offset = track[SENSOR_A5].edge[DIR_AHEAD].dist;
//   track[SENSOR_A5].edge[DIR_AHEAD].reservation_train_id = 50;
      
   /* //test case 1 */   
      
   int result = reserve_path(&train[0], TEST_SPEED);
   zx_printf(COM2, "End2\n");
   
   zx_printf(COM2, "Reservation result: %s \n", (result== RESERVATION_UNAVAILABLE)?"Reservation Unavailable":"Reservation Available");
   
   int i = 0;  

/*
   for( i = 0; i < TRACK_MAX; i++ )
   {
      if (track[i].type == NODE_EXIT)
         continue;

      if (track[i].edge[DIR_STRAIGHT].reservation_status == EDGE_UNRESERVED)
         continue;

      zx_printf(COM2, "%s -> %s: offset %d, train %d\n", track[i].edge[DIR_STRAIGHT].src->name, track[i].edge[DIR_STRAIGHT].dest->name, track[i].edge[DIR_AHEAD].reservation_offset, track[i].edge[DIR_STRAIGHT].reservation_train_id);

      if( track[i].type == NODE_BRANCH )
      {

         if (track[i].edge[DIR_CURVED].reservation_status == EDGE_UNRESERVED)
            continue;      
      
         zx_printf(COM2, "%s -> %s: offset %d, train %d\n", track[i].edge[DIR_CURVED].src->name, track[i].edge[DIR_CURVED].dest->name, track[i].edge[DIR_CURVED].reservation_offset, track[i].edge[DIR_CURVED].reservation_train_id);
      }
   }
*/   
   
   zx_printf(COM2, "===============\n");
   zx_printf(COM2, "===============\n");
   zx_printf(COM2, "===============\n");
   
   i=0;   
   
   while( train->reserved_edges[i] != 0 )
   {
      
      zx_printf(COM2, "\n%s -> %s: offset %d, edge.dist=%d train %d\n", 
      train->reserved_edges[i]->src->name, 
      train->reserved_edges[i]->dest->name, 
      train->reserved_edges[i]->reservation_offset, 
      train->reserved_edges[i]->dist,
      train->reserved_edges[i]->reservation_train_id);
         
         i++;
               
      if( i == RESERVED_EDGES_COUNT )
         break;

   }
   
   if( result == RESERVATION_UNAVAILABLE )
   {
   
   }
   
   zx_printf(COM2, "---End---\n");
   
   GetC(COM2);
   Shutdown();
   
   Exit();
     
}

