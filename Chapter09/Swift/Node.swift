//
//  Node.swift
//  EverydayDataStructures-Swift
//
//  Created by Will Smith on 9/24/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

public class Node : Equatable
{
    public var data: Int
    public var left: Node?
    public var right: Node?

    public var children: Array<Node> {
        return [left!, right!]
    }

    public init (nodeData: Int)
    {
        data = nodeData
    }


    public func insertData(data: Int) -> Bool
    {
        return insertNode(node: Node(nodeData:data))
    }

    public func insertNode(node: Node?) -> Bool
    {
        if (node == nil)
        {
            return false
        }
        
        if ((findNode(node: node!)) != nil)
        {
            return false
        }
        else if (node!.data < data)
        {
            if (left == nil)
            {
                left = node
                return true
            }
            else
            {
                return left!.insertNode(node: node)
            }
        }
        else
        {
            if (right == node)
            {
                right = node
                return true
            }
            else
            {
                return right!.insertNode(node: node)
            }
        }
    }


    public func graft(node: Node?) -> Bool
    {
        if (node == nil)
        {
            return false
        }
        
        let nodes: Array = node!.listTree()
        for n in nodes
        {
            self.insertNode(node: n)
        }
        
        return true
    }

    public func removeData(data: Int) -> Node?
    {
        return removeNode(node: Node(nodeData:data))
    }

    public func removeNode(node: Node?) -> Node?
    {
        if (node == nil)
        {
            return nil
        }
        
        var retNode: Node
        var modNode: Node?
        var treeList = Array<Node>()
        
        if (self.data == node!.data)
        {
            //Root match
            retNode = Node(nodeData: self.data)
            modNode = self
            if (children.count == 0)
            {
                return self //Root has no childen
            }
        }
        else if (left!.data == node!.data)
        {
            //Match found
            retNode = Node(nodeData: left!.data)
            modNode = left!
        }
        else if (right!.data == node!.data)
        {
            //Match found
            retNode = Node(nodeData: right!.data)
            modNode = right!
        }
        else
        {
            for child in self.children
            {
                if (child.removeNode(node: node) != nil)
                {
                    return child
                }
            }
            
            //No match in tree
            return nil
        }
        
        //Reorder the tree
        if ((modNode!.left) != nil)
        {
            modNode!.data = modNode!.left!.data
            treeList = modNode!.left!.listTree()
            modNode!.left = nil
        }
        else if ((modNode!.right) != nil)
        {
            modNode!.data = modNode!.right!.data
            treeList = modNode!.right!.listTree()
            modNode!.right = nil
        } 
        else 
        {
            modNode = nil
        }
        
        for n in treeList
        {
            modNode!.insertNode(node: n)
        }
        
        //Finished
        return retNode
    }

    public func prune(root: Node?) -> Node?
    {
        if (root == nil)
        {
            return nil
        }
        
        var matchNode: Node?
        if (self.data == root!.data)
        {
            //Root match
            let b = self.copyTree()
            self.left = nil
            self.right = nil
            return b
        }
        else if (self.left!.data == root!.data)
        {
            matchNode = self.left!
        }
        else if (self.right!.data == root!.data)
        {
            matchNode = self.right!
        }
        else
        {
            for child in self.children
            {
                if (child.prune(root: root!) != nil)
                {
                    return child
                }
            }
            
            //No match in tree
            return nil;
        }

        let branch = matchNode!.copyTree()
        matchNode = nil

        return branch
    }
    
    public func findData(data: Int) -> Node?
    {
        return findNode(node: Node(nodeData:data))
    }
    
    public func findNode(node: Node) -> Node?
    {
        if (node == self)
        {
            return self
        }
        
        for child in children
        {
            let result = child.findNode(node: node)
            if (result != nil)
            {
                return result
            }
        }
        
        return nil
    }

    public func copyTree() -> Node
    {
        let n = Node(nodeData: self.data)
        
        if (self.left != nil)
        {
            n.left = self.left!.copyTree()
        }
        
        if(self.right != nil)
        {
            n.right = self.right!.copyTree()
        }
        
        return n
    }

    public func listTree() -> Array<Node>
    {
        var result = Array<Node>()
        result.append(self)
        for child in children
        {
            result.append(contentsOf: child.listTree())
        }
        return result
    }
}

public func == (lhs: Node, rhs: Node) -> Bool {
    return (lhs.data == rhs.data)
}
