/*
 * zx_a0_utilities.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #ifndef ZX_A0_UTILITIES
 
 #define ZX_A0_UTILITIES
 
   #define FOREVER for(;;)
 
   void num_to_string( unsigned int num, unsigned int base, char *bf );
   int process_command( char *buffer, int *arg1, int *arg2, int *arg3, int *arg4);
   
   int add_byte_to_buff( char c, char *buffer, int pos );
   int print_prompt( char *prompt, char output[], int *output_size );
   
   int strcmp( char *str1, char *str2 );
   
   void zx_a0_print_error_message( char *message );
   int node_name_to_id( char *node_name );
  
 #endif /* ZX_A0_UTILITIES */
