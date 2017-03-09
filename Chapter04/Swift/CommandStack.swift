//
//  CommandStack.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 8/28/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

open class CommandStack
{
    open fileprivate(set) var _commandStack: Array = [Command]()
    open fileprivate(set) var _capacity: Int;

    public init (commandCapacity: Int)
    {
        _capacity = commandCapacity
    }

    open func IsFull() -> Bool
    {
        return _commandStack.count >= _capacity
    }

    open func IsEmpty() -> Bool
    {
        return _commandStack.count == 0
    }

    open func PerformCommand(_command: Command) -> Bool
    {
        if (!IsFull())
        {
            _commandStack.append(command)
            return true
        }
        return false
    }

    open func PerformCommands(_commands: [Command]) -> Bool
    {
        var inserted: Bool = true;
        for c in commands
        {
            inserted = PerformCommand(c)
        }
        return inserted
    }

    open func UndoCommand() -> Command
    {
        return _commandStack.popLast()!
    }

    open func Reset()
    {
        _commandStack.removeAll()
    }

    open func TotalCommands() -> Int
    {
        return _commandStack.count
    }
}
