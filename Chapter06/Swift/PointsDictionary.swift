//
//  PointsDictionary.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 9/7/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

open class PointsDictionary
{
    var _points = Dictionary<String, Int>()

    open func updatePointsForCustomer(_ points: Int, customerName: String) -> Int
    {
        if customerExists(customerName)
        {
            _points[customerName] = _points[customerName]! + points
            return _points[customerName]!
        }
        return 0
    }

    //Add
    open func registerCustomer(_ customerName: String)
    {
        registerCustomerWithPreviousBalance(customerName, previousBalance: 0)
    }

    open func registerCustomerWithPreviousBalance(_ customerName: String, previousBalance: Int)
    {
        _points[customerName] = previousBalance;
    }

    //Get
    open func getCustomerPoints(_ customerName: String) -> Int
    {
        let rawsPoints = _points[customerName]
        return rawsPoints != nil ? rawsPoints! : 0;
    }

    //Update
    open func addPointsToCustomer(_ points: Int, customerName: String) -> Int
    {
        return updatePointsForCustomer(points, customerName: customerName)
    }

    open func removePointsFromCustomer(_ points: Int, customerName: String) -> Int
    {
        return updatePointsForCustomer(-points, customerName: customerName)
    }

    open func redeemPointsForCustomer(_ points: Int, customerName: String) -> Int
    {
        return updatePointsForCustomer(-points, customerName: customerName)
    }

    open func customerCheckout(_ customerName: String) -> Int
    {
        let points = _points[customerName]
        _points.removeValue(forKey: customerName)
        return points!;
    }

    //Contains
    open func customerExists(_ customerName: String) -> Bool
    {
        //Returns nil if no key, which reads as false.
        //Cannot add nil to a dictionary so this is type safe also
        return _points[customerName] != nil
    }

    //Count
    open func customersOnPremises() -> Int
    {
        return _points.count
    }

    //Clear
    open func closingTime()
    {
        _points.removeAll()
    }
}
