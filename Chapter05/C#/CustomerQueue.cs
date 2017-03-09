using System;
using System.Collections.Generic;

namespace EverydayDataStructures
{
	public class CustomerQueue
	{
		Queue<Customer> _custQueue;
		int _cap;

		public CustomerQueue(int capacity)
		{
			_custQueue = new Queue<Customer>();
			_cap = capacity;
		}

		private bool CanCheckinCustomer()
		{
			return this._custQueue.Count < this._cap;
		}

		public void CustomerCheckin(Customer c)
		{
			if (this.CanCheckinCustomer())
			{
				this._custQueue.Enqueue(c);
			}
		}

		public Customer CustomerConsultation()
		{
			return this._custQueue.Peek();
		}

		public void CustomerCheckout()
		{
			this._custQueue.Dequeue();
		}

		public void ClearCustomers()
		{
			this._custQueue.Clear();
		}

		public void CustomerCancel(Customer c)
		{
			Queue<Customer> tempQueue = new Queue<Customer>();
			foreach (Customer cust in this._custQueue)
			{
				if (cust.Equals(c))
				{
					continue;
				}
				tempQueue.Enqueue(c);
			}
			this._custQueue = tempQueue;
		}

		public int CustomerPosition(Customer c)
		{
			if (this._custQueue.Contains(c))
			{
				int i = 0;
				foreach (Customer cust in this._custQueue)
				{
					if (cust.Equals(c))
					{
						return i;
					}
					i++;
				}
			}

			return -1;
		}

		public int CustomersInLine()
		{
			return this._custQueue.Count;
		}

		public bool IsLineEmpty()
		{
			return this._custQueue.Count == 0;
		}

		public bool IsLineFull()
		{
			return this._custQueue.Count == this._cap;
		}
	}
}

