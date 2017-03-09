//
//  EDSArraySortingAlgorithms.h
//  EverydayDataStructures
//
//  Created by William Smith on 10/26/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSArraySortingAlgorithms : NSObject

-(void)selectionSortArray:(NSMutableArray<NSNumber*>*)values;
-(void)insertionSortArray:(NSMutableArray<NSNumber*>*)values;
-(void)bubbleSortArray:(NSMutableArray<NSNumber*>*)values;
-(void)quickSortArray:(NSMutableArray<NSNumber*>*)values
          forLowIndex:(NSInteger)low
         andHighIndex:(NSInteger)high;
-(void)mergeSortArray:(NSMutableArray*)array
        withLeftIndex:(NSInteger)left
        andRightIndex:(NSInteger)right;
-(void)bucketSortArray:(NSMutableArray<NSNumber*>*)values
          withMaxValue:(NSInteger)maxValue;
-(void)countingSortArray:(NSMutableArray<NSNumber*>*)values;
-(void)radixSortArray:(NSMutableArray<NSNumber*>*)values;

-(void) csort:(NSMutableArray<NSNumber*>*)values;

@end
