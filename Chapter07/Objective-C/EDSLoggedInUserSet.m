//
//  EDSLoggedInUserSet.m
//  EverydayDataStructures
//
//  Created by William Smith on 9/11/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSLoggedInUserSet.h"
#import "EDSUser.h"

@interface EDSLoggedInUserSet()
{
    NSMutableSet *_users;
}

@end

@implementation EDSLoggedInUserSet

-(instancetype)init
{
    if (self = [super init])
    {
        _users = [NSMutableSet set];
    }
    
    return self;
}

-(void)userAuthenticated:(EDSUser *)user
{
    if ([_users count] < 30)
    {
        [_users addObject:user];
    }
}

-(void)userLoggedOut:(EDSUser *)user
{
    [_users removeObject:user];
}

@end
