//
//  ArraySearchAlgorithms.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 10/31/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

class ArraySearchAlgorithms
{
    //Sequential / Linear
    open func linearSearhIndex( values: [Int], key: Int) -> Int
    {
        for i in 0..<values.count
        {
            if (values[i] == key)
            {
                return i
            }
        }

        return -1
    }

    open func linearSearchCustomer( customers: [Customer], custId: Int) -> Customer?
    {
        for i in 0..<customers.count
        {
            if (customers[i].custId == custId)
            {
                return customers[i]
            }
        }

        return nil
    }
    
    //Binary Search
    open func binarySearch( values: [Int], left: Int, right: Int, key: Int) -> Int
    {
        if (right >= left)
        {
            let mid: Int = left + (right - left) / 2

            if (values[mid] == key)
            {
                return mid
            }
            else if (values[mid] > key)
            {
                return binarySearch(values: values, left: left, right: mid - 1, key: key)
            }

            return binarySearch(values: values, left: mid + 1, right: right, key: key)
        }

        return -1
    }
    
    
    //Jump Search
    open func jumpSearch( values: [Int], key: Int) -> Int
    {
        let n: Int = values.count
        var step: Int = Int(sqrt(Double(n)))
        
        var prev: Int = 0
        
        while values[min(step, n) - 1] < key
        {
            prev = step
            step = step + Int(floor(sqrt(Double(n))))
            if (prev >= n)
            {
                return -1
            }
        }
        
        while (values[prev] < key)
        {
            prev = prev + 1
            if (prev == min(step, n))
            {
                return -1
            }
        }
        
        if (values[prev] == key)
        {
            return prev
        }
        
        return -1
    }
}
