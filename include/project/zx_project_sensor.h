/*
 * zx_sensor.h
 *
 * File containing defintion of zx_kernel system 
 * call handler routines and their specific helpers
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #ifndef ZX_SENSOR_H
 #define ZX_SENSOR_H
 
 void zx_track_sensor_task();
 void zx_sensor_courier_task();
 void zx_sensor_secretary_task();
 
 #endif
