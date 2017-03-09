//
//  EDSLoggedInUserSet.h
//  EverydayDataStructures
//
//  Created by William Smith on 9/11/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EDSUser;

@interface EDSLoggedInUserSet : NSObject

-(void)userAuthenticated:(EDSUser*)user;

-(void)userLoggedOut:(EDSUser*)user;

@end
