//
//  EDSPointsDictionary.m
//  EverydayDataStructures
//
//  Created by William Smith on 9/7/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSPointsDictionary.h"

@interface EDSPointsDictionary()
{
    NSMutableDictionary<NSString*, NSNumber*> *_points;
}

@end

@implementation EDSPointsDictionary

-(instancetype)init
{
    if (self = [super init])
    {
        _points = [NSMutableDictionary dictionary];
    }
    
    return self;
}

-(NSInteger)updatePoints:(NSInteger)points
        forCustomer:(NSString*)customerName
{
    if ([self customerExists:customerName])
    {
        NSInteger exPoints = [[_points objectForKey:customerName] integerValue];
        exPoints += points;
        
        [_points setValue:[NSNumber numberWithInteger:exPoints] forKey:customerName];
        return [[_points objectForKey:customerName] integerValue];
    }
    return 0;
}

//Add
-(void)registerCustomer:(NSString*)customerName
{
    [self registerCustomer:customerName withPreviousBalance:0];
}

-(void)registerCustomer:(NSString*)customerName
    withPreviousBalance:(NSInteger)previousBalance
{
    NSNumber *points = [NSNumber numberWithInteger:previousBalance];
    [_points setObject:points forKey:customerName];
}

//Get
-(NSInteger)getCustomerPoints:(NSString*)customerName
{
    NSNumber *rawsPoints = [_points objectForKey:customerName];
    return rawsPoints ? [rawsPoints integerValue] : 0;
}

//Update
-(NSInteger)addPoints:(NSInteger)points
           toCustomer:(NSString*)customerName
{
    return [self updatePoints:points forCustomer:customerName];
}

-(NSInteger)removePoints:(NSInteger)points
            fromCustomer:(NSString*)customerName
{
    return [self updatePoints:-points forCustomer:customerName];
}

-(NSInteger)redeemPoints:(NSInteger)points
             forCustomer:(NSString*)customerName
{
    return [self updatePoints:-points forCustomer:customerName];
}

-(NSInteger)customerCheckout:(NSString*)customerName
{
    NSInteger points = [[_points objectForKey:customerName] integerValue];
    [_points removeObjectForKey:customerName];
    return points;
}

//Contains
-(bool)customerExists:(NSString*)customerName
{
    //Returns nil if no key, which reads as false.
    //Cannot add nil to a dictionary so this is type safe also
    return [_points objectForKey:customerName];
}

//Count
-(NSInteger)customersOnPremises
{
    return [_points count];
}

//Clear
-(void)closingTime
{
    [_points removeAllObjects];
}

@end
