/*
 * zx_calibration.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /* 
  * ASSUME : you know the orientation of the train
  */
  
  #ifndef ZX_CALIBRATION_H
  
  #define ZX_CALIBRATION_H
  
  #include <zx_project_track_sensing.h>
  
//  void track_init(char track_id, track_node* track);
//  void turnout_commit(zx_turnout_state* turnout);
//  void turnout_init(zx_turnout_state turnout_states[], char cstate); // 's' or 'c';
//  void turnout_toggle(zx_turnout_state turnout_states[], int id, char cstate);
  
//  int track_calc_distance(track_node* start_node, track_node* end_node, zx_turnout_state turnout_states[]);
  int train_get_velocity_from_speed(zx_train* train, int speed);
  int train_get_stopping_delay(zx_train* train, int initial_speed);

  int train_calc_deccelerating_velocity(zx_train* train, int time);
  int train_calc_deccelerating_offset(zx_train* train, int time);

  int train_calc_accelerating_velocity(zx_train* train, int time);
  int train_calc_accelerating_offset(zx_train* train, int time);

  int train_calc_uniform_offset(zx_train* train, int time);

  void train_calc_next_node_time(zx_train* train);
  
  void train_find_velocity_and_distance_in_delta( zx_train* train );
  

   int train_calc_deccelerating_delay(zx_train* train, int new_speed);
   int train_calc_accelerating_delay(zx_train* train, int new_speed);

  
  #endif /* ZX_CALIBRATION */
