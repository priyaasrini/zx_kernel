/*
 * zx_shortest_path.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

#include "zx_project_track_sensing.h"

#define ZX_INFINITY 0x0fffffff // sufficiently large
#define YES 'y'
#define NO  'n'


int track_calc_shortest_path_from_two_dest(track_node* track, int source_index_1, int source_index_2, int destination_index, track_node* route_nodes[], track_edge* route_edges[], zx_waypoint route_waypoints[], int route_turnouts[]);

int find_shortest_distance_node( int distance[], char visited[]);

//void zx_prepare_track( zx_turnout_state turnout_states[], int path_stack[], track_node track[], int path_stack_top);



void zx_get_edges_waypoints_turnouts(  zx_waypoint route_waypoints[], track_edge* edges[], int route_turnouts[],  int path_stack[], int path_distance[], track_node track[], int path_stack_top);

int zx_shortest_path( int source_index, int target_index, int path_stack[], int distance[], int *path_stack_top, track_node track[], int reverse_penalty);


// reverse offset (mm)
#define reverse_offset 200
   
// Reverse penalty in mm!!!!!!!!!!!!!!!!!!!!
#define REVERSE_PENALTY 400
