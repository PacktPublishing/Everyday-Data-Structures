package main.java;

import java.util.Arrays;
import java.util.ArrayList;

/**
 * Created by William Smith on 8/20/16.
 */
public class LoggedInUserArray
{
    User[] _users;

    public LoggedInUserArray()
    {
        User[] users = new User[0];
        _users = users;
    }

    boolean CanAddUser(User user)
    {
        boolean containsUser = false;
        for (User u : _users)
        {
            if (user == u)
            {
                containsUser = true;
                break;
            }
        }

        if (containsUser)
        {
            return false;
        }
        else
        {
            ArrayList<String> myArray = new ArrayList<String>();
            if (_users.length >= 30)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }

    public void UserAuthenticated(User user)
    {
        if (this.CanAddUser(user))
        {
            _users = Arrays.copyOf(_users, _users.length + 1);
            _users[_users.length - 1] = user;
            System.out.println("Length after adding user " + user.GetId() + ": " + _users.length);
        }
    }

    public void UserLoggedOut(User user)
    {
        int index = -1;
        int k = 0;
        for (User u : _users)
        {
            if (user == u)
            {
                index = k;
                break;
            }
            k++;
        }

        if (index == -1)
        {
            System.out.println("User " + user.GetId() + " not found.");
        }
        else
        {
            User[] newUsers = new User[_users.length - 1];
            for (int i = 0, j = 0; i < newUsers.length - 1; i++, j++)
            {
                if (i == index)
                {
                    j++;
                }
                newUsers[i] = _users[j];
            }

            _users = newUsers;
        }

        System.out.println("Length after logging out user " + user.GetId() + ": " + _users.length);
    }
}
