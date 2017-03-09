//
//  EDSLoggedInUserList.m
//  EverydayDataStructures
//
//  Created by William Smith on 8/20/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSLoggedInUserList.h"
#import "EDSUser.h"

@interface EDSLoggedInUserList()
{
    NSMutableArray *_users;
}

@end

@implementation EDSLoggedInUserList

-(instancetype)init
{
    if (self = [super init])
    {
        _users = [NSMutableArray array];
    }
    
    return self;
}

-(BOOL)canAddUser:(EDSUser *)user
{
    if ([_users containsObject:user] ||
        [_users count] >= 30)
    {
        return false;
    }
    else
    {
        return true;
    }
}

-(void)userAuthenticated:(EDSUser *)user
{
    if ([self canAddUser:user])
    {
        [_users addObject:user];
    }
}

-(void)userLoggedOut:(EDSUser *)user
{
    [_users removeObject:user];
}

@end
