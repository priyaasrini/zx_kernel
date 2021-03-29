/*
 * zx_track_functions.c
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

 #include "zx_tasks.h"
 #include "zx_uart_io.h"
 #include "zx_queue.h"
 #include "zx_system_calls.h"
 #include "zx_err.h"
 
 #include <zx_project_track_functions.h>
 #include <zx_project_track_node.h>
 #include <zx_project_track_sensing.h>
 #include <zx_project_track_data.h>
 #include <zx_project.h>
 #include <zx_project_train_functions.h>
 #include <zx_project_path_reservation.h>

 
void track_init(char track_id, track_node* track)
{
   if (track_id == 'A')
      init_tracka(track);

   else if (track_id == 'B')
      init_trackb(track);
      
  int i = 0;  
   for( i = 0; i < TRACK_MAX; i++ )
   {
      if( track[i].type == NODE_BRANCH )
      {
         track[i].edge[DIR_STRAIGHT].reservation_status = EDGE_UNRESERVED;
         track[i].edge[DIR_STRAIGHT].reservation_offset = 0;
         track[i].edge[DIR_STRAIGHT].reservation_train_id = 0;
         
         
         track[i].edge[DIR_CURVED].reservation_status = EDGE_UNRESERVED;
         track[i].edge[DIR_CURVED].reservation_offset = 0;
         track[i].edge[DIR_CURVED].reservation_train_id = 0;

      }
      else if( track[i].type != NODE_EXIT )
      {
         track[i].edge[DIR_AHEAD].reservation_status      = EDGE_UNRESERVED;
         track[i].edge[DIR_AHEAD].reservation_offset      = 0;
         track[i].edge[DIR_AHEAD].reservation_train_id    = 0;         
      }
   }
}

void turnout_commit(int turnout_states[], int index)
{
   char com1_output[50];
   int com1_output_size = 0;
   int switch_value;
   
//   if (turnout->id == 0)
//      return;

   if (turnout_states[index] == DIR_CURVED)
   {
      switch_value = 34;
   }
   else
   {
      switch_value = 33;      
   } 

   com1_output_size = 0;
      com1_output[com1_output_size++] = switch_value;
      com1_output[com1_output_size++] = index;
      com1_output[com1_output_size++] = 32; // solenoid off            
   com1_output[com1_output_size++] = UART_PACKET_END_CHAR;
   PutMultiple( COM1, com1_output );                 

}

void turnout_toggle(int turnout_states[], int id, int state)
{
   turnout_states[id] = state;
   turnout_commit(turnout_states, id);   
}

void turnout_init(int turnout_states[]) // DIR_AHEAD or DIR_CURVED
{
   int i;
   int state;
   
   for (i = 0; i < TURNOUT_BUF_SIZE; i++)
   {
      if ((i >= 1 && i <= 22) || (i >= 153))
      {
         if (i == 10 || i == 13 || i == 16 || i == 17)
         {
            state = DIR_STRAIGHT;
         }   
         else
            state = DIR_CURVED;

         turnout_states[i] = state;
         turnout_commit(turnout_states, i);   
         
      } 
      else
      {
         turnout_states[i] = DIR_STRAIGHT; // just ignore this turnout      
      }
   }      
} 





