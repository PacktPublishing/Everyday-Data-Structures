//
//  LoggedInUserList.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 8/22/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

open class LoggedInUserList
{
    var _users: Array = [User]()

    init() { }
    
    func canAddUser(_ user: User) -> Bool
    {
        if (_users.contains(user) ||
            _users.count >= 30)
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    open func userAuthenticated(_ user: User)
    {
        if (self.canAddUser(user))
        {
            _users.append(user)
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
