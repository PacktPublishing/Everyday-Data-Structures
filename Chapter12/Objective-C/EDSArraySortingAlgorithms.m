//
//  EDSArraySortingAlgorithms.m
//  EverydayDataStructures
//
//  Created by William Smith on 10/26/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSArraySortingAlgorithms.h"

@implementation EDSArraySortingAlgorithms

//SelectionSort
-(void)selectionSortArray:(NSMutableArray<NSNumber*>*)values
{
    if ([values count] <= 1)
        return;
    
    NSInteger j, minIndex;
    for (int i = 0; i < [values count] - 1; i++)
    {
        minIndex = i;
        for (j = i + 1; j < [values count]; j++)
        {
            if ([values[j] intValue] < [values[minIndex] intValue])
            {
                minIndex = j;
            }
        }
        
        NSNumber *temp = (NSNumber*)values[minIndex];
        values[minIndex] = values[i];
        values[i] = temp;
    }
}

//InsertionSort
-(void)insertionSortArray:(NSMutableArray<NSNumber*>*)values
{
    if ([values count] <= 1)
        return;
    
    NSInteger j, value;
    for (int i = 1; i < [values count]; i++)
    {
        value = [values[i] intValue];
        j = i - 1;
        
        while (j >= 0 && [values[j] intValue] > value)
        {
            values[j + 1] = values[j];
            j = j - 1;
        }
        values[j + 1] = [NSNumber numberWithInteger:value];
    }
}

//BubbleSort
-(void)bubbleSortArray:(NSMutableArray<NSNumber*>*)values
{
    bool swapped;
    for (NSInteger i = 0; i < [values count] - 1; i++)
    {
        swapped = false;
        for (NSInteger j = [values count] - 1; j > i; j--)
        {
            if (values[j] < values[j - 1])
            {
                NSInteger temp = [values[j] intValue];
                values[j] = values[j - 1];
                values[j - 1] = [NSNumber numberWithInteger:temp];
                swapped = true;
            }
        }
        
        if (swapped == false)
            break;
    }
}

//QuickSort
-(void)quickSortArray:(NSMutableArray<NSNumber*>*)values
          forLowIndex:(NSInteger)low
         andHighIndex:(NSInteger)high
{
    if (low < high)
    {
        NSInteger index = [self partitionArray:values
                                   forLowIndex:low
                                  andHighIndex:high];
        
        [self quickSortArray:values
                 forLowIndex:low
                andHighIndex:index - 1];
        [self quickSortArray:values
                 forLowIndex:index + 1
                andHighIndex:high];
    }
}

-(NSInteger)partitionArray:(NSMutableArray<NSNumber*>*)values
               forLowIndex:(NSInteger)low
              andHighIndex:(NSInteger)high
{
    NSInteger pivot = [values[high] intValue];
    NSInteger i = (low - 1);
    for (NSInteger j = low; j <= high - 1; j++)
    {
        if ([values[j] intValue] <= pivot)
        {
            i++;
            
            NSInteger temp = [values[i] intValue];
            values[i] = values[j];
            values[j] = [NSNumber numberWithInteger:temp];
        }
    }
    
    i++;
    NSInteger temp = [values[i] intValue];
    values[i] = values[high];
    values[high] = [NSNumber numberWithInteger:temp];
    
    return i;
}

//MergeSort
-(void)mergeSortArray:(NSMutableArray*)values
        withLeftIndex:(NSInteger)left
        andRightIndex:(NSInteger)right
{
    if (left == right)
        return;
    
    if (left < right)
    {
        NSInteger middle = (left + right) / 2;
        
        [self mergeSortArray:values
               withLeftIndex:left
               andRightIndex:middle];
        
        [self mergeSortArray:values
               withLeftIndex:middle + 1
               andRightIndex:right];
        
        NSMutableArray *temp = [NSMutableArray arrayWithArray:values];
        
        NSInteger index1 = left;
        NSInteger index2 = middle + 1;
        for (NSInteger n = left; n <= right; n++)
        {
            if (index1 == middle + 1)
            {
                values[n] = temp[index2++];
            }
            else if (index2 > right)
            {
                values[n] = temp[index1++];
            }
            else if (temp[index1] < temp[index2])
            {
                values[n] = temp[index1++];
            }
            else
            {
                values[n] = temp[index2++];
            }
        }
    }
}

