//
//  EDSWaypointList.h
//  EverydayDataStructures
//
//  Created by William Smith on 8/25/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EDSWaypoint;

@interface EDSWaypointList : NSObject

@property (nonatomic,readonly) EDSWaypoint *startingLine;
@property (nonatomic,readonly) EDSWaypoint *finishLine;
@property (nonatomic,readonly) EDSWaypoint *currentWaypoint;

-(void) addWaypoints:(NSArray*)waypoints;
-(BOOL) startRoute;
-(BOOL) removeWaypoint:(EDSWaypoint*)waypoint;
-(void) insertWaypoints:(NSArray*)waypoints beforeWaypoint:(EDSWaypoint*)before;
-(BOOL) moveToNextWaypoint;
-(BOOL) moveToPreviousWaypoint;

@end
