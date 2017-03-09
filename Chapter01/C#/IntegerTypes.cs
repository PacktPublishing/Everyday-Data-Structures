using System;
namespace EverydayDataStructures
{
	public class IntegerTypes
	{
		public IntegerTypes()
		{
		}

		public static void intDemo()
		{
			sbyte minSbyte = -128;
			byte maxByte = 255;
			Console.WriteLine("minSbyte: {0}", minSbyte);
			Console.WriteLine("maxByte: {0}", maxByte);

			short minShort = -32768;
			ushort maxUShort = 65535;
			Console.WriteLine("minShort: {0}", minShort);
			Console.WriteLine("maxUShort: {0}", maxUShort);

			int minInt = -2147483648;
			uint maxUint = 4294967295;
			Console.WriteLine("minInt: {0}", minInt);
			Console.WriteLine("maxUint: {0}", maxUint);

			long minLong = -9223372036854775808;
			ulong maxUlong = 18446744073709551615;
			Console.WriteLine("minLong: {0}", minLong);
			Console.WriteLine("maxUlong: {0}", maxUlong);
		}
	}
}

