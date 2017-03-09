using System;

namespace EverydayDataStructures
{
	public class LoggedInUserArray
	{
		User[] _users;

		public LoggedInUserArray()
		{
			User[] users = new User[0];
			_users = users;
		}

		bool CanAddUser(User user)
		{
			bool containsUser = false;
			foreach (User u in _users)
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
				if (_users.Length >= 30)
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
				Array.Resize(ref _users, _users.Length + 1);
				_users[_users.Length - 1] = user;
				Console.WriteLine("Length after adding user {0}: {1}", user.Id, _users.Length);
			}
		}

		public void UserLoggedOut(User user)
		{
			int index = Array.IndexOf(_users, user);
			if (index == -1)
			{
				Console.WriteLine("User {0} not found.", user.Id);
			}
			else
			{
				User[] newUsers = new User[_users.Length - 1];
				for (int i = 0, j = 0; i < newUsers.Length - 1; i++, j++)
				{
					if (i == index)
					{
						j++;
					}
					newUsers[i] = _users[j];
				}

				_users = newUsers;
			}
			Console.WriteLine("Length after logging out user {0}: {1}", user.Id, _users.Length);
		}
	}
}



