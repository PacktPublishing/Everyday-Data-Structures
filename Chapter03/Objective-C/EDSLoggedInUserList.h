//
//  EDSLoggedInUserList.h
//  EverydayDataStructures
//
//  Created by William Smith on 8/20/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EDSUser;

@interface EDSLoggedInUserList : NSObject

-(void)userAuthenticated:(EDSUser*)user;

-(void)userLoggedOut:(EDSUser*)user;

@end
