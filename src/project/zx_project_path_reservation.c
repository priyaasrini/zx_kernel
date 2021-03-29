/*
 * zx_project_path_reservation.c
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

int reserve_path( zx_train *train, int speed )
{
  

   /* ONLY ONE RULE : Whatever you reserve, reserve all the edges reaching that node */
    /* 
       we dont want to read the speed from the structure becuase
       the train might be immobile and we want to know the speed 
       at which we want to accelerate the train to
     */
    /* Roughly, 
       speed 2,3,4       - offset would be 10 cm
       speed 5,6,7       - offset would be 20 cm
       speed 8,9,10      - offset would be 30 cm
       speed 11,12,13,14 - offset would be 40 cm
     */    
     
     
   // train->target->dist - expected distance from head to destination
   // stopping distance 
 
	track_edge *edge;
      
   // I hope that this number will not go more than 10
   zx_edge_reservation edges_to_be_reserved[ RESERVED_EDGES_COUNT ];

   int reserve_edge_counter = 0;

   int needed_distance;
   
   
   if (train->target.node == 0)
	{
	   needed_distance = RESERVATION_TRAIN_LENGTH + MINIMAL_SAFETY_DISTANCE + train->stopping_distance[speed] / DISTANCE_UNIT;
	}
   
/*   
  
   int stopping_distance = train->stopping_distance[speed] / DISTANCE_UNIT;
  
   needed_distance = stopping_distance + TRAIN_LENGTH;

   int safety_distance = stopping_distance/3;

   if (safety_distance < MINIMAL_SAFETY_DISTANCE)
   {
      safety_distance = MINIMAL_SAFETY_DISTANCE;
   }

   needed_distance += safety_distance;


   if (train->target.node != 0)
	{
	     // If the distance to target is lesser than the distance needed to stop, reserve
	     //   only till the target distance ( crudely ) 
	      
  	     int target_distance = 
  	     ( train->target.distance_to_node + 
  	     train->target.offset_from_node) / DISTANCE_UNIT + 
  	     TRAIN_LENGTH + 
  	     MINIMAL_SAFETY_DISTANCE;
  	     
  	     if( target_distance < needed_distance )
  	         needed_distance = target_distance;
	}
*/	

   unreserve_previous_reservation( train );
	
	
   /* SECOND RESERVATION - Reserving space for back of the train */
   edge = train->tail_pos.edge;
   
   int distance_from_edge_src =  train->tail_pos.dist / DISTANCE_UNIT ;
   int distance_to_edge_dest  = (edge->dist) - ( train->tail_pos.dist / DISTANCE_UNIT );
   
   int status;
   
   /*                        Tail of Train <-----  */
   /*  o----------------------HXXXT-----o */
   /*                              edge_distance_remaining   */

   if ( needed_distance < distance_to_edge_dest ) 
   {
      /* Case 1a: (dest)---|----T----(src)  */      
      /* Train is at X moving forward  */
      	
      int profit = distance_to_edge_dest - needed_distance;
      int distance;
      
      /* Case 1aa: (dest)---------------|----T----(src)  */      
      /* Train is at X moving forward  */
      if( profit > distance_from_edge_src )
      {
         distance = distance_from_edge_src + needed_distance;
      }
      else
      /* Case 1ab: (dest)---|----T----------------(src)  */      
      /* Train is at X moving forward  */      
      {
         distance = -distance_to_edge_dest;
      }      	      
      status = reserve_edge( edge, distance, edges_to_be_reserved, &reserve_edge_counter );       
      needed_distance = 0;
   }
   else 
   {
   
      /* Case 1b: o---------|-------------(dest)-------T----(src)  */      
      /* Train is at X moving forward  */
         
      status = reserve_edge( edge, -distance_to_edge_dest, edges_to_be_reserved, &reserve_edge_counter );       
      needed_distance -= distance_to_edge_dest;
      
      edge = get_next_edge( edge, train->route_turnouts );
//      distance_from_edge_src =  0 ;
//      distance_to_edge_dest  =  edge->dist ;
   }

     
     
    if (status ==  RESERVATION_AVAILABLE) 
    {    
       while ( needed_distance > 0 )
       {
         /* OK!! We still have some distance remaining */

         /* case 2a : (dest)--------|------T(src) */
         /* Train is src and we want reservation */
         if( needed_distance < edge->dist )
         {
            // the edge cover more than the distance needed
            // so we reserve partially, upto the needed distance			  
            status = reserve_edge( edge, needed_distance, edges_to_be_reserved, &reserve_edge_counter );
            needed_distance = 0;         
         }
         
         /* case 2b : ----|-----(dest)---------------T(src) */
         /* Train is src and we want reservation */
         else 
         {
		      status = reserve_edge( edge, edge->dist, edges_to_be_reserved, &reserve_edge_counter );
            needed_distance -= edge->dist;  
	      }

               
         if( status == RESERVATION_UNAVAILABLE )
         {
            /* oops ! we cant reserve */
            break;
         }

		   if( needed_distance == 0 )
				   break;

         if( edge->dest->type == NODE_EXIT )
         {
            break;
         }
         
         edge = get_next_edge( edge, train->route_turnouts );
	    
       }		
    }
    
    commit_current_reservation( edges_to_be_reserved, reserve_edge_counter, train ); 
    return status;
    
}


