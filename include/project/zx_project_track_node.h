/*
 * zx_track_node.h
 *
 * Header file for node data structures
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

#ifndef ZX_KERNEL_TRACK_NODE
   #define ZX_KERNEL_TRACK_NODE

   typedef enum {
     NODE_NONE,
     NODE_SENSOR,
     NODE_BRANCH,
     NODE_MERGE,
     NODE_ENTER,
     NODE_EXIT,
   } node_type;

   #define DIR_AHEAD 0
   #define DIR_STRAIGHT 0
   #define DIR_CURVED 1

   struct track_node;
   typedef struct track_node track_node;
   typedef struct track_edge track_edge;

    struct track_edge {
     track_edge *reverse;
     track_node *src, *dest;
     int dist;             /* length in millimetres */
     int reservation_status;
     int reservation_offset;

     int reservation_train_id;
   };

   struct track_node {
     int index; // this is a very useful varaible since we store this as array
     char *name;
     node_type type;
     int num;              /* sensor or switch number */
     track_node *reverse;  /* same location, but opposite direction */
     track_edge edge[2];
   };

#endif
