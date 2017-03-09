package main.java;

import java.util.HashMap;

/**
 * Created by William Smith on 9/7/16.
 */
public class PointsDictionary {
    HashMap<String, Integer> _points;

    public PointsDictionary()
    {
        _points = new HashMap<>();
    }

    //This method accepts negative values
    private Integer UpdateCustomerPoints(String customerName, int points)
    {
        if (this.CustomerExists(customerName))
        {
            _points.put(customerName, _points.get(customerName) + points);
            return _points.get(customerName);
        }

        return 0;
    }

    //Add
    public void RegisterCustomer(String customerName)
    {
        this.RegisterCustomer(customerName, 0);
    }

    public void RegisterCustomer(String customerName, int previousBalance)
    {
        _points.put(customerName, previousBalance);
    }

    //Get
    public Integer GetCustomerPoints(String customerName)
    {
        return _points.get(customerName) == null ? 0 : _points.get(customerName);
    }

    //Update
    public Integer AddCustomerPoints(String customerName, int points)
    {
        return this.UpdateCustomerPoints(customerName, points);
    }

    public Integer RemoveCustomerPoints(String customerName, int points)
    {
        return this.UpdateCustomerPoints(customerName, -points);
    }

    public Integer RedeemCustomerPoints(String customerName, int points)
    {
        return this.UpdateCustomerPoints(customerName, -points);
    }

    //Remove
    public Integer CustomerCheckout(String customerName)
    {
        Integer points = this.GetCustomerPoints(customerName);
        _points.remove(customerName);
        return points;
    }

    //Contains
    public boolean CustomerExists(String customerName)
    {
        return _points.containsKey(customerName);
    }

    //Count
    public int CustomersOnPremises()
    {
        return _points.size();
    }

    //Clear
    public void ClosingTime()
    {
        //Perform accounting actions
        _points.clear();
    }
}
