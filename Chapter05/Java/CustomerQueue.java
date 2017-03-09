package main.java;

import java.util.ArrayDeque;

/**
 * Created by Will Smith on 8/31/16.
 */
public class CustomerQueue {
    ArrayDeque<Customer> _custQueue;
    int _cap;

    public CustomerQueue(int capacity)
    {
        _custQueue = new ArrayDeque<Customer>();
        _cap = capacity;
    }

    private boolean canCheckinCustomer()
    {
        return this._custQueue.size() < this._cap;
    }

    public void customerCheckin(Customer c)
    {
        if (this.canCheckinCustomer())
        {
            this._custQueue.addLast(c);
        }
    }

    public Customer customerConsultation()
    {
        return this._custQueue.peek();
    }

    public void customerCheckout()
    {
        this._custQueue.removeFirst();
    }

    public void clearCustomers()
    {
        this._custQueue.clear();
    }

    public void customerCancel(Customer c)
    {
        this._custQueue.remove(c);
    }

    public int customerPosition(Customer c)
    {
        if (this._custQueue.contains(c))
        {
            int i = 0;
            for (Customer cust : this._custQueue)
            {
                if (cust.equals(c))
                {
                    return i;
                }
                i++;
            }
        }

        return -1;
    }

    public int customersInLine()
    {
        return this._custQueue.size();
    }

    public boolean isLineEmpty()
    {
        return this._custQueue.size() == 0;
    }

    public boolean isLineFull()
    {
        return this._custQueue.size() == this._cap;
    }
}
