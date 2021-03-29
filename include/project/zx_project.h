/*
 * zx_a0.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #ifndef ZX_A0
 
 #define ZX_A0
 
   #include <zx_project_graphics.h>

  /* COMMANDS FROM USER */
   #define NONE_CMD 0 
   #define TR_CMD   1 
   #define RV_CMD   2
   #define SW_CMD   3
   #define WH_CMD   4
   #define ST_CMD   5
   #define GO2_CMD  7 // go to a certain destination
   #define QUIT_CMD 6
   #define RR_CMD   10 // just physical reverse
   
   /* COMMMAND OPTIONS */
   #define OFFSET_OPT 1
   
   //used for commands and sensor data
   #define RECEIVE_BUF_LEN 30

   /* TRAIN CONTROLLER COMMANDS */
   #define SW_STRAIGHT  33
   #define SW_CURVED    34
   #define SOLENOID_OFF 32
   #define SENSOR_DUMP  128+5
   #define SENSOR_DATA  192

   #define REVERSE_SPEED 5
   #define STOP_TRAIN    0
   #define REVERSE_TRAIN 15

   #define TRAIN_LED 16

   /* SWITCHES RELATED */   
   #define SWITCH_COUNT          22
   #define SWITCH_TABLE_POS_X    TIMER_POS_X+3
   #define SWITCH_TABLE_POS_Y    3
   #define SWITCH_TABLES_SPACE   3
   
   #define INITIAL_SWITCH_POSITION SW_CURVED
   #define INITIAL_SWITCH_POSITION_ALPHABET ((INITIAL_SWITCH_POSITION == SW_STRAIGHT) ? 'S' : 'C' )

   /* SENSOR RELATED */
   #define SENSOR_BUFFER_LEN     10
  
   #define DECODERS_COUNT        5
   #define SENSORS_PER_DECODER   16

   #define SENSOR_TABLE_DATA_X   TIMER_POS_X+3+2
   #define SENSOR_TABLE_DATA_Y   29
   
   /* TIMER RELATED */
   #define TIMER_POS_X          (DISPLAY_ROW_START+2)
   #define TIMER_POS_Y          (DISPLAY_COLUMN_END/2)

 
    void zx_a0_first_task();
    void zx_a0_init_screen();
  
    void zx_a0_timer_task();
    void zx_a0_sensor_task();
    void zx_a0_command_task();
    void zx_a0_turn_off_solenoid();
    
    /* Track switches realted functions */
    int  zx_a0_update_switch_entry( int switch_number, char switch_state);
    int  zx_a0_print_switch_table_header( int x, int y, char* output, int* output_size_addr );
    void zx_a0_initialize_switches( char switch_state[]);
    
    /* Sensor Table Related functions */
    void zx_a0_print_sensor_table_header( int x, int y, char* output, int* output_size_addr  );  
    void find_sensor_name( char *name, int byte_index, int pos );
    int  print_prompt( char *prompt, char *output, int *output_size );
    
    int add_byte_to_buff( char c, char *buffer, int pos );
    void zx_a0_print_error_message( char *message );
 #endif /* ZX_A0 */
