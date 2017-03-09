//
//  LoggedInUserSet.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 9/11/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

open class LoggedInUserSet
{
    var _users: Set<User> = Set<User>()

    open func userAuthenticated(_ user: User)
    {
        if (_users.count < 30)
        {
            _users.insert(user)
        }
    }

    open func userLoggedOut(_ user: User)
    {
        if let index = _users.index(of: user)
        {
            _users.remove(at: index)
        }
    }
}
