//
//  EDSArraySearchAlgorithms.h
//  EverydayDataStructures
//
//  Created by William Smith on 10/31/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EDSCustomer;

@interface EDSArraySearchAlgorithms : NSObject

-(NSInteger)linearSearchArray:(NSMutableArray<NSNumber*>*)values
                        byKey:(NSInteger)key;

-(EDSCustomer*)linearSearchCustomers:(NSMutableArray<NSNumber*>*)customers
                            byCustId:(NSInteger)custId;

-(NSInteger)binarySearchArray:(NSMutableArray<NSNumber*>*)values
                withLeftIndex:(NSInteger)left
                   rightIndex:(NSInteger)right
                       andKey:(NSInteger)key;

-(NSInteger)jumpSearchArray:(NSMutableArray<NSNumber*>*)values
                     forKey:(NSInteger)key;
@end
