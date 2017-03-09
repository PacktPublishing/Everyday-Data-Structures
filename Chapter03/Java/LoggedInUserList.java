package main.java;

import java.util.List;
import java.util.LinkedList;


/**
 * Created by William Smith on 8/21/16.
 */
public class LoggedInUserList {

    List<User> _users;

    public LoggedInUserList()
    {
        _users = new LinkedList<User>();
    }

    boolean CanAddUser(User user)
    {
        if (_users.contains(user) ||
            _users.size() >= 30)
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    public void UserAuthenticated(User user)
    {
        if (this.CanAddUser(user))
        {
            _users.add(user);
        }
    }

    public void UserLoggedOut(User user)
        {
            _users.remove(user);
        }
}
