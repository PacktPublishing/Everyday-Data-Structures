//
//  EDSGraph.h
//  EverydayDataStructures
//
//  Created by William Smith on 10/14/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EDSGraphNode;

@interface EDSGraph : NSObject

@property (nonatomic) NSMutableArray *nodes;
@property (nonatomic, readonly) NSInteger *count;

-(instancetype)initGraphWithNodes:(NSMutableArray<EDSGraphNode*>*)nodes;

-(void)addNode:(EDSGraphNode*)node;
-(void)addNodeForValue:(NSInteger)value;
-(BOOL)removeNodeForValue:(NSInteger)value;
-(void)addEdgeFromNode:(EDSGraphNode*)from toNode:(EDSGraphNode*)to;
-(void)addBidirectionalEdgeFromNode:(EDSGraphNode*)from toNode:(EDSGraphNode*)to;
-(BOOL)adjacent:(EDSGraphNode*)from toNode:(EDSGraphNode*)to;
-(NSMutableArray<EDSGraphNode*>*)neighborsOfValue:(NSInteger)value;

@end
