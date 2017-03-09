//
//  EDSStringType.m
//  EverydayDataStructures
//
//  Created by William Smith on 8/11/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSStringType.h"

@implementation EDSStringType

+(void) stringDemo
{
    //Objective-C
    NSString *one = @"One String";
    NSLog(@"One: %@", one);

    NSString *two = @"Two String";
    NSLog(@"Two: %@", two);

    NSString *red = @"Red String";
    NSLog(@"Red: %@", red);

    NSString *blue = @"Blue String";
    NSLog(@"Blue: %@", blue);

    NSString *purple = [[NSArray arrayWithObjects:red, blue, nil] componentsJoinedByString:@""];
    NSLog(@"Concatenation: %@", purple);

    purple = @"Purple String";
    NSLog(@"Whoops! Mutation: %@", purple);

}

@end
