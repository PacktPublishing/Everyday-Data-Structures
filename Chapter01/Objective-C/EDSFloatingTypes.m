//
//  EDSFloatingTypes.m
//  EverydayDataStructures
//
//  Created by William Smith on 8/9/16.
//  Copyright © 2016 William Smith. All rights reserved.
//

#import "EDSFloatingTypes.h"

@implementation EDSFloatingTypes

+(void)floatDemo
{
    float piFloat = 3.14159265358979323846264338327f;
    NSLog(@"piFloat: %f", piFloat);

    NSNumber *floatNumber = [NSNumber numberWithFloat:piFloat];
    NSLog(@"floatNumber: %@", [floatNumber stringValue]);

    double piDouble = 3.14159265358979323846264338327;
    NSLog(@"piDouble: %.15f", piDouble);

    NSNumber *doubleNumber = [NSNumber numberWithDouble:piDouble];
    NSLog(@"doubleNumber: %@", [doubleNumber stringValue]);

    NSDecimalNumber *piDecimalNumber = [[NSDecimalNumber alloc] initWithDouble:3.14159265358979323846264338327];
    NSLog(@"piDecimalNumber: %@", [piDecimalNumber stringValue]);
}

@end
