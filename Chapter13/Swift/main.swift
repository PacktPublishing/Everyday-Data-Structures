//
//  main.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 8/4/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

print("Hello, World!")

var arr: [Int] = [12, 11, 13, 5, 6, 9, 18, 110, 3, 14, 27, 12]

let algo: ArraySortingAlgorithms = ArraySortingAlgorithms()

//algo.selectionSort(values: &arr)
//algo.insertionSort(values: &arr)
//algo.bubbleSort(values: &arr)
//algo.quickSort(values: &arr, low: 0, high: arr.count - 1)
//algo.mergeSort(values: &arr, left: 0, right: arr.count - 1)
//algo.bucketSort(values: &arr, maxVal: 110)
//algo.countingSort(values: &arr) //Doesn't like 0
algo.radixSort(values: &arr)
for num in 0..<arr.count
{
    print(arr[num])
}
