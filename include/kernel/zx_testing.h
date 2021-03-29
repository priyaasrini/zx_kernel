/*
 * zx_testing.h
 *
 * The testing header file
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

#ifndef ZX_KERNEL_TESTING
#define ZX_KERNEL_TESTING

   #include <zx_project_test_functions.h>

   #define FIRST_USER_TASK zx_first_user_task_kernel_4_a0
//   #define PROJECT_FIRST_USER_TASK reservation_testing //zx_train_controller_task
   #define PROJECT_FIRST_USER_TASK zx_train_controller_task

   void test1();
   void test2();
   void test3();
   void test4();
   void test5();
   
   void heap_test();
   void nameserver_task();
   void test_ns();
   
   /* Kernel 3 - Test suite */
   void zx_first_user_task_kernel_3();
   void zx_clock_client();
   void zx_first_user_task_kernel_4();
   void zx_first_user_task_kernel_4_a0();
   
   
   void zx_a0_milestone_1_task_speed();
   void zx_a0_milestone_1_task_stopping_time();
   void zx_a0_milestone_1_task_stopping_distance();
   void zx_context_switch_test_task();
   
   void  zx_shortest_path_test();
   
   void acceleration_profile_testing();
   

#endif /* ZX_KERNEL_TESTING */

