//
//  EDSGraphNode.h
//  EverydayDataStructures
//
//  Created by William Smith on 10/14/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSGraphNode : NSObject

@property (nonatomic) NSInteger value;
@property (nonatomic) NSMutableArray* neighbors;

-(instancetype)initGraphNode;
-(instancetype)initGraphNodeWithValue:(NSInteger)value;

@end
