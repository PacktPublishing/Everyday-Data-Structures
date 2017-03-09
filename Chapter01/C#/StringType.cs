using System;
namespace EverydayDataStructures
{
	public class StringType
	{
		public StringType()
		{
		}

		public static void stringDemo()
		{
			//C#
			string one = "One String";
			Console.WriteLine("One: {0}", one);

			String two = "Two String";
			Console.WriteLine("Two: {0}", two);

			String red = "Red String";
			Console.WriteLine("Red: {0}", red);

			String blue = "Blue String";
			Console.WriteLine("Blue: {0}", blue);

			String purple = red + blue;
			Console.WriteLine("Concatenation: {0}", purple);

			purple = "Purple String";
			Console.WriteLine("Whoops! Mutation: {0}", purple);
		}

		public static void arrayDemo()
		{
			User u1 = new User("Will", 1);
			User u2 = new User("Dorothy", 2);
			User u3 = new User("Sam", 3);
			User u4 = new User("Logan", 4);
			User u5 = new User("Lucas", 5);
			User u6 = new User("Zion", 6);
			LoggedInUserArray users = new LoggedInUserArray();

			users.UserAuthenticated(u1);
			users.UserAuthenticated(u2);
			users.UserAuthenticated(u3);
			users.UserAuthenticated(u4);
			users.UserLoggedOut(u2);
			users.UserAuthenticated(u5);
			users.UserAuthenticated(u6);


		}
	}
}



