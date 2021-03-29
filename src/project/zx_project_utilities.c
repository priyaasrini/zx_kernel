/*
 * zx_a0_utilities.c
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #include <zx_project_utilities.h> 
 #include <zx_project.h>
 #include <zx_project_track_node.h>
 #include <zx_project_track_data.h>
 #include <zx_project_track_functions.h>
 #include <zx_uart_io.h>
 #include <zx_tasks.h>
 
 #include <zx_system_calls.h>

 int add_byte_to_buff( char c, char *buffer, int pos )
 {
   *(buffer+pos)=c;
   return 0;   
 }

 int print_prompt( char *prompt, char output[], int *output_size )
 {
   while (*prompt)
   {
      output[(*output_size)++] = *prompt++;
   }
   return *output_size;
 }  
  
 /* Converst a number into string and oput into the buffer passed */ 
 void num_to_string( unsigned int num, unsigned int base, char *bf ) {
     int n = 0;
     int dgt;
     unsigned int d = 1;

     while( (num / d) >= base ) d *= base;
     while( d != 0 ) {
             dgt = num / d;
             num %= d;
             d /= base;
             if( n || dgt > 0 || d == 0 ) {
                     *bf++ = dgt + ( dgt < 10 ? '0' : 'a' - 10 );
                     ++n;
             }
     }
     *bf = 0;
}

//converting character to intege
int atoi( char *string )
{
   int num=0;
   while( *string )
   {
      num = num*10 + ( *string++ -'0' );
   }
   return num;
}

//string comparison
int strcmp( char *str1, char *str2 )
{
   while( *str1 && *str2)
   {
      if( *str1++ != *str2++ ) 
         return 1;
         
      if ((*str1 && !(*str2)) || (!(*str1) && (*str2)))
         return 1;
      
   }
   return 0;
}

int node_name_to_id( char *node_name )
{
   // definition of the track
   track_node track [TRACK_MAX];
   
   // initialize the track   
   track_init(CURRENT_TRACK, &track[0]);  
   
   int i=0;
   
   for (i = 0; i < TRACK_MAX; i++)
   {
      if ( strcmp( node_name, track[i].name ) == 0) // TODO: check only sensors!
      {
         return i;
      }
   }
   
   return -1;   
}

int find_command_value( char *command )
{
   if(strcmp(command, "tr")  == 0 )  return TR_CMD;
   if(strcmp(command, "rv")  == 0 )  return RV_CMD;
   if(strcmp(command, "sw")  == 0 )  return SW_CMD;
   if(strcmp(command, "goto") == 0 ) return GO2_CMD;
   if(strcmp(command, "quit" ) == 0 )   return QUIT_CMD;
   if(strcmp(command, "st" ) == 0 )   return ST_CMD;
   if(strcmp(command, "rr")  == 0 )  return RR_CMD;
   
   return 0;
}


int process_command( char *buffer, int *arg1, int *arg2, int *arg3, int *arg4)
{
   //lets tokenize the buffer
   char arg[5][8]; // increase the size of this based on your number of arguments
   int  arg_count=0, pos=0, i=0;

   //read the buffer and tokenize
   while( *buffer )
   {
      if( *buffer == ' ' )
      {
         arg[arg_count][pos]=0;
         arg_count++;
         pos=0;
         buffer++;
      }
      else
      {
         arg[arg_count][pos++] = *buffer++;      
      }
   }
   arg[arg_count][pos]=0;
   arg_count++;

   for( i=0; i<arg_count; i++ )
   {
      if( i == 0 )
      {
         *arg1 = find_command_value(arg[0]);
      }
      
      else if( i == 1 )
      {
         *arg2 = atoi(arg[1]);
      }
       
      else if( i == 2 )
      {
         if( *arg1 == SW_CMD )
         {
            *arg3 = arg[2][0];
         }
         else if( *arg1 == GO2_CMD )
         {
            *arg3 = node_name_to_id( arg[2] );
            if( *arg3 == -1 ) 
            {
               return 0;
            }
         }
         else
         {
            *arg3 = atoi(arg[2]);
         }
      }
      else if( i == 3 )
      {
         *arg4 = atoi(arg[3]);
      }
      
      /* add code here to process any more arguments */
   }
   return 0;
}

/* Function to print an error message on the screen for the command task */

void zx_a0_print_error_message( char *message )
{

   char output[100];
   int  output_size = 0;
   
   output_size = 0;
         zx_set_cursor(  DISPLAY_ROW_END+1, TERMINAL_POS_Y, output, &output_size );
         zx_erase_line(output, &output_size);
           
         zx_set_cursor( DISPLAY_ROW_END+1, TERMINAL_POS_Y, output, &output_size);
        // zx_put_string( "Output>", output, &output_size);
         zx_put_string( message, output, &output_size);
         
   output[output_size++] = UART_PACKET_END_CHAR;
   PutMultiple( COM2, output );
}

