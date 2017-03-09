//
//  CustomerQueue.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 8/31/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

open class CustomerQueue
{
    var _custQueue: Array = [Customer]()
    var _cap: Int;

    public init(capacity: Int)
    {
        _cap = capacity
    }

    open func canCheckinCustomer() -> Bool
    {
        return _custQueue.count < _cap
    }

    open func checkInCustomer(_ c: Customer)
    {
        if canCheckinCustomer()
        {
            _custQueue.append(c)
        }
    }

    open func customerConsultation() -> Customer
    {
        return _custQueue.first!
    }

    open func checkoutCustomer()
    {
        _custQueue.removeFirst()
    }
    
    open func clearCustomers()
    {
        _custQueue.removeAll()
    }

    open func cancelCustomer(_ c: Customer)
    {
        if let index = _custQueue.index(of: c)
        {
            _custQueue.remove(at: index)
        }
    }

    open func positionOfCustomer(_ c: Customer) -> Int
    {
        return _custQueue.index(of: c)!
    }

    open func customersInLine() -> Int
    {
        return _custQueue.count
    }

    open func isLineEmpty() -> Bool
    {
        return _custQueue.count == 0
    }

    open func isLineFull() -> Bool
    {
        return _custQueue.count == _cap
    }
}
