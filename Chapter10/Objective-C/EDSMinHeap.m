//
//  EDSMinHeap.m
//  EverydayDataStructures
//
//  Created by William Smith on 10/6/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSMinHeap.h"
@interface EDSMinHeap()
{
    NSMutableArray<EDSHeapNode*> *_elements;
}

@end

@implementation EDSMinHeap

-(instancetype)initMinHeap{
    
    if (self = [super init])
    {
        _elements = [NSMutableArray array];
    }
    
    return self;
}

-(NSInteger)getCount
{
    return [_elements count];
}

-(void)insert:(EDSHeapNode*)item
{
    [_elements addObject:item];
    [self orderHeap];
}

-(void)delete:(EDSHeapNode*)item
{
    long i = [_elements indexOfObject:item];
    
    _elements[i] = [_elements lastObject];
    [_elements removeLastObject];
    [self orderHeap];
}

-(EDSHeapNode*)extractMin
{
    if ([_elements count] > 0)
    {
        EDSHeapNode *item = _elements[0];
        [self delete:item];
        return item;
    }
    
    return nil;
}

-(EDSHeapNode*)findMin
{
    if ([_elements count] > 0)
    {
        return _elements[0];
    }
    
    return nil;
}

-(void)orderHeap
{
    for (long i = [_elements count] - 1; i > 0; i--)
    {
        long parentPosition = (i - 1) / 2;
        
        if (_elements[parentPosition].data > _elements[i].data)
        {
            [self swapElement:parentPosition withElement:i];
        }
    }
}

-(void)swapElement:(long)firstIndex withElement:(long)secondIndex
{
    EDSHeapNode *tmp = _elements[firstIndex];
    _elements[firstIndex] = _elements[secondIndex];
    _elements[secondIndex] = tmp;
}

-(NSArray<EDSHeapNode*>*)childrenOfParentIndex:(NSInteger)parentIndex
{
    if (parentIndex >= 0)
    {
        NSMutableArray *children = [NSMutableArray array];
        long childIndexOne = (2 * parentIndex) + 1;
        long childIndexTwo = (2 * parentIndex) + 2;
        [children addObject:_elements[childIndexOne]];
        [children addObject:_elements[childIndexTwo]];
        
        return children;
    }
    
    return nil;
}

-(EDSHeapNode*)parentOfChildIndex:(NSInteger)childIndex
{
    if (childIndex > 0 && [_elements count] > childIndex)
    {
        long parentIndex = (childIndex - 1) / 2;
        return _elements[parentIndex];
    }
    
    return nil;
}
@end
