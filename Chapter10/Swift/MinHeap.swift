//
//  MinHeap.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 10/6/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

public class MinHeap
{
    public var _elements: Array = [HeapNode]()


    public init () {}

    public func getCount() -> Int
    {
        return _elements.count
    }

    public func insert(item: HeapNode)
    {
        _elements.append(item)
        orderHeap()
    }

    public func delete(item: HeapNode)
    {
        if let index = _elements.index(of: item)
        {
            _elements[index] = _elements.last!
            _elements.removeLast()
            orderHeap()
        }
    }

    public func extractMin() -> HeapNode?
    {
        if (_elements.count > 0)
        {
            let item = _elements[0]
            delete(item: item)
            return item
        }
        
        return nil
    }

    public func findMin() -> HeapNode?
    {
        if (_elements.count > 0)
        {
            return _elements[0]
        }
        
        return nil
    }

    public func orderHeap()
    {
        for i in (0..<(_elements.count) - 1).reversed()
        {
            let parentPosition = (i - 1) / 2

            if (_elements[parentPosition].data! > _elements[i].data!)
            {
                swapElements(first: parentPosition, second: i)
            }
        }
    }

    public func swapElements(first: Int, second: Int)
    {
        let tmp = _elements[first]
        _elements[first] = _elements[second]
        _elements[second] = tmp
    }

    public func getChildren(parentIndex: Int) -> [HeapNode]?
    {
        if (parentIndex >= 0)
        {
            var children: Array = [HeapNode]()
            
            let childIndexOne = (2 * parentIndex) + 1;
            let childIndexTwo = (2 * parentIndex) + 2;
            children.append(_elements[childIndexOne])
            children.append(_elements[childIndexTwo])
            
            return children;
        }
        
        return nil;
    }

    public func getParent(childIndex: Int) -> HeapNode?
    {
        if (childIndex > 0 && _elements.count > childIndex)
        {
            let parentIndex = (childIndex - 1) / 2;
            return _elements[parentIndex];
        }
        
        return nil;
    }
}

public class HeapNode : Equatable
{
    public var data: Int?
    
    public init() {}
}

public func == (lhs: HeapNode, rhs: HeapNode) -> Bool {
    return (lhs.data == rhs.data)
}
