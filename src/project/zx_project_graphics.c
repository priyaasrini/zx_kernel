/*
 * graphics.c - library fucntions for screen painting
 */

#include <ts7200.h>
#include <zx_system_calls.h>

#include <zx_project_utilities.h>
#include <zx_project_graphics.h>

//Set Cursor at a position
int zx_set_cursor( int row, int column, char *output, int* output_size_addr )
{
   int output_size = *output_size_addr;


   char string[5];
   int i=0;

   output[output_size++] = 27;
   output[output_size++] = '[';

   num_to_string( row, 10, string );
   while( string[i] )
   {
      output[output_size++] = string[i++];
   }

   output[output_size++] = ';';
   
   i=0;
   num_to_string( column, 10, string );
   while( string[i] )
   {
      output[output_size++] = string[i++];
   }

   output[output_size++] = 'H';
   
   *output_size_addr = output_size;
   
   return 0;
}

// Clear Screen
int zx_clear_screen( char *output, int* output_size_addr )
{
   int output_size = *output_size_addr;

   output[output_size++] = 27;
   output[output_size++] = '[';
   output[output_size++] = '2';
   output[output_size++] = 'J';
   
   *output_size_addr = output_size;

   return 0;
}

int zx_draw_h_line( int row ,int start , int end, char pattern, char *output, int* output_size_addr )
{
   int output_size = *output_size_addr;

   int i=0;
   
   
   zx_set_cursor( row, start, output, &output_size );

   for( i=start; i<=end; i++ )
   {
      output[output_size++] = pattern;
   } 
   
   *output_size_addr = output_size;
   
   return 0; 
}

int zx_erase_line(char *output, int* output_size_addr)
{
   int output_size = *output_size_addr;

   output[output_size++] = 27;
   output[output_size++] = '[';
   output[output_size++] = 'K';
   
   *output_size_addr = output_size;
   
   return 0;
}

int zx_erase_from_current_to_scrend(char *output, int* output_size_addr)
{
   int output_size = *output_size_addr;
   
   output[output_size++] = 27;
   output[output_size++] = '[';
   output[output_size++] = 'J';

   *output_size_addr = output_size;

   return 0;
}

void zx_initialize_prompt( char *prompt)
{
	prompt[0] = 'c';
	prompt[1] = 'o';
   prompt[2] = 'n';
   prompt[3] = 't';
	prompt[4] = 'r';
	prompt[5] = 'o';
	prompt[6] = 'l';
   prompt[7] = 'l';
   prompt[8] = 'e';
   prompt[9] = 'r';
   prompt[10]= '#';
	prompt[11]= 0;
}



void zx_put_number( int num, char *output, int* output_size_addr )
{
   int output_size = *output_size_addr;

   if (num < 0) // for negative numbers
   {
      num = -num;
      output[output_size++] = '-';
   }

   int n = 0;
   int dgt;
   unsigned int d = 1;
	int base=10;

   while( (num / d) >= base ) d *= base;
   while( d != 0 ) {
       dgt = num / d;
       num %= d;
       d /= base;
       if( n || dgt > 0 || d == 0 ) {
   	 	output[output_size++] = dgt + ( dgt < 10 ? '0' : 'a' - 10 );
         ++n;
      }
   }
   
   *output_size_addr = output_size;
   
}

int zx_put_string(char *str, char *output, int* output_size_addr ) 
{
   int output_size = *output_size_addr;
	while( *str ) {
		output[output_size++] = *str;
		str++;
	}
	
	*output_size_addr = output_size;
	
	return 0;
}
