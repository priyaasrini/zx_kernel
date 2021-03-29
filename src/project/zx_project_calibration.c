/*
 * zx_calibration.c
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /* 
  * ASSUME : All calibration related data
  */
  
//=============================
   /* Calculating Distances */
//=============================

#include <zx_project_track_node.h>
#include <zx_project_track_sensing.h>
#include <zx_project_track_data.h>
#include <zx_uart_io.h>

#include <zx_project_calibration.h>


/* IMPORTANT !!!!!!

All velocities are in mm / sec

Train 39's velocity coefficient: 46.75 (linear regression)
velocity = speed * 46.75. Speed 14 == Speed 13.

Stopping distance coefficient: 65.88;
*/

// dangerous function! may never terminate if wrong data!!!!
// it assumes that two nodes are reachable from each other within the configuration of turnouts!

/*
int track_calc_distance(track_node* start_node, track_node* end_node, zx_turnout_state turnout_states[])
{
   track_node* node = start_node;
   
   int result = -1;
   
   while( node != end_node )
   {
      if (node->type == NODE_BRANCH)
      {
         int turnout_id = node->num;
         if (turnout_states[turnout_id].state == DIR_STRAIGHT)
         {
            result += node->edge[DIR_STRAIGHT].dist;
            node = node->edge[DIR_STRAIGHT].dest;
         }
         else
         {
            result += node->edge[DIR_CURVED].dist;
            node = node->edge[DIR_CURVED].dest;         
         }
      }
      else 
      {
         result += node->edge[DIR_AHEAD].dist;
         node = node->edge[DIR_AHEAD].dest;         
      }
   }   
   
   return result * 100;
}
*/
int train_get_stopping_delay(zx_train* train, int speed) // returns time in ticks
{
/* t0 is the time at which the train starts to slow down ( or speed up )
   t1 is the time at which the slow down (or speed up) will be complete and the train moves with constant velocity
   Assuming t0 = 0, we ll find t1 here
 */    
   int result = 0;
   
   // if velocity is 0, then we are done
   if (train->speed_to_velocity[0][speed] == 0)
      return 1;

/* State machine of acceleration and decceleration - We assume this*/
// IMMOBILE --> ACCELERATING --> UNIFORM --> DECCELERATING--> Reached speed 0

/* TODO So for now, we assume that we reached a speed by accelerating to it
   We deccelerate, only when we want to goto speed 0. We might need to handle this later
   Thats why always index 0
 */ 
   result = (2 * train->stopping_distance[speed]) / train->speed_to_velocity[0][speed]; 
  
   return result;
}


//=============================
/* Calculating Time */
//=============================

int train_calc_deccelerating_delay(zx_train* train, int new_speed)
{
   if (new_speed == TRAIN_SLOW_SPEED)
      return train->speed_to_dec_time[train->speed];

   return train_get_stopping_delay(train, train->speed);
}

int train_calc_accelerating_delay(zx_train* train, int new_speed)
{
   if (train->speed == TRAIN_SLOW_SPEED)
      return train->speed_to_dec_time[new_speed];

   return train_get_stopping_delay(train, train->speed);
}

void train_find_velocity_and_distance_in_delta( zx_train* train )
{
   // Assuming we accelerated from 0 to this speed
   long v0 = train->initial_velocity;
   long v1 = train->final_velocity;
   
//   zx_printf( COM2, "v0 : %d. v1: %d\n", v0, v1);
   
   // Timing Related
   long t1_t0 = train->t1-train->t0; // the interval after which the velocity will be constant
   long t_t0  = train->t-train->t0;  // current time interval profile

//   zx_printf( COM2, "t1 - t0 : %d. t - t0: %d\n", t1_t0, t_t0);   
   
   long square_t1_t0       = t1_t0 * t1_t0;
   long cube_t1_t0         = square_t1_t0 * t1_t0;
   long fourth_power_t1_t0 = cube_t1_t0 * t1_t0;
   
   long square_t_t0        = t_t0 * t_t0;
   long cube_t_t0          = square_t_t0 * t_t0;
   long fourth_power_t_t0  = cube_t_t0 * t_t0;
   
   // how much the velocity has changed in this interval
   long v1_v0 = v1-v0;
     
   /* ============ UPDATING DISTANCE_TRAVELLED IN THIS DELTA ====================== */  
   long term1 = -( t1_t0 * v1_v0 * fourth_power_t_t0 ) / ( 2 *  fourth_power_t1_t0 );
   long term2 = +( t1_t0 * v1_v0 * cube_t_t0 ) / ( cube_t1_t0 );
   long term3 = +( t1_t0 * v0 * t_t0 ) / t1_t0;
   
   train->distance_travelled_in_delta = term1 + term2 + term3;

//zx_printf( COM2, "d delta: %d. \n", train->distance_travelled_in_delta);

   /* =============== UPDATING CURRENT_VELOCITY ================================== */
   term1 = -( 2 * v1_v0 * cube_t_t0 ) / cube_t1_t0;
   term2 = +( 3 * v1_v0 * square_t_t0 ) / square_t1_t0;
   term3 = v0;
   
   train->current_velocity = term1 + term2 + term3; 
}
