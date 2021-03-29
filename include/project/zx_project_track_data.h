/*
 * zx_track_data.h
 *
 * Header file for loading track data
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

/* THIS FILE IS GENERATED CODE -- DO NOT EDIT */

#ifndef ZX_KERNEL_TRACK_DATA
#define ZX_KERNEL_TRACK_DATA

#include "zx_project_track_node.h"

// The track initialization functions expect an array of this size.
#define TRACK_MAX 144

#define TRACK_A 'A'
#define TRACK_B 'B'

#ifdef USE_TRACK_A
   #define CURRENT_TRACK TRACK_A
//   #pragma "CURRENT_TRACK=TRACK_A"
#else 
   #define CURRENT_TRACK TRACK_B
//   #pragma "CURRENT_TRACK=TRACK_B"
#endif

// debug

/* definition to expand macro then apply to pragma message */
#define VALUE_TO_STRING(x) #x
#define VALUE(x) VALUE_TO_STRING(x)
#define VAR_NAME_VALUE(var) #var "="  VALUE(var)

// SENSOR defines

#define SENSOR_A1 0
#define SENSOR_A2 1
#define SENSOR_A3 2
#define SENSOR_A4 3
#define SENSOR_A5 4
#define SENSOR_A6 5
#define SENSOR_A7 6
#define SENSOR_A8 7
#define SENSOR_A9 8
#define SENSOR_A10 9
#define SENSOR_A11 10
#define SENSOR_A12 11
#define SENSOR_A13 12
#define SENSOR_A14 13
#define SENSOR_A15 14
#define SENSOR_A16 15
#define SENSOR_B1 16
#define SENSOR_B2 17
#define SENSOR_B3 18
#define SENSOR_B4 19
#define SENSOR_B5 20
#define SENSOR_B6 21
#define SENSOR_B7 22
#define SENSOR_B8 23
#define SENSOR_B9 24
#define SENSOR_B10 25
#define SENSOR_B11 26
#define SENSOR_B12 27
#define SENSOR_B13 28
#define SENSOR_B14 29
#define SENSOR_B15 30
#define SENSOR_B16 31
#define SENSOR_C1 32
#define SENSOR_C2 33
#define SENSOR_C3 34
#define SENSOR_C4 35
#define SENSOR_C5 36
#define SENSOR_C6 37
#define SENSOR_C7 38
#define SENSOR_C8 39
#define SENSOR_C9 40
#define SENSOR_C10 41
#define SENSOR_C11 42
#define SENSOR_C12 43
#define SENSOR_C13 44
#define SENSOR_C14 45
#define SENSOR_C15 46
#define SENSOR_C16 47
#define SENSOR_D1 48
#define SENSOR_D2 49
#define SENSOR_D3 50
#define SENSOR_D4 51
#define SENSOR_D5 52
#define SENSOR_D6 53
#define SENSOR_D7 54
#define SENSOR_D8 55
#define SENSOR_D9 56
#define SENSOR_D10 57
#define SENSOR_D11 58
#define SENSOR_D12 59
#define SENSOR_D13 60
#define SENSOR_D14 61
#define SENSOR_D15 62
#define SENSOR_D16 63
#define SENSOR_E1 64
#define SENSOR_E2 65
#define SENSOR_E3 66
#define SENSOR_E4 67
#define SENSOR_E5 68
#define SENSOR_E6 69
#define SENSOR_E7 70
#define SENSOR_E8 71
#define SENSOR_E9 72
#define SENSOR_E10 73
#define SENSOR_E11 74
#define SENSOR_E12 75
#define SENSOR_E13 76
#define SENSOR_E14 77
#define SENSOR_E15 78
#define SENSOR_E16 79


void init_tracka(track_node *track);
void init_trackb(track_node *track);

#endif
