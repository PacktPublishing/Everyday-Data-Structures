using System;
using System.Collections.Generic;

namespace EverydayDataStructures
{
	public class Graph
	{
		private List<GraphNode> _nodes;
		public List<GraphNode> Nodes
		{
			get
			{
				return _nodes;
			}
		}

		public Graph(List<GraphNode> nodes)
		{
			if (nodes == null)
			{
				_nodes = new List<GraphNode>();
			}
			else
			{
				_nodes = nodes;
			}
		}

		public void AddNode(GraphNode node)
		{
			_nodes.Add(node);
		}

		public void AddNodeForValue(Int16 value)
		{
			// adds a node to the graph
			_nodes.Add(new GraphNode(value));
		}

		public bool RemoveNode(Int16 value)
		{
			// first remove the node from the nodeset
			GraphNode nodeToRemove = _nodes.Find(n => n.Value == value);
			if (nodeToRemove == null)
			{
				return false;
			}

			// otherwise, the node was found
			_nodes.Remove(nodeToRemove);

			// enumerate through each node in the nodeSet, removing edges to this node
			foreach (GraphNode node in _nodes)
			{
				int index = node.Neighbors.IndexOf(nodeToRemove);
				if (index != -1)
				{
					// remove the reference to the node and associated cost
					node.Neighbors.RemoveAt(index);
				}
			}

			return true;
		}


		public void AddEdge(GraphNode from, GraphNode to)
		{
			from.Neighbors.Add(to);
		}

		public void AddBidirectedEdge(GraphNode from, GraphNode to)
		{
			from.Neighbors.Add(to);
			to.Neighbors.Add(from);
		}

		public bool Adjacent(GraphNode from, GraphNode to)
		{
			return from.Neighbors.Contains(to);
		}

		public List<GraphNode> Neighbors(Int16 value)
		{

			GraphNode node = _nodes.Find(n => n.Value == value);
			if (node == null)
			{
				return null;
			}
			else
			{
				return node.Neighbors;
			}
		}

		public int Count
		{
			get 
			{ 
				return _nodes.Count; 
			}
		}
	}
}
