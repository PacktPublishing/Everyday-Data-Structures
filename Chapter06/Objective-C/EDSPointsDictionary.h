//
//  EDSPointsDictionary.h
//  EverydayDataStructures
//
//  Created by William Smith on 9/7/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSPointsDictionary : NSObject
-(void)registerCustomer:(NSString*)customerName;

-(void)registerCustomer:(NSString*)customerName
    withPreviousBalance:(NSInteger)previousBalance;

-(NSInteger)getCustomerPoints:(NSString*)customerName;

-(NSInteger)addPoints:(NSInteger)points
           toCustomer:(NSString*)customerName;

-(NSInteger)removePoints:(NSInteger)points
            fromCustomer:(NSString*)customerName;

-(NSInteger)redeemPoints:(NSInteger)points
             forCustomer:(NSString*)customerName;

-(NSInteger)customerCheckout:(NSString*)customerName;

-(bool)customerExists:(NSString*)customerName;

-(NSInteger)customersOnPremises;

-(void)closingTime;

@end
