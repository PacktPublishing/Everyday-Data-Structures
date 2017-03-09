//
//  EDSLoggedInUserArray.m
//  EverydayDataStructures
//
//  Created by William Smith on 8/21/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSLoggedInUserArray.h"
#import "EDSUser.h"

@interface EDSLoggedInUserArray()
{
    NSArray *_users;
}

@end

@implementation EDSLoggedInUserArray

-(instancetype)init
{
    if (self = [super init])
    {
        _users = [NSArray array];
    }
    return self;
}

-(BOOL)canAddUser:(EDSUser *)user
{
    BOOL containsUser = [_users containsObject:user];
    
    if (containsUser)
    {
        return false;
    }
    else
    {
        if ([_users count] >= 30)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
}

-(void)userAuthenticated:(EDSUser *)user
{
    if ([self canAddUser:user])
    {
        _users = [_users arrayByAddingObject:user];
        NSLog(@"Length after adding user %lu: %lu", user.userId, [_users count]);
    }
}

-(void)userLoggedOut:(EDSUser *)user
{
    NSUInteger index = [_users indexOfObject:user];
    if (index == NSNotFound)
    {
        NSLog(@"User %lu not found.", user.userId);
    }
    else
    {
        NSArray *newUsers = [NSArray array];
        for (EDSUser *u in _users)
        {
            if (user != u)
            {
                newUsers = [newUsers arrayByAddingObject:u];
            }
        }
        
        _users = newUsers;
    }
    
    NSLog(@"Length after logging out user %lu: %lu", user.userId, [_users count]);
}

@end
