//
//  EDSArraySearchAlgorithms.m
//  EverydayDataStructures
//
//  Created by William Smith on 10/31/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSArraySearchAlgorithms.h"
#import "EDSCustomer.h"
#import "math.h"


@implementation EDSArraySearchAlgorithms

//Sequential / Linear
-(NSInteger)linearSearchArray:(NSMutableArray<NSNumber*>*)values
                        byKey:(NSInteger)key
{
    for (int i = 0; i < [values count] - 1; i++)
    {
        if ([values[i] intValue] == key)
        {
            return i;
        }
    }
    
    return -1;
}

-(EDSCustomer*)linearSearchCustomers:(NSMutableArray<NSNumber*>*)customers
                            byCustId:(NSInteger)custId
{
    for (EDSCustomer *c in customers) {
        
        if (c.customerId == custId)
        {
            return c;
        }
    }
    
    return nil;
}

//Binary Search
-(NSInteger)binarySearchArray:(NSMutableArray<NSNumber*>*)values
                withLeftIndex:(NSInteger)left
                   rightIndex:(NSInteger)right
                       andKey:(NSInteger)key
{
    if (right >= left)
    {
        NSInteger mid = left + (right - left) / 2;
        
        if ([values[mid] intValue] == key)
        {
            return mid;
        }
        else if ([values[mid] intValue] > key)
        {
            return [self binarySearchArray:values withLeftIndex:left rightIndex:mid - 1 andKey:key];
        }
        
        return [self binarySearchArray:values withLeftIndex:mid + 1 rightIndex:right andKey:key];
    }
    
    return -1;
}

//Jump Search
-(NSInteger)jumpSearchArray:(NSMutableArray<NSNumber*>*)values
                     forKey:(NSInteger)key
{
    NSInteger n = [values count];
    NSInteger step = sqrt(n);
    
    NSInteger prev = 0;
    while ([values[(int)fmin(step, n)-1] intValue] < key)
    {
        prev = step;
        step += floor(sqrt(n));
        if (prev >= n)
        {
            return -1;
        }
    }
    
    while ([values[prev] intValue] < key)
    {
        prev++;
        if (prev == fmin(step, n))
        {
            return -1;
        }
    }
    
    if ([values[prev] intValue] == key)
    {
        return prev;
    }
    
    return -1;
}

@end
