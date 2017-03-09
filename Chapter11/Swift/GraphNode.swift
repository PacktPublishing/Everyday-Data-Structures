//
//  GraphNode.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 10/14/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

public class GraphNode : Equatable
{
    public var neighbors: Array = [GraphNode]()
    public var value : Int
    
    public init(val: Int) {
        value = val
    }
}

public func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
    return (lhs.value == rhs.value)
}
