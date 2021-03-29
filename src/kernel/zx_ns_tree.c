/*
 * zx_ns_tree.c
 *
 * Contains tree data structures for Name Server
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 #include <bwio.h>
 #include <zx_ns_tree.h>
 #include <zx_system_calls.h>
 #include <zx_memory.h>
 
#define NULL 0

int zx_get_hash_value( char *name ){
   int hash = 0;
   int char_pos=0;
   
   while( *name )
   {
      char_pos++;
      hash += ( (*name) * (char_pos) );
      name++;
   }
   
   int string_length = char_pos;
   
   int shifted = (string_length << 24);

 //  bwprintf ( COM2, "Shifted value: %x\n", shifted );  
   
   // store length in first eight bits
   hash |= shifted;

//   bwprintf ( COM2, "Hash Value is %x\n", hash );   
   return hash;
}

 
/* This function adds a new node to the binary search tree
 * It returns 1 if SUCCESSFUL
 * If memory allocation fails, it will return -1;
 *
 */
int zx_bst_add_by_name( zx_bst_node** root, char *name, int tid)
{
   int hash_value = zx_get_hash_value( name ); 
   
   zx_bst_node *node = zx_insert_into_bst(*root, hash_value, tid);
   
   if( node == NULL ){
      return -1;
   }
   *root = node;
   return 1;
}

zx_bst_node* zx_insert_into_bst( zx_bst_node *root,int hash_value, int tid)
{
    if (root==NULL) {
    
//         bwprintf( COM2, "Root is NULL \n" );
    
        root = (zx_bst_node*) Alloc(sizeof(zx_bst_node*));
        
        if( root == NULL ) 
        {
            // allocation failed
            return NULL;
        }
        
        root -> hash_value = hash_value;
        root -> tid        = tid;
        
        root -> left = NULL;
        root -> right = NULL;
//bwprintf( COM2, "insert_into_bst: Root Node : %x; Root Node ->left :%x; Root Node ->right :%x \n", (int) root, (int)(root->left), (int)(root->right) );        
        return root;
    }
    
    else if (hash_value < root->hash_value) {
   
    //    bwprintf( COM2, "Hash Value %x lesser than root \n", hash_value );
    
        root->left = zx_insert_into_bst(root->left, hash_value, tid);
        root=zx_bst_balancing(root);
    }
    
    else if (hash_value > root->hash_value) {
   // bwprintf( COM2, "Hash Value %x greater than root \n", hash_value );
    
        root->right = zx_insert_into_bst(root->right, hash_value, tid);
        root=zx_bst_balancing(root);
    }
    
  //  bwprintf( COM2, "zx_insert_into_bst: returning \n", hash_value );
    
    return root;
}


void Free_bst( zx_bst_node **root )
{
   if( *root == NULL ) return;
     
   if( (*root)->left  ) Free_bst( &((*root)->left) );
   if( (*root)->right ) Free_bst ( &((*root)->right) );
      
   Free( *root );
}

zx_bst_node* zx_bst_balancing(zx_bst_node *node)
{
    int b_f= zx_bst_get_diff(node);
    if (b_f >1) {
        if (zx_bst_get_diff(node->left) >0)
            node=left_left_rotation(node);
        else
            node=left_right_rotation(node);
    }
    else if(b_f < -1) {
        if(zx_bst_get_diff(node ->right) >0)
            node=right_left_rotation(node);
        else
            node=right_right_rotation(node);
    }
    return node;
}  

int zx_bst_find_height(zx_bst_node* node)
{
    int height=0;
    if (node !=NULL){
        int left_height= zx_bst_find_height(node ->left);
        int right_height= zx_bst_find_height(node -> right);
        int max=(left_height > right_height) ? left_height : right_height;
        height = 1+ max;
    }
    return height;
}

int zx_bst_get_by_name( char *name, zx_bst_node *root)
{
   int hash_value = zx_get_hash_value(name);   
   return zx_get_task_id_by_name( hash_value, root ); 
}

int zx_get_task_id_by_name( int hash_value, zx_bst_node *root )
{

   if( root == NULL ) return -1;


   if( root->hash_value == hash_value )
   {
      return root->tid;
   }
   else if ( hash_value < root->hash_value )
   {
      return zx_get_task_id_by_name( hash_value, root->left );
   }
   return zx_get_task_id_by_name( hash_value, root->right );
}

int zx_bst_get_diff(zx_bst_node* node)
{
    int left_height=zx_bst_find_height(node -> left);
    int right_height=zx_bst_find_height(node -> right);
    int b_factor= left_height - right_height;
    return b_factor;
}  

zx_bst_node* left_right_rotation(zx_bst_node* parent)
{
    zx_bst_node *node;
    node= parent -> left;
    parent-> left = right_right_rotation(node);
    return left_left_rotation(parent);
}
    
zx_bst_node* left_left_rotation(zx_bst_node* parent)
{
    zx_bst_node *node;
    node = parent -> left;
    parent -> left = node -> right;
    node -> right = parent;
    return node;
}

zx_bst_node* right_left_rotation(zx_bst_node *parent)
{
    zx_bst_node *node;
    node=parent -> right;
    parent->right = left_left_rotation(node);
    return right_right_rotation(parent);
}

zx_bst_node* right_right_rotation(zx_bst_node *parent)
{
    zx_bst_node *node;
    node=parent ->right;
    parent->right = node -> left;
    node -> left= parent;
    return node;
}

void debug_bst_traverse_postorder( zx_bst_node *root )
{
     if( root == NULL ) return;
                
     debug_bst_traverse_postorder( root->left );
     debug_bst_traverse_postorder( root->right );
     bwprintf( COM2, " hash = %d tid=%d\n", root->hash_value, root->tid );
}

 

  

