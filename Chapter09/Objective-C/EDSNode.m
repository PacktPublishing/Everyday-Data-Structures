//
//  EDSNode.m
//  EverydayDataStructures
//
//  Created by Will Smith on 9/24/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSNode.h"

@implementation EDSNode

-(instancetype)initNodeWithData:(NSInteger)data
{
    if (self = [super init])
    {
        _data = data;
    }
    return self;
}

-(NSInteger)data
{
    return _data;
}

-(EDSNode*)left
{
    return _left;
}

-(EDSNode*)right
{
    return _right;
}

-(NSArray*)children
{
    return [NSArray arrayWithObjects:_left, _right, nil];
}

-(BOOL)insertData:(NSInteger)data
{
    EDSNode *node = [[EDSNode alloc] initNodeWithData:data];
    return [self insertNode:node];
}

-(BOOL)insertNode:(EDSNode*)node
{
    if (!node || [self findNode:node])
    {
        return NO;
    }
    else if (node.data < _data)
    {
        if (!_left)
        {
            _left = node;
            return YES;
        }
        else
        {
            return [_left insertNode:node];
        }
    }
    else
    {
        if (!_right)
        {
            _right = node;
            return YES;
        } 
        else 
        {
            return [_right insertNode:node];
        }
    }
}

-(BOOL)graft:(EDSNode*)node
{
    if (!node)
    {
        return NO;
    }
    
    NSArray *nodes = [node listTree];
    for (EDSNode *n in nodes)
    {
        [self insertNode:n];
    }
    
    return true;
}

-(EDSNode*)removeData:(NSInteger)data
{
    EDSNode *node = [[EDSNode alloc] initNodeWithData:data];
    return [self removeNode:node];
}

-(EDSNode*)removeNode:(EDSNode*)node
{
    if (!node)
    {
        return NO;
    }
    
    EDSNode *retNode;
    EDSNode *modNode;
    NSMutableArray *treeList = [NSMutableArray array];
    
    if (self.data == node.data)
    {
        //Root match
        retNode = [[EDSNode alloc] initNodeWithData:self.data];
        modNode = self;
        if ([self.children count] == 0)
        {
            return self; //Root has no childen
        }
    }
    else if (_left.data == node.data)
    {
        //Match found
        retNode = [[EDSNode alloc] initNodeWithData:_left.data];
        modNode = _left;
    }
    else if (_right.data == node.data)
    {
        //Match found
        retNode = [[EDSNode alloc] initNodeWithData:_right.data];
        modNode = _right;
    }
    else
    {
        for (EDSNode *child in self.children)
        {
            if ([child removeNode:node])
            {
                return child;
            }
        }
        
        //No match in tree
        return nil;
    }
    
    //Reorder the tree
    if (modNode.left)
    {
        modNode.data = modNode.left.data;
        [treeList addObjectsFromArray:[modNode.left listTree]];
        modNode.left = nil;
    }
    else if (modNode.right)
    {
        modNode.data = modNode.right.data;
        [treeList addObjectsFromArray:[modNode.right listTree]];
        modNode.right = nil;
    } 
    else 
    {
        modNode = nil;
    }
    
    for (EDSNode *n in treeList)
    {
        [modNode insertNode:n];
    }
    
    //Finished
    return retNode;
}

-(EDSNode*)prune:(EDSNode*)root
{
    if (!root)
    {
        return nil;
    }
    
    EDSNode *matchNode;
    if (self.data == root.data)
    {
        //Root match
        EDSNode *b = [self copyTree];
        self.left = nil;
        self.right = nil;
        return b;
    }
    else if (self.left.data == root.data)
    {
        matchNode = self.left;
    }
    else if (self.right.data == root.data)
    {
        matchNode = self.right;
    }
    else
    {
        for (EDSNode *child in self.children)
        {
            if ([child prune:root])
            {
                return child;
            }
        }
        
        //No match in tree
        return nil;
    }
    
    EDSNode *branch = [matchNode copyTree];
    matchNode = nil;
    
    return branch;
}

-(EDSNode*)findData:(NSInteger)data
{
    EDSNode *node = [[EDSNode alloc] initNodeWithData:data];
    return [self findNode:node];
}

-(EDSNode*)findNode:(EDSNode*)node
{
    if (node.data == self.data)
    {
        return self;
    }
    
    for (EDSNode *child in self.children)
    {
        EDSNode *result = [child findNode:node];
        if (result)
        {
            return result;
        }
    }
    
    return nil;
}

-(EDSNode*)copyTree
{
    EDSNode *n = [[EDSNode alloc] initNodeWithData:self.data];
    if (self.left)
    {
        n.left = [self.left copyTree];
    }
    
    if(self.right)
    {
        n.right = [self.right copyTree];
    }
    return n;
}

-(NSArray*)listTree
{
    NSMutableArray *result = [NSMutableArray array];
    [result addObject:[[EDSNode alloc] initNodeWithData:self.data]];
    for (EDSNode *child in self.children) {
        [result addObjectsFromArray:[child listTree]];
    }
    return [result copy];
}

@end
