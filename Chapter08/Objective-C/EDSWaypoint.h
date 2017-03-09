//
//  EDSWaypoint.h
//  EverydayDataStructures
//
//  Created by William Smith on 8/24/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSWaypoint : NSObject

//Is the waypoint currently active
//
@property (nonatomic, readonly) BOOL active;


//Default initializer
//Wypoints are initialized in the active state.
//
-(instancetype)initWithLatitude:(NSInteger)latitude
                   andLongitude:(NSInteger)longitude;

-(void)reactivateWaypoint;
-(void)deactivateWaypoint;

@end
