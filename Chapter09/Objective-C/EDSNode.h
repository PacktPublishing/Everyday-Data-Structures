//
//  EDSNode.h
//  EverydayDataStructures
//
//  Created by Will Smith on 9/24/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSNode : NSObject

@property (nonatomic) NSInteger data;
@property (nonatomic) EDSNode *left;
@property (nonatomic) EDSNode *right;
@property (nonatomic, readonly) NSArray *children;

-(instancetype)initNodeWithData:(NSInteger)data;

-(BOOL)insertData:(NSInteger)data;
-(BOOL)insertNode:(EDSNode*)node;
-(BOOL)graft:(EDSNode*)node;
-(EDSNode*)removeData:(NSInteger)data;
-(EDSNode*)removeNode:(EDSNode*)node;
-(EDSNode*)prune:(EDSNode*)root;
-(EDSNode*)findData:(NSInteger)data;
-(EDSNode*)findNode:(EDSNode*)node;
-(EDSNode*)copyTree;
-(NSArray*)listTree;

@end
