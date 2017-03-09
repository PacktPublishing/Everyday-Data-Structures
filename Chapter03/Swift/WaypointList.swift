//
//  WaypointList.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 8/26/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

open class WaypointList
{
    var _route: Array = [Waypoint]()
    var _current: Waypoint?

    init() { }

    open func addWaypoints(_ waypoints: Array<Waypoint>)
    {
        _route.append(contentsOf: waypoints)
    }

    open func removeWaypoint(_ waypoint: Waypoint) -> Bool
    {
        if let index = _route.index(of: waypoint)
        {
            _route.remove(at: index)
            return true
        }
        return false
    }

    open func insertWaypoints(_ waypoints: Array<Waypoint>, before: Waypoint)
    {
        if let index = _route.index(of: before)
        {
            _route.insert(contentsOf: waypoints, at:index)
        }
        else
        {
            addWaypoints(waypoints)
        }
    }

    open func startRoute() -> Bool
    {
        if _route.count > 1
        {
            _current = startingLine()
            return moveToNextWaypoint()
        }
        return false
    }

    open func moveToNextWaypoint() -> Bool
    {
        if (_current != nil)
        {
            _current!.DeactivateWaypoint()
            if _current != self.finishLine()
            {
                let index = _route.index(of: _current!)
                _current = _route[index!+1]
                return true
            }
            return false;
        }
        return false
    }

    open func moveToPreviousWaypoint() -> Bool
    {
        if (_current != nil &&
            _current != self.startingLine())
        {
            let index = _route.index(of: _current!)
            _current = _route[index!-1]
            _current!.ReactivateWaypoint()
            return true
        }
        return false
    }

    open func startingLine() -> Waypoint
    {
        return _route.first!
    }

    open func finishLine() -> Waypoint
    {
        return _route.last!
    }

    open func currentWaypoint() -> Waypoint
    {
        return _current!
    }
}
