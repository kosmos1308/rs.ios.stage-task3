#import "LevelOrderTraversal.h"

@interface Node: NSObject
@property NSNumber *value;
@property Node *left;
@property Node *right;
 
- (Node *)initWithValue:(NSNumber *)value;

@end

@implementation Node
 
- (Node *)initWithValue:(NSNumber *)value {
 
    self = [super init];
    if (self != nil) {
        self.value = value;
    }
    return self;
}

@end

Node *restoreTree(NSMutableArray *tree) {
    if ([tree count] == 0 || tree[0] == [NSNull null]) {
        return nil;
    }
    
    Node *root = [[Node alloc] initWithValue: tree.firstObject];
    
    if ( tree.count == 1) {
        return root;
    }
    
    [tree removeObjectAtIndex:0];
    root.left = restoreTree (tree);
    
    if (tree.count == 1) {
        return root;
    }
    
    [tree removeObjectAtIndex:0];
    root.right = restoreTree(tree);
    
    return root;
}

NSMutableArray *buildLevelOrderedArray(Node *node)
{
   NSMutableArray *levelOrderArray = [[NSMutableArray alloc] init];
   if (node == nil) return levelOrderArray;
  
   NSMutableArray *queue = [[NSMutableArray alloc] init];
   [queue addObject: node];
   while (queue.count != 0) {
     NSMutableArray *eachLevelArray = [[NSMutableArray alloc] init];
     NSUInteger size = queue.count;
     for (int i = 0; i < size; i++) {
        Node *node = [queue firstObject];
        [queue removeObjectAtIndex: 0];
        [eachLevelArray addObject: node.value];
        if (node.left)  {
          [queue addObject: node.left];
        }
        if (node.right) {
          [queue addObject: node.right];
        }
     }
     [levelOrderArray addObject: eachLevelArray];
   }
  return levelOrderArray;
}


NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    Node *restoredTree = restoreTree([[NSMutableArray alloc] initWithArray:tree]);
    
    if (restoredTree) {
        return buildLevelOrderedArray(restoredTree);
    } else {
        return @[];
    }
}
