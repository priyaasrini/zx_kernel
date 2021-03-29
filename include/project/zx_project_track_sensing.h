/*
 * zx_track_sensing.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

#ifndef TRACK_SENSING_H

   #define TRACK_SENSING_H

   #define FOREVER for(;;)

   #include "zx_project_track_data.h"
   
   
   #define TRAIN_SLOW_SPEED 5
   
   typedef struct {
//      int node_id; 
      int time; // time at which the train hit the node
                // in case of expected sesnors, it expected to be expected time
      track_node* node;
      int dist; // distance of the train from any last node in case of last node info
                // in case of expected sensors/nodes, the distance to the sensors/nodes from the train's current position
     
   } zx_node_info;
   
   #define DISTANCE_UNIT 100
   
   
   typedef struct {
//      int node_id; 
      int time; // time at which the train hit the node
                // in case of expected sesnors, it expected to be expected time
      track_node* node;
      int dist; // distance of the train from any last node in case of last node info
                // in case of expected sensors/nodes, the distance to the sensors/nodes from the train's current position
      track_edge* edge;
    
   } zx_train_pos;

      
   typedef struct {
      track_node* node;
      int distance_to_node;
      int offset_from_node; 
      int visible;    
   
   } zx_train_target;

   
   // offset from pickup to the head
   #define TRAIN_HEAD_OFFSET 35
   
   // train length from head to tail
   #define TRAIN_LENGTH 215
   
   // offset from pickup to the tail
   #define TRAIN_TAIL_OFFSET (TRAIN_LENGTH - TRAIN_HEAD_OFFSET)
   
   
   
   #define NEXT_SENSOR_COUNT 15
   
   // just one recursion step down
   #define NEXT_SENSOR_LOOKUP_DEPTH 1

   // look for three sensor on a non-branched parts
   #define NEXT_SENSOR_LOOKUP_BREADTH 3

   typedef struct {
      track_node* node;
      int offset;
      int distance; // distance to the waypoint
   } zx_waypoint;

   #define WAYPOINT_COUNT 5
   #define TRAIN_EDGE_COUNT 3

   typedef struct {
      int state;
      
   } zx_train_route;

   #define TURNOUT_BUF_SIZE 157
 /*  reservation  */

   typedef struct {
      track_edge *edge;
      int        offset;
   }zx_edge_reservation;
   
   #define RESERVED_EDGES_COUNT 50
   
   typedef struct{
      int train_id; // donezx_train_stop_request

      zx_train_pos head_pos; // done --
      zx_train_pos tail_pos;
      
      int distance_travelled_in_delta;

      int velocity_state; // acclerating, deccelerating, immobile
       
      int initial_velocity; // v0
      int final_velocity;   // v1
      int current_velocity; // the current velocity we calculate at each step becomes initial velocity for next step
      
      int t1;
      int t0;
      int t;
      
      int speed; // to know if we are accelerating or deccelerating
      
      /*
         stopping time, t1 should be calculated dynamically with stopping distance and velocity. Here Stopping distance
         is constant but velocity is not.
         !! IMPORTANT : These distances assosciate to accelerated speeds. The velocity varies for the same speed during 
            acceleration and decceleration
      */
      int stopping_distance[15]; // static list of stoping distances for this train. One distance for each speed. Speed starts from 0,1,2... ) , 0 means stop
     
      /* we store the velocity associated with each speed. this will vary for some trains
         depending on it accelerated to deccelerated. 
         So  0 is for acceleration velocities
         and 1 is for decceleration velocities
       */
      int speed_to_velocity[2][15];   // Speed starts from 0,1,2... ) 0 means stop      
      
      int speed_to_dec_time[15]; // time needed to switch from any speed down to 5                                

      zx_node_info expected_sensors[NEXT_SENSOR_COUNT];      
      int direction; // 1 for ahead, -1 for reverse
      
      zx_train_target target;

      zx_waypoint route_waypoints[WAYPOINT_COUNT];
      int waypoint_index;
      
      track_node* route_nodes [TRACK_MAX];
      track_edge* route_edges [TRACK_MAX];
      
      track_edge* edges[TRAIN_EDGE_COUNT]; 
      
      int route_turnouts[TURNOUT_BUF_SIZE];
      
      int route_turnouts_toggled[TURNOUT_BUF_SIZE];
      
      int ui_route_updated;
      track_node* last_triggered_sensor_node; // used for updating train's position when it hits a sensor
      int last_triggered_sensor_error; // distance error for last triggered sensor (in DISTANCE_UNIT)
      
      int last_triggered_sensor_time;

      int last_triggered_sensor_velocity;

      int ui_row;
      int ui_column;
      
      int stop_command_issued_flag;
      int routine_state;

      int current_task; // TRAIN_TASK_IDLE or TRAIN_TASK_GOTO 
            
      track_edge* reserved_edges[RESERVED_EDGES_COUNT];
      
      int ui_reservation_available;
      
      int speed_before_slowdown;
      int stop_way;

   } zx_train;




   #define TRAIN_COUNT 2

   typedef struct {
      zx_train *train;
      int expected_time;
   }zx_train_stop_request;

   typedef struct {
      int value;
      int time;
   } zx_sensor_request;
   
   typedef struct {
      int type;
      int source1_id;
      int source2_id;
      int destination_id;   
      track_node* track_ptr;      
      zx_waypoint* route_waypoints_ptr;
      track_node** route_nodes_ptr; // pointer to the array of pointers
      track_edge** route_edges_ptr; // pointer to the array of pointers
      int* route_turnouts_ptr;       
   } zx_route_request;
   
   
   #define ROUTE_REQUEST_SHORTEST 1
   #define ROUTE_REQUEST_EXIT 3   


      
   typedef struct {
      int result;
   } zx_route_response;
   

   void zx_train_controller_task();
   
   //test functions
   void train_kernel_stress_testing();
     
   void zx_route_task();
 
   
   #define TRAIN_ROUTINE_INIT 0
   #define TRAIN_ROUTINE_RUN 1
   #define TRAIN_ROUTINE_SLOWDOWN 2
   #define TRAIN_ROUTINE_STOP_WAIT 3
   #define TRAIN_ROUTINE_RUN_FIRST 4
   
   #define SENSOR_BUF_SIZE 10 * sizeof(zx_sensor_request)
  
   #define TRAIN_STATE_IMMOBILE 0      
   #define TRAIN_STATE_ACCELERATING 1
   #define TRAIN_STATE_UNIFORM 2   
   #define TRAIN_STATE_DECCELERATING 3
      
   #define TRAIN_TASK_IDLE 0
   #define TRAIN_TASK_GOTO 1  
   
   #define TRAIN_STOP_WAY_NONE 0
   #define TRAIN_STOP_WAY_VOLUNTARY 1    
   #define TRAIN_STOP_WAY_FORCED 2    

#endif
