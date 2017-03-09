package main.java;

import java.util.LinkedList;

/**
 * Created by William Smith on 10/14/16.
 */
public class Graph
{
    private LinkedList<GraphNode> _nodes;
    public LinkedList<GraphNode> GetNodes()
    {
        return _nodes;
    }

    public Graph(LinkedList<GraphNode> nodes)
    {
        if (nodes == null)
        {
            _nodes = new LinkedList<GraphNode>();
        }
        else
        {
            _nodes = nodes;
        }
    }

    public void AddNode(GraphNode node)
    {
        _nodes.add(node);
    }

    public void AddNodeForValue(int value)
    {
        _nodes.add(new GraphNode(value));
    }

    public boolean RemoveNode(int value)
    {
        GraphNode nodeToRemove = null;
        for (GraphNode node : _nodes)
        {
            if (node.Value == value)
            {
                nodeToRemove = node;
                break;
            }
        }

        if (nodeToRemove == null)
        {
            return false;
        }

        _nodes.remove(nodeToRemove);

        for (GraphNode node : _nodes)
        {
            int index = node.GetNeighbors().indexOf(nodeToRemove);
            if (index != -1)
            {
                node.GetNeighbors().remove(index);
            }
        }

        return true;
    }


    public void AddEdge(GraphNode from, GraphNode to)
    {
        from.GetNeighbors().add(to);
    }

    public void AddBidirectedEdge(GraphNode from, GraphNode to)
    {
        from.GetNeighbors().add(to);
        to.GetNeighbors().add(from);
    }

    public boolean Adjacent(GraphNode from, GraphNode to)
    {
        return from.GetNeighbors().contains(to);
    }

    public LinkedList<GraphNode> Neighbors(int value)
    {
        GraphNode node = null;
        for (GraphNode n : _nodes)
        {
            if (n.Value == value)
            {
                node = n;
                break;
            }
        }

        if (node == null)
        {
            return null;
        }
        else
        {
            return node.GetNeighbors();
        }
    }

    public int GetCount()
    {
        return _nodes.size();
    }
}