/*  For every edge reserved, we may need to reserve one or two edges more. This function takes care of that logic */
 
/*  1. Input_edge - the edge has to be reserved
    2. offset     - the distance to be reserved
    
    3. edges_to_be_Reserved   - if the edge is available for reservation, then the edge is added to the structure 
    4. reserved_edges_counter - to keep track of number of edges available for reservation till now
    
    The last two parameters will be used commit reservations at the end
 */
      
int reserve_edge( track_edge *input_edge, int offset, zx_edge_reservation *edges_to_be_reserved, int *reserve_edges_counter)
{
   track_node *src_node;
   track_node *dest_node;
   
   src_node  = input_edge->src;
   dest_node = input_edge->dest;
       

   if (offset > input_edge->dist)
   {
      /* Ideally we should not be here. Just in case.. */
      return RESERVATION_UNAVAILABLE;
   }
   
   int partial = 0;
   if (offset < input_edge->dist)
   {
      partial = 1; 
   }


   /* ==========================================================================
         SRC NODE : !BRANCH   and  DESTINATION NODE : MERGE
    * ========================================================================== */     
    
    // we need to reserve 2 edges in this case
    // one in srtaight direction and one in reverse direction       
    if( src_node->type != NODE_BRANCH && dest_node->type == NODE_MERGE && !partial)
    {
      /* Node we are approaching a merge.
         Take care that another train does
         not come and collide us from the 
         other path
       
                 ->      ->
                 D12     MR7
                 <-      <-  ( in this case, we dont want anyone approach MR7 from BR5
           ------D11-----BR7-------- 
                         /
                        /
                       /
           ---------MR5---------C3-             
                    <-
                    BR5
                    ->
     
        eg., user input
          (src) D12 ----> MR7 (dest)
          
        reserve also:             
          (src) BR7 ----> MR5 (dest)
       */
       
      // reserve first edge 
       
      if( check_reservation_status( input_edge, offset ) == RESERVATION_UNAVAILABLE )
      {
         return RESERVATION_UNAVAILABLE;
      }
    
      // we get BR7 from MR7 and check edges that are reverse to: BR7 -> MR5 and MR7 -> D11
      
      track_node* branch_node = dest_node->reverse;
      track_edge* second_edge;
   
      if( input_edge == branch_node->edge[DIR_CURVED].reverse )
      {
         second_edge = &branch_node->edge[DIR_STRAIGHT];
      }
      else
      {
         second_edge = &branch_node->edge[DIR_CURVED];
      }
   
      if( check_reservation_status( second_edge, BRANCH_SAFETY_DISTANCE ) == RESERVATION_UNAVAILABLE )
      {
         return RESERVATION_UNAVAILABLE;
      }         

    } // if     
   
   /* ======================================================================
       SRC NODE : BRANCH and DESTINATION NODE : !MERGE
    * ====================================================================== */    
    // we need to reserve 2 edges in this case
    // one in srtaight direction and one in reverse direction         
    else if( src_node->type == NODE_BRANCH && dest_node->type != NODE_MERGE) // applies for partial  
    {
     /*          ->      ->
                 D12     MR7
                 <-      <-  ( in this case, we dont want anyone approach MR7 from BR5
           ------D11-----BR7-------- 
                         /
                        /
                       /
           ---------MR5---------C3-             
                    <-
                    BR5
                    ->
     
        eg., user input
          (src) BR7 ----> D11 (dest)
          
        reserve also:
          (src) BR7 ----> MR5 (dest)
       */
       
      if( check_reservation_status( input_edge, offset ) == RESERVATION_UNAVAILABLE )
      {
         return RESERVATION_UNAVAILABLE;
      }
    
      // we get BR7 from MR7 and check edges that are reverse to: BR7 -> MR5 and MR7 -> D11
      
      track_edge* second_edge;
      
      if( input_edge == &src_node->edge[DIR_CURVED] )
      {
         second_edge = &src_node->edge[DIR_STRAIGHT];
      }
      else
      {
         second_edge = &src_node->edge[DIR_CURVED];
      }
   
      if( check_reservation_status( second_edge, BRANCH_SAFETY_DISTANCE ) == RESERVATION_UNAVAILABLE )
      {
         return RESERVATION_UNAVAILABLE;
      }         
      
    } // else if
    
    /* ======================================================================
       SRC NODE : BRANCH and DESTINATION NODE : MERGE ( How z that? :) )
    * ====================================================================== */
    // in this case we need to reserve 3 edges
    else if( src_node->type == NODE_BRANCH && dest_node->type == NODE_MERGE && !partial)
    {
       /* eg., user input BR7 -> MR5
       
                         ->
                         MR7
                         <-
           ------D11-----BR7--------
                         /
                        /
                       /
           ---------MR5---------C3-             
                    <-
                    BR5
                    ->
                    
                    
          eg., user input
                    
          (src) BR7 ----> MR5 (dest)
          
          reserve:
          
          (src) BR7 ----> D11 (dest)             
          (src) C3 ----> MR5  (dest)
       */
       
      
      track_node *dest_merge = input_edge->dest;
      track_node *src_branch = input_edge->src;      
       
      if( check_reservation_status( input_edge, offset ) == RESERVATION_UNAVAILABLE )
      {
         return RESERVATION_UNAVAILABLE;
      }
              
      // we get BR7 from MR7 and check edges that are reverse to: BR7 -> MR5 and MR7 -> D11
      
      track_edge* second_edge;
      
      if( input_edge == &src_branch->edge[DIR_CURVED] )
      {
         second_edge = &src_branch->edge[DIR_STRAIGHT];
      }
      else
      {
         second_edge = &src_branch->edge[DIR_CURVED];
      }
   
      if( check_reservation_status( second_edge, BRANCH_SAFETY_DISTANCE ) == RESERVATION_UNAVAILABLE )
      {
         return RESERVATION_UNAVAILABLE;
      }         

      /* reserve the other path in the destination merge */
      /* destination node -> revese is a branch node */

      track_node *dest_branch = dest_merge->reverse;
      
      track_edge* third_edge;
      
      if( input_edge->reverse == &dest_branch->edge[DIR_CURVED] )
      {
         /* the path that we reserved previously joins this merge
            in curved way. So now reserve the path that joins straight
         */
         third_edge = &dest_branch->edge[DIR_STRAIGHT];
      }
      else
      {
         /* the path that we reserved previously joins this merge
            straight. So now reserve the path that joins curved
         */
         third_edge = &dest_branch->edge[DIR_CURVED];
      }

      if( check_reservation_status( third_edge, BRANCH_SAFETY_DISTANCE) == RESERVATION_UNAVAILABLE )
      {
         return RESERVATION_UNAVAILABLE;
      }              
         
    }
         
    // we need to reserve only 2 edges in all the other cases
    // one in srtaight direction and one in reverse direction
    /* ===============================================================
        all other cases (including) SRC NODE = !BRANCH   and    DESTINATION_NODE = !MERGE
    * =============================================================== */    
    else 
    {
       /* 
                               ->
                               MR7
                               <-
                 ------D11-----BR7--------
                              /
             \               /
              \             /
         -----MR18---------BR5------             
              ->           ->
              BR18         MR5
              <-           <-
               
          (src) MR18 ----> BR5  (dest)
          (src) MR5  ----> BR18 (dest) ( reverse of previous )
          
       */
       
       /* trivial case - between sensors
       
            E11 ----------- D9
            
            (src) E11 ----> D9  (dest)
            (src) D10 ----> E10 (src)
        */          
    
      if( check_reservation_status( input_edge, offset ) == RESERVATION_UNAVAILABLE )
      {
         return RESERVATION_UNAVAILABLE;
      }
   }
   
   int counter = *reserve_edges_counter;
   
   if( offset < 0 )
   {
      edges_to_be_reserved[counter].edge   = input_edge->reverse;
      edges_to_be_reserved[counter].offset = -offset;   
   }
   else
   {
      edges_to_be_reserved[counter].edge   = input_edge;
      edges_to_be_reserved[counter].offset = offset;
   }
       
   counter++;
   *reserve_edges_counter = counter;

   return RESERVATION_AVAILABLE;
}


