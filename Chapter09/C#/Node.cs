using System;
using System.Collections.Generic;
            
namespace EverydayDataStructures
{
	public class Node
	{
		public Int16 Data;
		public Node Left;
		public Node Right;
		public List<Node> Children
		{
			get
			{
				List<Node> children = new List<Node>();
				if (this.Left != null) 
				{
					children.Add (this.Left);
				}
				if (this.Right != null) 
				{
					children.Add (this.Right);
				}
				return children;
			}
		}

		public Node(Int16 data)
		{
			this.Data = data;
		}

		public bool InsertData(Int16 data)
		{
			Node node = new Node (data);
			return this.InsertNode(node);
		}

		public bool InsertNode(Node node)
		{
			if (node == null || node.Data == this.Data)
			{
				return false;
			}
			else if (node.Data < this.Data) 
			{
				if (this.Left == null) 
				{
					this.Left = node;
					return true;
				} 
				else 
				{
					return this.Left.InsertNode(node);
				}
			}
			else
			{
				if (this.Right == null) 
				{
					this.Right = node;
					return true;
				} 
				else 
				{
					return this.Right.InsertNode(node);
				}
			}
		}

		public bool Graft(Node node)
		{
			if (node == null) 
			{
				return false;
			}

			List<Node> nodes = node.ListTree();
			foreach (Node n in nodes) 
			{
				this.InsertNode(n);
			}

			return true;
		}

		public Node RemoveData(Int16 data)
		{
			Node node = new Node (data);
			return this.RemoveNode (node);
		}

		public Node RemoveNode(Node node)
		{
			if (node == null)
			{
				return null;
			}

			Node retNode;
			Node modNode;
			List<Node> treeList = new List<Node>();

			if (this.Data == node.Data)
			{
				//Root match
				retNode = new Node(this.Data);
				modNode = this;
				if (this.Children.Count == 0) 
				{
					return this; //Root has no childen
				}
			}
			else if (this.Left.Data == node.Data) 
			{
				//Match found
				retNode = new Node(this.Left.Data);
				modNode = this.Left;
			} 
			else if (this.Right.Data == node.Data)
			{
				//Match found
				retNode = new Node(this.Right.Data);
				modNode = this.Right;
			}
			else 
			{
				foreach (Node child in this.Children) 
				{
					if (child.RemoveNode(node) != null) 
					{
						return child;
					}
				}

				//No match in tree
				return null; 
			}

			//Reorder the tree
			if (modNode.Left != null) 
			{
				modNode.Data = modNode.Left.Data;
				treeList.AddRange (modNode.Left.ListTree ());
				modNode.Left = null;
			} 
			else if (modNode.Right != null) 
			{
				modNode.Data = modNode.Right.Data;
				treeList.AddRange (modNode.Right.ListTree ());
				modNode.Right = null;
			} 
			else 
			{
				modNode = null;
			}

			foreach (Node n in treeList) 
			{
				modNode.InsertNode(n);
			}

			//Finished
			return retNode;
		}

		public Node Prune(Node root)
		{
			if (root == null)
			{
				return null;
			}

			Node matchNode;
			if (this.Data == root.Data)
			{
				//Root match
				Node b = this.CopyTree();
				this.Left = null;
				this.Right = null;
				return b;
			}
			else if (this.Left.Data == root.Data) 
			{
				matchNode = this.Left;
			} 
			else if (this.Right.Data == root.Data)
			{
				matchNode = this.Right;
			}
			else 
			{
				foreach (Node child in this.Children) 
				{
					if (child.Prune(root) != null) 
					{
						return child;
					}
				}

				//No match in tree
				return null; 
			}

			Node branch = matchNode.CopyTree();
			matchNode = null;

			return branch;
		}

		public Node FindData(Int16 data)
		{
			Node node = new Node (data);
			return this.FindNode(node);
		}

		public Node FindNode(Node node)
		{
			if (node.Data == this.Data) 
			{
				return this;
			}

			foreach (Node child in this.Children) 
			{ 
				Node result = child.FindNode(node);
				if (result != null) 
				{
					return result;
				}
			}

			return null;
		}

		public Node CopyTree()
		{
			Node n = new Node(this.Data);
			if (this.Left != null)
			{
				n.Left = this.Left.CopyTree();
			}

			if(this.Right != null)
			{
				n.Right = this.Right.CopyTree();
			}
			return n;
		}
			
		public List<Node> ListTree()
		{
			List<Node> result = new List<Node>();
			result.Add(new Node(this.Data));
			foreach (Node child in this.Children)
			{
				result.AddRange(child.ListTree());
			}
			return result;
		}
	}
}

