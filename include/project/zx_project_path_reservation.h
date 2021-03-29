/*
 * zx_path_reservation.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

#ifndef TRACK_RESERVATION_H

   #define TRACK_RESERVATION_H
   
   #include "zx_project_track_sensing.h"
   
//   #define TRAIN_BACK_RESERVATION_LENGTH         300 // in mm
   #define TRAIN_FRONT_RESERVATION_OFFSET_COEFF  200 // in mm

   #define MINIMAL_SAFETY_DISTANCE 0 // in mm
   
   // safety on branches:
   #define BRANCH_SAFETY_DISTANCE 190 // in mm

   #define RESERVATION_TRAIN_LENGTH TRAIN_LENGTH // mm

   // step by step reduce the speed if you dont get reservation

   #define RESERVATION_MAP_COUNT ((TRACK_MAX/32)+1)


   #define EDGE_UNRESERVED 0
   #define EDGE_RESERVED 1
   
   #define RESERVATION_AVAILABLE 1
   #define RESERVATION_UNAVAILABLE 0
   
   /* Declarations */
   
int reserve_path( zx_train *train, int speed );
   int  reserve_edge( track_edge *input_edge, int offset, zx_edge_reservation *edges_to_be_reserved, int *reserve_edges_counter);
   void unreserve_previous_reservation(zx_train* train);
   int  check_reservation_status( track_edge *edge, int offset);
   void commit_current_reservation( zx_edge_reservation edges_to_be_reserved[], int reserve_edge_counter, zx_train *train );

   track_edge* get_next_edge( track_edge *edge, int turnout_states[] );

   
#endif