void unreserve_previous_reservation(zx_train* train)
{
   int i = 0;
   
   while (train->reserved_edges[i] != 0)
   {  
      track_edge* edge = train->reserved_edges[i];

      edge->reservation_status = EDGE_UNRESERVED;      
      edge->reservation_offset = 0;
      edge->reservation_train_id = 0;
      
      train->reserved_edges[i] = 0;
      
      i++;
      if (i == RESERVED_EDGES_COUNT)
         break;
   }     

}


/* 
 
  This function checks if the edge is available for reservation.
  
  In case of negative offset, it checks the reverse part of the edge
  for availability
  
  For each edge, this node checks the availability in both the directions
    
 */


int check_reservation_status( track_edge *edge, int offset)
{
   int reservation_status_ahead = edge->reservation_status;
   int reservation_status_reverse = edge->reverse->reservation_status;

   int reservation_offset_ahead = edge->reservation_offset;
   int reservation_offset_reverse = edge->reverse->reservation_offset;

  /* ===============================================================
                           RESERVING EDGE COMPLETELY
   * =============================================================== */ 

     

   if (offset == 0)
   {
      return RESERVATION_AVAILABLE;  // sure, we can reserve it if it is 0, but this should never happen
   }
   
   else if (offset > 0)
   {  

      if (reservation_status_ahead != EDGE_UNRESERVED)
      { 
         return RESERVATION_UNAVAILABLE;
      }    
      
      int local_offset = offset;
   
      if (local_offset > edge->dist) // requesting more is equivalent to requesting the whole edge
         local_offset = edge->dist;
      
      
      if (edge->dist - reservation_offset_reverse < local_offset )
      {
         return RESERVATION_UNAVAILABLE;
      }
      
   }
   
   else if (offset < 0)
   {  
      if (reservation_status_reverse != EDGE_UNRESERVED)
      { 
         return RESERVATION_UNAVAILABLE;
      }    
      
      int local_offset = -offset;
   
      if (local_offset > edge->dist) // requesting more is equivalent to requesting the whole edge
         local_offset = edge->dist;      
      
      if (edge->dist - reservation_offset_ahead < local_offset )
      {
         return RESERVATION_UNAVAILABLE;
      }  
   }   
   
   return RESERVATION_AVAILABLE;
}

void commit_current_reservation( zx_edge_reservation edges_to_be_reserved[], int reserve_edge_counter, zx_train *train )
{
   int i = 0;
   
   track_edge *edge;
   int offset;
   
   for( i=0; i< RESERVED_EDGES_COUNT; i++ )
   {
      if (i < reserve_edge_counter)
      {   
         edge      = edges_to_be_reserved[i].edge;
         offset    = edges_to_be_reserved[i].offset;
         
         edge->reservation_status = EDGE_RESERVED;         
         edge->reservation_offset = offset;      
         edge->reservation_train_id = train->train_id; // updating the track edge train

         train->reserved_edges[i] = edge; // adding it to reserved edge
      }
      else
      {
         train->reserved_edges[i] = 0; // setting to 0
      }
   }

}

track_edge* get_next_edge( track_edge *edge, int turnout_states[] )
{
   track_node *node = edge->dest;
   
   if( node->type == NODE_BRANCH )
   {
      return &node->edge[turnout_states [node->num]];
   }
   else if ( node->type == NODE_EXIT )
   {
      return 0;
   }
   else
   {
      return &node->edge[DIR_AHEAD];
   } 
   return 0;  
}

