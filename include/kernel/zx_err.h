/*
 * zx_err.h
 *
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

/* Contains error codes */

#ifndef ZX_KERNEL_ERR_CODES
#define ZX_KERNEL_ERR_CODES

#define ERR_SUCCESS 0
#define ERR_IMPOSSIBLE_TASKID -1
#define ERR_NONEXISTENT_TASK  -2
#define ERR_SEND_RECEIVE_REPLY_TRANSACTION_INCOMPLETE -3
#define ERR_SENDER_NOT_REPLY_BLOCKED  -3
#define ERR_INSUFFICIENT_REPLY_BUFFER -4


#define ERR_CLOSURE_NONE 0
#define ERR_CLOSURE_TASK_IS_SEND_BLOCKED -1
#define ERR_CLOSURE_TASK_IS_RECEIVE_BLOCKED -2
#define ERR_CLOSURE_TASK_IS_REPLY_BLOCKED -3

#define ERR_CANNOT_CREATE_TASK (-1)

/* Reply Message */
#define MSG_SERVER_EXITED 12
   
#define TRANSMISSION_ERROR -4
#define RECEIVE_ERROR      -4

#endif /* #ifndef ZX_KERNEL_ERR_CODES */
