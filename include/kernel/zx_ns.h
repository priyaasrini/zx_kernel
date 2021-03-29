/*
 * zx_ns.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

#ifndef ZX_NS
#define ZX_NS

#define API_NS_UNSUPPORTED 0
#define API_NS_WHOIS 1
#define API_NS_REGISTER 2

#define API_NS_HANDSHAKE 3
#define API_NS_EXIT 4

#define API_NS_REGISTER_SUCCESS 0
#define API_NS_REGISTER_FAIL (-1)

#define API_NS_WHOIS_FAIL (-1)

void zx_name_server();

typedef struct {
   int type;
   
   int tid;
   char* name;
   
} zx_ns_request;

//int zx_who_is(char* name);
//int zx_register_as(int tid, char* name);
//int name_server_query_processor( int tid, char *name, int query_type );



#endif /* ZX_NS */

