package main.java;

/**
 * Created by William Smith on 10/31/16.
 */
public class ArraySearchAlgorithms
{
    //Linear Search
    public int linearSearchIndex(int[] values, int key)
    {
        for (int i = 0; i < values.length - 1; i++)
        {
            if (values[i] == key)
            {
                return i;
            }
        }

        return -1;
    }

    public Customer linearSearchCustomer(Customer[] customers, int custId)
    {
        for (int i = 0; i < customers.length - 1; i++)
        {
            if (customers[i].customerId == custId)
            {
                return customers[i];
            }
        }

        return null;
    }

    //Binary Search
    public int binarySearch(int[] values, int left, int right, int key)
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
                return binarySearch(values, left, mid - 1, key);
            }

            return binarySearch(values, mid + 1, right, key);
        }

        return -1;
    }

    //Jump Search
    public int jumpSearch(int[] values, int key)
    {
        int n = values.length;
        int step = (int)Math.sqrt(n);
        int prev = 0;

        while (values[Math.min(step, n) - 1] < key)
        {
            prev = step;
            step += (int)Math.floor(Math.sqrt(n));
            if (prev >= n)
            {
                return -1;
            }
        }

        while (values[prev] < key)
        {
            prev++;
            if (prev == Math.min(step, n))
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
