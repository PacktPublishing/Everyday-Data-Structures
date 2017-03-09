//
//  LoggedInUserArray.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 8/21/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

open class LoggedInUserArray
{
    var _users: Array = [User]()
    
    init()
    {
    
    }
    
    func canAddUser(_ user: User) -> Bool
    {
        if (_users.contains(user))
        {
            return false
        }
        else
        {
            if (_users.count >= 30)
            {
                return false
            }
            else
            {
                return true
            }
        }
    }
    
    open func userAuthenticated(_ user: User)
    {
        if (self.canAddUser(user))
        {
            _users.append(user)
        }
        
        print("Length after adding user \(user._userId): \(_users.count)")
    }
    
    open func userLoggedOut(_ user: User)
    {
        if let index = _users.index(of: user)
        {
            _users.remove(at: index)
        }
        print("Length after logging out user \(user._userId): \(_users.count)")
    }
}
