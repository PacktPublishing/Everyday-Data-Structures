//
//  Waypoint.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 8/24/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation
import CoreLocation

public struct Waypoint : Equatable
{
    var lat: Int
    var long: Int
    public fileprivate(set) var active: Bool
    
    public init(latitude: Int, longitude: Int) {
        lat = latitude
        long = longitude
        active = true
    }
    
    public mutating func DeactivateWaypoint()
    {
        active = false;
    }
    
    public mutating func ReactivateWaypoint()
    {
        active = true;
    }
}

public func == (lhs: Waypoint, rhs: Waypoint) -> Bool {
    return (lhs.lat == rhs.lat && lhs.long == rhs.long)
}
