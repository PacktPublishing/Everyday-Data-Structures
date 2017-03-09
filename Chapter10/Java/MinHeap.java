package main.java;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by William Smith on 10/2/16.
 */
public class MinHeap
{
    List<HeapNode> elements;

    public int size()
    {
        return elements.size();
    }

    public MinHeap()
    {
        elements = new ArrayList<HeapNode>();
    }

    public void insert(HeapNode item)
    {
        elements.add(item);
        orderHeap();
    }

    public void delete(HeapNode item)
    {
        int i = elements.indexOf(item);
        int last = elements.size() - 1;

        elements.set(i, elements.get(last));
        elements.remove(last);
        orderHeap();
    }

    public HeapNode extractMin() //Pop
    {
        if (elements.size() > 0)
        {
            HeapNode item = elements.get(0);
            delete(item);
            return item;
        }

        return null;
    }

    public HeapNode findMin() //Peek
    {
        if (elements.size() > 0)
        {
            return elements.get(0);
        }

        return null;
    }

    private void orderHeap()
    {
        for (int i = elements.size() - 1; i > 0; i--)
        {
            int parentPosition = (i - 1) / 2;

            if (elements.get(parentPosition).Data > elements.get(i).Data)
            {
                swapElements(parentPosition, i);
            }
        }
    }

    private void swapElements(int firstIndex, int secondIndex)
    {
        HeapNode tmp = elements.get(firstIndex);
        elements.set(firstIndex, elements.get(secondIndex));
        elements.set(secondIndex, tmp);
    }

    public List<HeapNode> getChildren(int parentIndex)
    {
        if (parentIndex >= 0)
        {
            ArrayList<HeapNode> children = new ArrayList<HeapNode>();
            int childIndexOne = (2 * parentIndex) + 1;
            int childIndexTwo = (2 * parentIndex) + 2;
            children.add(elements.get(childIndexOne));
            children.add(elements.get(childIndexTwo));

            return children;
        }

        return null;
    }

    public HeapNode getParent(int childIndex)
    {
        if (childIndex > 0 && elements.size() > childIndex)
        {
            int parentIndex = (childIndex - 1) / 2;
            return elements.get(parentIndex);
        }

        return null;
    }

}