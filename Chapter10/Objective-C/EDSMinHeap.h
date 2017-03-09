//
//  EDSMinHeap.h
//  EverydayDataStructures
//
//  Created by William Smith on 10/6/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EDSHeapNode;

@interface EDSMinHeap : NSObject

@property NSInteger Count;

-(instancetype)initMinHeap;
-(void)insert:(EDSHeapNode*)item;
-(void)delete:(EDSHeapNode*)item;
-(EDSHeapNode*)extractMin; //Pop
-(EDSHeapNode*)findMin; //Peek
-(NSArray<EDSHeapNode*>*)childrenOfParentIndex:(NSInteger)parentIndex;
-(EDSHeapNode*)parentOfChildIndex:(NSInteger)childIndex;

@end


@interface EDSHeapNode : NSObject

@property NSInteger data;

@end
