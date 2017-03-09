//
//  ArraySortingAlgorithms.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 10/26/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

public class ArraySortingAlgorithms
{
    open func swap( x: inout Int, y: inout Int)
    {
        let t: Int = x
        x = y
        y = t
    }
    
    //Insertion Sort
    open func insertionSort( values: inout [Int])
    {
        if (values.count <= 1)
        {
            return
        }
        
        var j, value: Int
        for i in 1..<values.count
        {
            value = values[i]
            j = i - 1

            while (j >= 0 && values[j] > value)
            {
                values[j + 1] = values[j]
                j = j - 1
            }
            values[j + 1] = value
        }
    }
    
    //Selection Sort
    open func selectionSort( values: inout [Int])
    {
        if (values.count <= 1)
        {
            return
        }
        
        var minIndex: Int
        for i in 0..<values.count
        {
            minIndex = i
            for j in i+1..<values.count
            {
                if (values[j] < values[minIndex])
                {
                    minIndex = j
                }
            }
            
            swap(x: &values[minIndex], y: &values[i])
        }
    }
    
    //Quick Sort
    open func quickSort( values: inout [Int], low: Int, high: Int)
    {
        if (low < high)
        {
            let index: Int = partition( values: &values, low: low, high: high)
            
            quickSort( values: &values, low: low, high: index - 1)
            quickSort( values: &values, low: index + 1, high: high)
        }
    }

    func partition( values: inout [Int], low: Int, high: Int) -> Int
    {
        let pivot: Int = values[high]
        var i: Int = (low - 1)
        var j: Int = low
        
        while j <= (high - 1)
        {
            if (values[j] <= pivot)
            {
                i += 1
                swap(x: &values[i], y: &values[j])
            }
            
            j += 1
        }
        
        i += 1
        swap(x: &values[i], y: &values[high])
        
        return i;
    }
    
    
    //Merge Sort
    open func mergeSort( values: inout [Int], left: Int, right: Int)
    {
        if (left == right)
        {
            return
        }
        
        if (left < right)
        {
            let middle: Int = (left + right) / 2
            
            mergeSort(values: &values, left: left, right: middle)
            mergeSort(values: &values, left: middle + 1, right: right)
            
            var temp = values
            
            var index1: Int = left
            var index2: Int = middle + 1
            for n in left...right
            {
                if (index1 == middle + 1)
                {
                    values[n] = temp[index2]
                    index2 += 1
                }
                else if (index2 > right)
                {
                    values[n] = temp[index1]
                    index1 += 1
                }
                else if (temp[index1] < temp[index2])
                {
                    values[n] = temp[index1]
                    index1 += 1
                }
                else
                {
                    values[n] = temp[index2]
                    index2 += 1
                }
            }
        }
    }
    
    //BubbleSort
    open func bubbleSort( values: inout [Int])
    {
        if (values.count <= 1)
        {
            return
        }
        
        var swapped: Bool
        var i: Int = 0
        while i < (values.count - 1)
        {
            swapped = false
            var j: Int = values.count - 1
            while j > i
            {
                if (values[j] < values[j - 1])
                {
                    swap(x: &values[j], y: &values[j - 1])
                    swapped = true
                }
                j -= 1
            }
        
            if (swapped == false)
            {
                break
            }
            i += 1
        }
    }
    
    //BucketSort
    open func bucketSort( values: inout [Int], maxVal: Int)
    {
        var bucket = [Int]()
        let num: Int = values.count
        let bucketNum: Int = maxVal + 1
        
        for i in 0..<bucketNum
        {
            bucket.insert(0, at: i)
        }
        
        for i in 0..<num
        {
            bucket[values[i]] = bucket[values[i]] + 1
        }
        
        var pos: Int = 0
        for i in 0..<bucketNum
        {
            for _ in 0..<bucket[i]
            {
                values[pos] = i
                pos += 1
            }
        }
    }
    
    //CountSort
    open func countingSort( values: inout [Int])
    {
        let n: Int = values.count
        var min: Int = values.min()!
        var max: Int = values.max()!
        
        for i in 1..<n
        {
            let iVal: Int = values[i]
            if (iVal < min)
            {
                min = iVal
            }
            else if (iVal > max)
            {
                max = iVal
            }
        }
        
        var count = [Int]()
        for i in 0..<max
        {
            count.insert(0, at: i)
        }
        
        for i in 0..<n
        {
            count[values[i] - min] = count[values[i] - min] + 1
        }
        
        var z: Int = 0
        var i: Int = min
        while i <= max
        {
            while (count[i - min] > 0)
            {
                values[z] = i
                z += 1
                count[i - min] = count[i - min] - 1
            }
            i += 1
        }
    }
    
    
    //RadixSort
    open func radixSort( values: inout [Int])
    {
        let n: Int = values.count
        var max: Int = values[0]
        
        for i in 1..<n
        {
            if (values[i] > max)
            {
                max = values[i];
            }
        }
        
        var exp: Int = 1
        while max/exp > 0 {
            var output: [Int] = [Int]()
            for _ in 0..<n
            {
                output.append(0)
            }
            
            var count: [Int] = [Int]()
            for _ in 0..<10
            {
                count.append(0)
            }
            
            for i in 0..<n
            {
                let index: Int = (values[i] / exp) % 10
                count[index] = count[index] + 1
            }
            
            for i in 1..<10
            {
                count[i] = count[i] + count[i - 1]
            }
            
            var i: Int = n - 1
            while i >= 0
            {
                let index: Int = (values[i] / exp) % 10
                output[count[index] - 1] = values[i]
                count[index] = count[index] - 1
                i -= 1
            }
            
            for i in 0..<n
            {
                values[i] = output[i];
            }
            exp *= 10
        }
    }
    
}
