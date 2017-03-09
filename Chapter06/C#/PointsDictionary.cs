using System;
using System.Collections.Generic;

namespace EverydayDataStructures
{
	public class PointsDictionary
	{
		Dictionary<string, int> _points;

		public PointsDictionary()
		{
			_points = new Dictionary<string, int>();
		}

		//This method accepts negative values
		private int UpdateCustomerPoints(string customerName, int points)
		{
			if (this.CustomerExists(customerName))
			{
				_points[customerName] = _points[customerName] += points;
				return _points[customerName];
			}
			return 0;
		}

		//Add
		public void RegisterCustomer(string customerName)
		{
			this.RegisterCustomer(customerName, 0);
		}

		public void RegisterCustomer(string customerName, int previousBalance)
		{
			_points.Add(customerName, previousBalance);
		}

		//Get
		//We use this method because it uses TryGetValue to avoid exceptions
		public int GetCustomerPoints(string customerName)
		{
			int points;
			//This returns bool if for whetehr it finds the key
			//if it does find it, it sets the out property
			//We don't care about the bool value, just the points
			//Our customers eithe rhave points or not
			_points.TryGetValue(customerName, out points);

			return points;
		}

		//Update
		public int AddCustomerPoints(string customerName, int points)
		{
			return this.UpdateCustomerPoints(customerName, points);
		}

		public int RemoveCustomerPoints(string customerName, int points)
		{
			return this.UpdateCustomerPoints(customerName, -points);
		}

		public int RedeemCustomerPoints(string customerName, int points)
		{
			return this.UpdateCustomerPoints(customerName, -points);
		}

		//Remove
		public int CustomerCheckout(string customerName)
		{
			int points = this.GetCustomerPoints(customerName);
			_points.Remove(customerName);
			return points;
		}

		//Contains
		public bool CustomerExists(string customerName)
		{
			return _points.ContainsKey(customerName);
		}

		//Count
		public int CustomersOnPremises()
		{
			return _points.Count;
		}

		//Clear
		public void ClosingTime()
		{
			//Perform accounting actions
			_points.Clear();
		}
	}
}

