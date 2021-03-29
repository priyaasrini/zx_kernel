/*
 * zx_helper.h
 *
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
#ifndef ZX_HELPER
#define ZX_HELPER

 
    #include <zx_tasks.h>
    
    #define FOREVER for(;;)
    
    void   debug_print_list();

    
    zx_td* zx_get_active_td();
    zx_td* zx_get_td(int tid);
    int zx_get_active_task_id();
    void zx_set_active_task_id(int tid);    
        
    int zx_count_trailing_zeros(int x);
    int zx_count_trailing_zeros_64(unsigned long long x);    
    unsigned long long zx_set_bit_64(unsigned long long x, int index, int value);
    
    int zx_is_taskid_valid(int tid);
    int zx_does_task_exist(int tid);
        
    void debug_print_stack(int stack_register, int* source);
    void debug_print_receive_queue( int receiver_tid );
    
    int find_next_bit_set( unsigned char byte , int pos );
    
   // random numbers
   #define MAX_RANDOM ((1 << 15) - 1)    
 

    #define DEBUG_PRINT_STACK_SP 0
    #define DEBUG_PRINT_STACK_IP 1
    #define DEBUG_PRINT_STACK_CUSTOM 2
    
    #define TRUE 1
    #define FALSE 0
         
#endif 
