#include "stdio.h"

int main()
{
   int i=0, j=0;
   
   for( i='A'; i<='E'; i++ )
   {
      for( j=0; j<16; j++ )
      {
         printf( "#define SENSOR_%c%d %d\n", i,j+1, ((i-'A')*16)+j );  
      }
   } 
}
