/*
 * zx_ns_tree.h
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */

#ifndef ZX_NS_TREE
#define ZX_NS_TREE

struct bst_node;

typedef struct bst_node{
   int hash_value;
   int tid;   
   struct bst_node *left;
   struct bst_node *right;
}zx_bst_node;
   
int          zx_bst_add_by_name( zx_bst_node** root,char *name, int tid);
zx_bst_node* zx_insert_into_bst( zx_bst_node *root,int hash_value, int tid);
void         zx_free_bst( zx_bst_node *root );
int          zx_bst_get_by_name( char *name, zx_bst_node *root);
int          zx_get_hash_value( char *name );

int          zx_get_task_id_by_name( int hash_value, zx_bst_node *root );
zx_bst_node* zx_bst_balancing(zx_bst_node *node);
int          zx_bst_find_height(zx_bst_node* node);
int          zx_bst_get_diff(zx_bst_node* node);
zx_bst_node* left_right_rotation(zx_bst_node* parent);
zx_bst_node* left_left_rotation(zx_bst_node* parent);
zx_bst_node* right_left_rotation(zx_bst_node *parent);
zx_bst_node* right_right_rotation(zx_bst_node *parent);

void         debug_bst_traverse_postorder( zx_bst_node *root );

void         Free_bst( zx_bst_node **root );

#endif /* ZX_NS_TREE */

