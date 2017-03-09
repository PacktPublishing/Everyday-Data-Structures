//
//  IntegerTypes.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 8/5/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

class IntegerTypes
{
    static func intExamples()
    {
        let int8 : Int8 = -127
        let uint8 : UInt8 = 255
        print("int8: \(int8)")
        print("uint8: \(uint8)")

        let int16 : Int16 = -32768
        let uint16 : UInt16 = 65535
        print("int16: \(int16)")
        print("uint16: \(uint16)")

        let int32 : Int32 = -2147483648
        let uint32 : UInt32 = 4294967295
        print("int32: \(int32)")
        print("uint32: \(uint32)")

        let int64 : Int64 = -9223372036854775808
        let uint64 : UInt64 = 18446744073709551615
        print("int64: \(int64)")
        print("uint64: \(uint64)")
    }
}
