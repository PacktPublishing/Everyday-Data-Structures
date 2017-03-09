//
//  EDSCustomerQueue.h
//  EverydayDataStructures
//
//  Created by William Smith on 8/31/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EDSCustomer;

NSMutableArray *_custQueue; 
int _cap; 
 
-(instancetype)initWithCapacity:(int)capacity 
{ 
    if (self = [super init]) 
    { 
        _custQueue = [NSMutableArray array]; 
        _cap = capacity; 
    } 
    return self; 
}

-(BOOL)canCheckinCustomer 
{ 
    return [_custQueue count] < _cap; 
} 

-(void)checkInCustomer:(EDSCustomer*)c 
{ 
    if ([self canCheckinCustomer]) 
    { 
        [_custQueue addObject:c]; 
    } 
} 

-(EDSCustomer*)customerConsultation 
{ 
	return [_custQueue firstObject]; 
} 

-(void)checkoutCustomer 
{ 
    [_custQueue removeObjectAtIndex:0]; 
} 

-(NSUInteger)positionOfCustomer:(EDSCustomer*)c 
{ 
    return [_custQueue indexOfObject:c]; 
} 

-(void)clearCustomers 
{ 
    [_custQueue removeAllObjects]; 
} 

-(void)cancelCustomer:(EDSCustomer*)c 
{ 
	NSUInteger index = [self positionOfCustomer:c]; 
	if (index != -1) 
	{ 
		[_custQueue removeObjectAtIndex:index]; 
	} 
} 
	
-(NSUInteger)customersInLine 
{ 
    return [_custQueue count]; 
} 
 
-(BOOL)isLineEmpty 
{ 
    return [_custQueue count] == 0; 
} 
 
-(BOOL)isLineFull 
{ 
    return [_custQueue count] == _cap; 
} 

@end
