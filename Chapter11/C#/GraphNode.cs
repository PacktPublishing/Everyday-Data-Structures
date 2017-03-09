using System;
using System.Collections.Generic;

namespace EverydayDataStructures
{
	public class GraphNode
	{
		public Int16 Value;

		//private List<GraphNode> _neighbors;
		public List<GraphNode> Neighbors;

		public GraphNode() 
		{
		//	_neighbors = new List<GraphNode>();
		}

		public GraphNode(Int16 value) 
		{
		//	_neighbors = new List<GraphNode>();
			Value = value;
		}

	}
}
