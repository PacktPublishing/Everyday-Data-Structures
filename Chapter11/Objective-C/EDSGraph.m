//
//  EDSGraph.m
//  EverydayDataStructures
//
//  Created by William Smith on 10/14/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSGraph.h"
#import "EDSGraphNode.h"

@interface EDSGraph()
{
    NSMutableArray<EDSGraphNode*>* _nodes;
}

@end

@implementation EDSGraph

-(instancetype)initGraphWithNodes:(NSMutableArray<EDSGraphNode *> *)nodes
{
    if (self = [super init])
    {
        if (nodes)
        {
            _nodes = nodes;
        }
        else
        {
            _nodes = [NSMutableArray array];
        }
    }
    return self;
}

-(NSMutableArray<EDSGraphNode*>*)nodes
{
    return _nodes;
}

-(NSInteger)countOfNodes
{
    return [_nodes count];
}

-(void)addNode:(EDSGraphNode*)node
{
    [_nodes addObject:node];
}

-(void)addNodeForValue:(NSInteger)value
{
    EDSGraphNode *node = [[EDSGraphNode alloc] initGraphNodeWithValue:value];
    [_nodes addObject:node];
}

-(BOOL)removeNodeForValue:(NSInteger)value
{
    EDSGraphNode *nodeToRemove;
    for (EDSGraphNode *n in _nodes)
    {
        if (n.value == value)
        {
            nodeToRemove = n;
            break;
        }
    }
    
    if (!nodeToRemove)
    {
        return NO;
    }
    
    [_nodes removeObject:nodeToRemove];
    
    for (EDSGraphNode *n in _nodes)
    {
        long index = [n.neighbors indexOfObject:nodeToRemove];
        if (index != -1)
        {
            [n.neighbors removeObjectAtIndex:index];
        }
    }
    
    return YES;
    
}
-(void)addEdgeFromNode:(EDSGraphNode*)from toNode:(EDSGraphNode*)to
{
    [from.neighbors addObject:to];
}

-(void)addBidirectionalEdgeFromNode:(EDSGraphNode*)from toNode:(EDSGraphNode*)to
{
    [from.neighbors addObject:to];
    [to.neighbors addObject:from];
}

-(BOOL)adjacent:(EDSGraphNode*)from toNode:(EDSGraphNode*)to
{
    return [from.neighbors containsObject:to];
}

-(NSMutableArray<EDSGraphNode*>*)neighborsOfValue:(NSInteger)value
{
    for (EDSGraphNode *n in _nodes)
    {
        if (n.value == value)
        {
            return n.neighbors;
        }
    }
    
    return nil;
}

@end
