using System;
namespace EverydayDataStructures
{
	public class BooleanType
	{
		public BooleanType()
		{
		}

		public static void boolDemo()
		{
			//C#
			bool a = true;
			bool b = false;
			bool c = a;

			Console.WriteLine("a: {0}", a);
			Console.WriteLine("b: {0}", b);
			Console.WriteLine("c: {0}", c);

			//Operators
			Console.WriteLine("a AND b: {0}", a && b);
			Console.WriteLine("a OR b: {0}", a || b);
			Console.WriteLine("NOT a: {0}", !a);
			Console.WriteLine("NOT b: {0}", !b);
			Console.WriteLine("a XOR b: {0}", a ^ b);

			//Order of precedence & short circuiting
			Console.WriteLine("(c OR b) AND a: {0}", (c || b) && a);
		}
	}
}

