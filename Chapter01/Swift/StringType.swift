//
//  StringType.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 8/11/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

class StringType
{
    static func stringDemo()
    {
        //Swift
        let one : String = "One String"
        print("One: \(one)")
        
        let two : String = "Two String"
        print("Two: \(two)")
        
        let red : String = "Red String"
        print("Red: \(red)")
        
        let blue : String = "Blue String"
        print("Blue: \(blue)")
        
        var purple : String = red + blue
        print("Concatenation: \(purple)")
        
        purple = "Purple String";
        print("Whoops! Mutation: \(purple)")
    }
}
