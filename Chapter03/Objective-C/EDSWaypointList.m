//
//  EDSWaypointList.m
//  EverydayDataStructures
//
//  Created by William Smith on 8/25/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSWaypointList.h"
#import "EDSWaypoint.h"

@interface EDSWaypointList()
{
    NSMutableArray<EDSWaypoint*> *_route;
    EDSWaypoint *_current;
}

@end

@implementation EDSWaypointList

-(instancetype)init
{
    if (self = [super init])
    {
        _route = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Public Methods
#pragma mark -
-(void)addWaypoints:(NSArray<EDSWaypoint*> *)waypoints
{
    [_route addObjectsFromArray:waypoints];
}

-(BOOL)removeWaypoint:(EDSWaypoint*)waypoint
{
    if ([_route containsObject:waypoint])
    {
        [_route removeObject:waypoint];
        return YES;
    }
    return NO;
}

-(void)insertWaypoints:(NSArray<EDSWaypoint*> *)waypoints beforeWaypoint:(EDSWaypoint*)before
{
    NSUInteger index = [_route indexOfObject:before];
    if (index == NSNotFound)
    {
        [self addWaypoints:waypoints];
    }
    else
    {
        NSRange range = NSMakeRange(index, [waypoints count]);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [_route insertObjects:waypoints atIndexes:indexSet];
    }
}

-(BOOL)startRoute
{
    if ([_route count] > 1)
    {
        _current = [self startingLine];
        return [self moveToNextWaypoint];
    }
    return NO;
}


-(BOOL)moveToNextWaypoint
{
    if (_current)
    {
        [_current deactivateWaypoint];
        if (_current != [self finishLine])
        {
            NSUInteger index = [_route indexOfObject:_current];
            _current = [_route objectAtIndex:index+1];
            return YES;
        }
        return NO;
    }
    return NO;
}

-(BOOL)moveToPreviousWaypoint
{
    if (_current &&
        _current != [self startingLine])
    {
        NSUInteger index = [_route indexOfObject:_current];
        _current = [_route objectAtIndex:index-1];
        [_current reactivateWaypoint];
        return YES;
    }
    return NO;
}

#pragma mark - Public properties
#pragma mark -
-(EDSWaypoint*)startingLine
{
    return [_route firstObject];
}

-(EDSWaypoint*)finishLine
{
    return [_route lastObject];
}

-(EDSWaypoint*)currentWaypoint
{
    return _current;
}

@end
