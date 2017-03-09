//
//  main.m
//  EverydayDataStructures
//
//  Created by William Smith on 8/4/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDSIntegerTypes.h"
#import "EDSFloatingTypes.h"
#import "EDSBooleanType.h"
#import "EDSStringType.h"
#import "EDSLoggedInUserArray.h"
#import "EDSUser.h"
#import "EDSCollectionTests.h"

#import "EDSArraySortingAlgorithms.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *arr = [NSMutableArray arrayWithObjects:[NSNumber numberWithInteger:12], [NSNumber numberWithInteger:11], [NSNumber numberWithInteger:13], [NSNumber numberWithInteger:5], [NSNumber numberWithInteger:6], [NSNumber numberWithInteger:9], [NSNumber numberWithInteger:18], [NSNumber numberWithInteger:110], [NSNumber numberWithInteger:3], [NSNumber numberWithInteger:14], [NSNumber numberWithInteger:27], [NSNumber numberWithInteger:27], [NSNumber numberWithInteger:0], nil];
        
        EDSArraySortingAlgorithms *algo = [[EDSArraySortingAlgorithms alloc] init];
        
//        [algo selectionSortArray:arr];
//        [algo insertionSortArray:arr];
//        [algo bubbleSortArray:arr];
//        [algo quickSortArray:arr forLowIndex:0 andHighIndex:arr.count - 1];
//        [algo mergeSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1];
//        [algo bucketSortArray:arr withMaxValue:110];
//        [algo countingSortArray:arr];
        [algo radixSortArray:arr];
        
        for (NSNumber *num in arr) {
            NSLog(@"%li", (long)[num integerValue]);
        }
    }
    return 0;
}
