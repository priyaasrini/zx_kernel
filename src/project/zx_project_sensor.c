/*
 * zx_sensor.c
 *
 * File containing defintion of zx_kernel system 
 * call handler routines and their specific helpers
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #include "zx_tasks.h"
 #include "zx_uart_io.h"
 #include "zx_queue.h"
 #include "zx_system_calls.h"
 #include "zx_err.h"
 #include "zx_kernel_config.h"
  
 #include <zx_project_track_functions.h>
 #include <zx_project_track_node.h>
 #include <zx_project_track_sensing.h>
 #include <zx_project_track_data.h>
 #include <zx_project.h>
 #include <zx_project_train_functions.h>
 #include <zx_project_sensor.h>

 /* =============================================================
   This task could exit if we dont process sensor data properly.
   Check for a break statment inside forver loop, if you think
   you receive the data but nothing happens on the screen
   =============================================================*/
void zx_track_sensor_task()
{
   /* Varaiable Declaration */
    
   int k = 0;
   
   char sensor_data_old[SENSOR_BUFFER_LEN];
   char sensor_data_new;
   
   int  sensor_byte_index = -1;
   unsigned char change = 0;
   
   /* Initialize buffers */
   for( k = 0; k < SENSOR_BUFFER_LEN; k++ )
   {
      sensor_data_old[k] = 0;
   }

   /* ------------------------------------------------------- */
   /*        FOREVER LOOP STARTS                              */
   /* ------------------------------------------------------- */   
   /* We expect 10 bytes of data for sensors */
   int com1_received_byte_count = 10;
   int result = 0;
     
   int courier_tid = WhoIs("sensor_courier"); 

   if (courier_tid == INVALID_TASK_ID)
   {
      // error!!! I will not run!!!
      return;
   }
   
   int dump_count = 0;

   FOREVER
   {
   
      /* ----------------- SENSORS START --------------------------- */
      if(  com1_received_byte_count == 10 )
      {
//         Delay(10);
         result = PutC( COM1, SENSOR_DUMP );
         com1_received_byte_count = 0;
      } 
      
      result = GetC(COM1);
      
      if (dump_count < 100) 
         dump_count++;
               
      if( result == ERR_IMPOSSIBLE_TASKID || result == ERR_NONEXISTENT_TASK )
      {
         break;
      }      
      
      sensor_data_new = result;
      
      sensor_byte_index = (sensor_byte_index + 1 )%SENSOR_BUFFER_LEN;
      com1_received_byte_count++;
        

      change      = (~sensor_data_old[sensor_byte_index]) & sensor_data_new;

      zx_sensor_request req;
      zx_sensor_request rep;

      if( change && (dump_count > 10))
      {
         req.value = change | (sensor_byte_index << 8);
//         req.time = trigger_time;          
         Send(courier_tid, &req, sizeof(req), &rep, sizeof(rep)); 

         if (rep.value == -1) // exit
            break;
            
      } // if sensor changed 

      sensor_data_old[sensor_byte_index] = sensor_data_new;
      
      /* ----------------- SENSORS END--------------------------- */
      
      
   } // FOREVER   

   Exit();
}

/* Sensor server task */
void zx_sensor_courier_task()
{
   RegisterAs("sensor_courier");
      
   int sensor_task_tid = Create(FIRST_USER_TASK_PRIORITY - 4, &zx_track_sensor_task);
   
   zx_sensor_request res;
   zx_sensor_request rep; 
   
   rep.value = 0;  
   
   int tid;


   zx_circular_queue   sensor_request_queue;      
   zx_circular_queue*  sensor_request_queue_ptr = &sensor_request_queue; 
        
   zx_sensor_request  sensor_request_queue_array[SENSOR_BUF_SIZE];
         
   zx_queue_initialize( &sensor_request_queue_ptr, sensor_request_queue_array, sizeof(zx_sensor_request), SENSOR_BUF_SIZE);
         
   int result;

   zx_sensor_request temp;
   temp.value = 0;
   temp.time = 0;
   
// int* var = (int*)(DEBUG_VAR_1);
//   *var = 0;

   int exit = 0;
         
   FOREVER
   {

      Receive(&tid, &res, sizeof(res));
    
      if (tid == sensor_task_tid) // heard from the sensor task
      {      
         if (exit == 1)
         {
            rep.value = -1;
            Reply(tid, &rep, sizeof(rep));
            
            break;
         }
      
         Reply(tid, &rep, sizeof(rep));
                  
         res.time = Time();
      
         result = zx_queue_insert( &sensor_request_queue_ptr, (void*)(&res)); 
         
         if (result == ZX_ERR_QUEUE_FULL)
         {
//            int* var = (int*)(DEBUG_VAR_1);
//            *var = *var + 1;
         }
         
      }
      else // heard from client
      {
      
         zx_sensor_request current_request;
         
         if (res.value == -1) // exit
         {
            current_request.value = -1;
            current_request.time = -1;            
//            Reply(res.value, &current_request, sizeof(zx_sensor_request));            
            Reply(tid, &current_request, sizeof(zx_sensor_request));  
            exit = 1;          
         }

         result = zx_queue_remove( &sensor_request_queue_ptr, &current_request);
         if ( result == ZX_Q_SUCCESS )
         {
//            Reply(res.value, &current_request, sizeof(zx_sensor_request));         
            Reply(tid, &current_request, sizeof(zx_sensor_request)); 
         }
         else
         {
            current_request.value = -1;
            current_request.time = -1;            
//            Reply(res.value, &current_request, sizeof(zx_sensor_request));            
            Reply(tid, &current_request, sizeof(zx_sensor_request));            
         }

      }
   }
}



void zx_sensor_secretary_task()
{
   zx_sensor_request request; 
   zx_sensor_request reply; 
   
   int sensor_server_tid = Create(FIRST_USER_TASK_PRIORITY, &zx_sensor_courier_task);      

   int tid;

   while (1)
   {
      Receive(&tid, &request, sizeof(request));
      if (request.value == -1)
      {
         request.value = -1;
         Send(sensor_server_tid, &request, sizeof(request), &reply, sizeof(reply)); 
         Reply(tid, &reply, sizeof(reply));
         break;
      }      
         
      request.value = tid;
      Send(sensor_server_tid, &request, sizeof(request), &reply, sizeof(reply));     
      Reply(tid, &reply, sizeof(reply));
   }

   Exit();

}

         


