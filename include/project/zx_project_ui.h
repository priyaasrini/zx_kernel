/*
 * zx_ui.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /* This file contains functions to manage the 
  * screen output while the trains are running
  */
 
#ifndef ZX_UI_H
#define ZX_UI_H
   
  #include <zx_project_track_sensing.h>

  typedef struct{
   int arg1;
   int arg2;
   int arg3;
   int arg4;
  } zx_command_task_request;
  

  void zx_ui_input_task();
  void zx_ui_server_task();
  
  void ui_print_initial_screen();
  void ui_print_data(int time, int idle_task_percent);

  void train_ui_print_initial_screen(zx_train* train);
  void train_ui_print_data(zx_train* train); 
  

   #define UI_DATA_COLUMN 30
   #define UI_TERMINAL_SIZE 3
   #define UI_TERMINAL_ROW 55
   #define UI_TERMINAL_COLUMN 1   
  
  
#endif /* ZX_UI */