//BucketSort
-(void)bucketSortArray:(NSMutableArray<NSNumber*>*)values
          withMaxValue:(NSInteger)maxValue
{
    NSMutableArray<NSNumber*>*bucket = [NSMutableArray array];
    NSInteger num = [values count];
    NSInteger bucketNum = maxValue + 1;
    
    for (int i = 0; i < bucketNum; i++)
    {
        [bucket insertObject:[NSNumber numberWithInteger:0] atIndex:i];
    }
    
    for (int i = 0; i < num; i++)
    {
        NSInteger value = [bucket[[values[i] intValue]] intValue] + 1;
        bucket[[values[i] intValue]] = [NSNumber numberWithInteger:value];
    }
    
    int pos = 0;
    
    for (int i = 0; i < bucketNum; i++)
    {
        for (int j = 0; j < [bucket[i] intValue]; j++)
        {
            values[pos++] = [NSNumber numberWithInteger:i];
        }
    }
}

//CountingSort
-(void)countingSortArray:(NSMutableArray<NSNumber*>*)values
{
    int n = (int)[values count];
    int min = [values[0] intValue];
    int max = [values[0] intValue];
    for (int i = 1; i < n; i++)
    {
        int iVal = (int)[values[i] intValue];
        if (iVal < min)
        {
            min = iVal;
        }
        else if (iVal > max)
        {
            max = iVal;
        }
    }
    
    NSMutableArray *count = [NSMutableArray array];
    for (int i = 0; i < max; i++)
    {
        count[i] = [NSNumber numberWithInteger:0];
    }
    
    for (int i = 0; i < n; i++)
    {
        //count[values[i] - min]++;
        int countIndex = [values[i] intValue] - min;
        int newValue = [count[countIndex] intValue] + 1;
        count[countIndex] = [NSNumber numberWithInteger:newValue];
    }
    
    int z = 0;
    for (int i = min; i <= max; i++)
    {
        while ([count[i - min] intValue] > 0)
        {
            values[z] = [NSNumber numberWithInteger:i];
            ++z;
            
            NSNumber *num = [NSNumber numberWithInteger:([count[i - min] intValue] - 1)];
            count[i - min] = num;
        }
    }
}

//RadixSort
-(void)radixSortArray:(NSMutableArray<NSNumber*>*)values
{
    NSInteger n = [values count];
    NSInteger max = [values[0] intValue];
    for (int i = 1; i < n; i++)
    {
        if ([values[i] intValue] > max)
        {
            max = [values[i] intValue];
        }
    }
    
    for (int exp = 1; max / exp > 0; exp *= 10)
    {
        NSMutableArray *output = [NSMutableArray array];
        for (int i = 0; i < n; i++)
        {
            [output addObject:[NSNumber numberWithInteger:0]];
        }
        
        NSMutableArray *count = [NSMutableArray array];
        for (int i = 0; i < 10; i++)
        {
            [count addObject:[NSNumber numberWithInteger:0]];
        }
        
        for (int i = 0; i < n; i++)
        {
            NSInteger index = ([values[i] intValue] / exp) % 10;
            NSInteger newValue = [count[index] intValue] + 1;
            count[index] = [NSNumber numberWithInteger:newValue];
        }
        
        for (int i = 1; i < 10; i++)
        {
            NSInteger newValue = [count[i] intValue] + [count[i - 1] intValue];
            count[i] = [NSNumber numberWithInteger:newValue];
        }
        
        for (NSInteger i = n - 1; i >= 0; i--)
        {
            NSInteger countIndex = (([values[i] intValue] / exp) % 10);
            NSInteger outputIndex = [count[countIndex] intValue] - 1;
            output[outputIndex] = values[i];
            
            NSInteger countValue = [count[countIndex] intValue] - 1;
            count[countIndex] = [NSNumber numberWithInteger:countValue];
        }
        
        for (int i = 0; i < n; i++)
        {
            values[i] = output[i];
        }
    }
}

@end
