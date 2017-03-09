package main.java;

import java.util.LinkedList;

/**
 * Created by William Smith on 10/14/16.
 */
public class GraphNode
{
    public int Value;

    private LinkedList<GraphNode> _neighbors;
    public LinkedList<GraphNode> GetNeighbors()
    {
        return _neighbors;
    }

    public GraphNode()
    {
        _neighbors = new LinkedList<GraphNode>();
    }

    public GraphNode(int value)
    {
        _neighbors = new LinkedList<GraphNode>();
        Value = value;
    }
}
