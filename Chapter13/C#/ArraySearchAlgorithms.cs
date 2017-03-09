using System;
namespace EverydayDataStructures
{
	public class ArraySearchAlgorithms
	{
		public ArraySearchAlgorithms()
		{
		}

		//Sequential / Linear Search
		public int LinearSearchIndex(int[] values, int key)
		{
			for (int i = 0; i < values.Length - 1; i++)
			{
				if (values[i] == key)
				{
					return i;
				}
			}

			return -1;
		}

		public Customer LinearSearchCustomer(Customer[] customers, int custId)
		{
			for (int i = 0; i < customers.Length - 1; i++)
			{
				if (customers[i].customerId == custId)
				{
					return customers[i];
				}
			}

			return null;
		}

		//Binary Search
		public int BinarySearch(int[] values, int left, int right, int key)
		{
			if (right >= left)
			{
				int mid = left + (right - left) / 2;

				if (values[mid] == key)
				{
					return mid;
				}
				else if (values[mid] > key)
				{
					return BinarySearch(values, left, mid - 1, key);
				}

				return BinarySearch(values, mid + 1, right, key);
			}

			return -1;
		}
			
		//Jump Search
		public int JumpSearch(int[] values, int key)
		{
			int n = values.Length;
			int step = (int)Math.Sqrt(n);
			int prev = 0;

			while (values[Math.Min(step, n) - 1] < key)
			{
				prev = step;
				step += (int)Math.Floor(Math.Sqrt(n));
				if (prev >= n)
				{
					return -1;
				}
			}

			while (values[prev] < key)
			{
				prev++;
				if (prev == Math.Min(step, n))
				{
					return -1;
				}
			}
				
			if (values[prev] == key)
			{
				return prev;
			}

			return -1;
		}
	}
}
