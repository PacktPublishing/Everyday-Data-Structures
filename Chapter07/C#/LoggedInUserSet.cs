using System;
using System.Collections.Generic;

namespace EverydayDataStructures
{
	public class LoggedInUserSet
	{
		HashSet<User> _users;

		public LoggedInUserSet()
		{
			_users = new HashSet<User>();
		}

		public bool UserAuthenticated(User user)
		{
			if (_users.Count < 30)
			{
				return _users.Add(user);
			}
			return false;
		}

		public void UserLoggedOut(User user)
		{
			_users.Remove(user);
		}
	}
}

