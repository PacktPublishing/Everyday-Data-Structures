//
//  EDSIntegerTypes.m
//  EverydayDataStructures
//
//  Created by William Smith on 8/4/16.
//  Copyright © 2016 William Smith. All rights reserved.
//

#import "EDSIntegerTypes.h"

@implementation EDSIntegerTypes

+(void)intDemo
{
    char number = -127;
    unsigned char uNumber = 255;
    NSLog(@"Signed char number: %hhd", number);
    NSLog(@"Unsigned char uNumber: %hhu", uNumber);
    
    int8_t fixedNumber8 = -127;
    uint8_t fixedUNumber8 = 255;
    NSLog(@"fixedNumber8: %hhd", fixedNumber8);
    NSLog(@"fixedUNumber8: %hhu", fixedUNumber8);
    
    NSNumber *charNumber = [NSNumber numberWithChar:number];
    NSLog(@"Char charNumber: %@", [charNumber stringValue]);
    
    short aShort = -32768;
    unsigned short anUnsignedShort = 65535;
    NSLog(@"Signed short aShort: %hd", aShort);
    NSLog(@"Unsigned short anUnsignedShort: %hu", anUnsignedShort);
    
    int16_t fixedNumber16 = -32768;
    uint16_t fixedUNumber16 = 65535;
    NSLog(@"fixedNumber16: %hd", fixedNumber16);
    NSLog(@"fixedUNumber16: %hu", fixedUNumber16);
    
    NSNumber *shortNumber = [NSNumber numberWithShort:aShort];
    NSLog(@"Short shortNumber: %@", [shortNumber stringValue]);
    
    int anInt = -2147483648;
    unsigned int anUnsignedInt = 4294967295;
    NSLog(@"Signed Int anInt: %d", anInt);
    NSLog(@"Unsigned Int anUnsignedInt: %u", anUnsignedInt);
    
    int32_t fixedNumber32 = -2147483648;
    uint32_t fixedUNumber32 = 4294967295;
    NSLog(@"fixedNumber32: %d", fixedNumber32);
    NSLog(@"fixedUNumber32: %u", fixedUNumber32);
    
    NSNumber *intNumber = [NSNumber numberWithInt:anInt];
    NSLog(@"Int intNumber: %@", [intNumber stringValue]);
    
    long long aLongLong = -9223372036854775808;
    unsigned long long anUnsignedLongLong = 18446744073709551615;
    NSLog(@"Signed long long aLongLong: %lld", aLongLong);
    NSLog(@"Unsigned long long anUnsignedLongLong: %llu", anUnsignedLongLong);
    
    int64_t fixedNumber64 = -9223372036854775808;
    uint64_t fixedUNumber64 = 18446744073709551615;
    NSLog(@"fixedNumber64: %lld", fixedNumber64);
    NSLog(@"fixedUNumber64: %llu", fixedUNumber64);
    
    NSNumber *longlongNumber = [NSNumber numberWithLongLong:aLongLong];
    NSLog(@"Long long longlongNumber: %@", [longlongNumber stringValue]);
}

@end
