//
//  EDSBooleanType.m
//  EverydayDataStructures
//
//  Created by William Smith on 8/11/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSBooleanType.h"

@implementation EDSBooleanType

+(void)boolDemo
{
    BOOL a = YES;
    BOOL b = NO;
    BOOL c = a;

    NSLog(@"a: %hhd", a);
    NSLog(@"b: %hhd", b);
    NSLog(@"c: %hhd", c);
    NSLog(@"a AND b: %d", a && b);
    NSLog(@"a OR b: %d", a || b);
    NSLog(@"NOT a: %d", !a);
    NSLog(@"NOT b: %d", !b);
    NSLog(@"a XOR b: %d", a ^ b);
    NSLog(@"(c OR b) AND a: %d", (c || b) && a);
}

@end
