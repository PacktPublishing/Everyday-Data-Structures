//
//  Graph.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 10/14/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

public class Graph
{
    public var nodes: Array = [GraphNode]()

    public init(nodes: Array<GraphNode>)
    {
        self.nodes = nodes
    }

    public func count() -> Int
    {
        return nodes.count
    }

    public func addNode(node: GraphNode)
    {
        nodes.append(node)
    }

    public func addNodeForValue(value: Int)
    {
        let node = GraphNode(val: value)
        nodes.append(node);
    }

    public func removeNodeForValue(value: Int) -> Bool
    {
        var nodeToRemove: GraphNode? = nil
        
        for n in nodes
        {
            if (n.value == value)
            {
                nodeToRemove = n;
                break
            }
        }

        if (nodeToRemove == nil)
        {
            return false
        }
        
        if let index = nodes.index(of: nodeToRemove!)
        {
            nodes.remove(at: index)
            
            for n in nodes
            {
                if let foundIndex = n.neighbors.index(of: nodeToRemove!)
                {
                    n.neighbors.remove(at: foundIndex)
                }
            }
            
            return true
        }
        
        return false

    }

    public func addEdgeFromNodeToNode(from: GraphNode, to: GraphNode)
    {
        from.neighbors.append(to)
    }

    public func addBidirectionalEdge(from: GraphNode, to: GraphNode)
    {
        from.neighbors.append(to)
        to.neighbors.append(from)
    }

    public func adjacent(from: GraphNode, to: GraphNode) -> Bool
    {
        if from.neighbors.index(of: to) != nil
        {
            return true
        }
        else
        {
            return false
        }
    }

    public func neighborsOfValue(value: Int) -> Array<GraphNode>?
    {
        for n in nodes
        {
            if (n.value == value)
            {
                return n.neighbors
            }
        }

        return nil
    }

}
