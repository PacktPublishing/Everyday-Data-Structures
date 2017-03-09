//
//  EDSGraphNode.m
//  EverydayDataStructures
//
//  Created by William Smith on 10/14/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSGraphNode.h"

@interface EDSGraphNode()
{
    NSInteger _value;
    NSMutableArray *_neighbors;
}

@end


@implementation EDSGraphNode

-(instancetype)initGraphNode
{
    if (self = [super init])
    {
        _neighbors = [NSMutableArray array];
    }
    
    return self;
}

-(instancetype)initGraphNodeWithValue:(NSInteger)value
{
    if (self = [super init])
    {
        _value = value;
        _neighbors = [NSMutableArray array];
    }
    
    return self;
}

-(NSMutableArray*)neighbors
{
    return _neighbors;
}

-(NSInteger)value
{
    return _value;
}

@end
