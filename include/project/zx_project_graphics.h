/*
 * graphics.h - declaration of library fucntions for screen painting
 */
 
 #ifndef ZX_A0_GRAPHICS_H
 
 #define ZX_A0_GRAPHICS_H
 
   #define DISPLAY_ROW_START    0
   #define DISPLAY_ROW_END      22 + 10
   #define DISPLAY_COLUMN_START 0
   #define DISPLAY_COLUMN_END   70

   #define TERMINAL_LENGTH      3
   #define TERMINAL_POS_X       DISPLAY_ROW_END+1+3
   #define TERMINAL_POS_Y       0
   #define TERMINAL_PROMPT_LEN  11 
 
   int  zx_set_cursor( int row, int column, char *output, int* output_size_addr  );
   int  zx_clear_screen(char *output, int* output_size_addr );
   int  zx_draw_h_line( int row ,int start , int end, char pattern, char *output, int* output_size_addr  );
   int  zx_erase_line(char *output, int* output_size_addr );
   int  zx_erase_from_current_to_scrend(char *output, int* output_size_addr );
   void zx_initialize_prompt( char *prompt);
   
   void zx_put_number( int num, char *output, int* output_size_addr );
   int zx_put_string(char *str, char *output,  int* output_size_addr );
   
 #endif /*ZX_A0_GRAPHICS_H */

