//
//  EDSWaypoint.m
//  EverydayDataStructures
//
//  Created by William Smith on 8/24/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSWaypoint.h"

@interface EDSWaypoint()
{
    NSInteger _lat;
    NSInteger _lon;
    BOOL _active;
}

@end

@implementation EDSWaypoint


-(instancetype)initWithLatitude:(NSInteger)latitude
                   andLongitude:(NSInteger)longitude
{
    if (self = [super init])
    {
        _lat = latitude;
        _lon = longitude;
        _active = YES;
    }
    
    return self;
}

//Header file declation for the active property:
//@property (nonatomic, readonly) BOOL active;
-(BOOL)active
{
    return _active;
}


-(void)reactivateWaypoint
{
    _active = YES;
}

-(void)deactivateWaypoint
{
    _active = NO;
}

@end
