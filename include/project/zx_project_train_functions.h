/*
 * zx_train_functions.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #ifndef ZX_TRAIN_FUNCTIONS_H
 
   #define ZX_TRAIN_FUNCTIONS_H
 
   #include <zx_project_track_sensing.h>
   
    void train_init(zx_train* train, int train_id);
    void train_commit(zx_train* train);
    void train_set_speed(zx_train* train, int new_speed);
    void train_update_velocity_and_offset(zx_train* train);
//    void train_get_current_edge_from_last_node(zx_train* train, zx_turnout_state turnout_states[]);
    void train_update_expected_sensors(zx_train* train);
    
   void train_commit_reverse(zx_train* train);
   int train_get_run_speed_from_distance(zx_train* train, int distance); 
   void train_stop_task(void );

void train_adjust_position_by_sensor_toggle(zx_train* train, track_node* sensor_node, int time, int turnout_states[])
; 
 
 void train_update_vertices_by_distance_traveled(zx_train* train, int current_time, int turnout_states[]);
 
 void train_reverse(zx_train* train);
 int train_next_waypoint(zx_train* train, int reset);
 void train_update_edges(zx_train* train);
 
 int train_sensor_search_rec(track_node* start, track_node* sensor_node);

 void train_calibrate_velocity(zx_train* train, track_node* current_sensor_node, int current_time);

  #endif /* ZX_TRAIN_FUNCTIONS_H */
 
