/*
 * zx_track_functions.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#ifndef ZX_TRACK_FUNCTIONS_H
  
  #define ZX_TRACK_FUNCTIONS_H
  
   #include <zx_project_track_sensing.h>
  
   void track_init(char track_id, track_node* track);
   void turnout_commit(int turnout_states[], int index);

   void init_tracka( track_node* );
   void init_trackb( track_node* );
   
   void zx_track_sensor_task();  
   void zx_sensor_server_task(); 
   
   void turnout_toggle(int turnout_states[], int id, int state);
   void turnout_init(int turnout_states[]);
    
    
#endif /* TRACK_FUNCTIONS_H */
