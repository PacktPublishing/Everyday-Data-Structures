//
//  BoolType.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 8/10/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

class BoolType
{
    static func boolDemo()
    {
        let a : Bool = true
        let b : Bool = false
        let c = a

        print("a: \(a)")
        print("b: \(b)")
        print("c: \(c)")
        print("a AND b: \(a && b)")
        print("a OR b: \(a || b)")
        print("NOT a: \(!a)")
        print("NOT b: \(!b)")
        print("a XOR b: \(a != b)")
        print("(c OR b) AND a: \((c || b) && a)")
    }
}
