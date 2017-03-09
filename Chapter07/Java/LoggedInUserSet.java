package main.java;

import java.util.HashSet;

/**
 * Created by William Smith on 9/11/16.
 */
public class LoggedInUserSet {
    HashSet<User> _users;

    public LoggedInUserSet()
    {
        _users = new HashSet<User>();
    }

    public boolean userAuthenticated(User user)
    {
        if (_users.size() < 30)
        {
            return _users.add(user);
        }
        return false;
    }

    public void userLoggedOut(User user)
    {
        _users.remove(user);
    }
}
