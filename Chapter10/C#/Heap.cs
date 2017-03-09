using System;
using System.Collections.Generic;

namespace EverydayDataStructures
{
	public class HeapNode
	{
		public int Data;
	}

	public class MinHeap
	{
		List<HeapNode> elements;

		public int Count
		{
			get
			{
				return elements.Count;
			}
		}

		public MinHeap()
		{
			elements = new List<HeapNode>();
		}

		public void Insert(HeapNode item)
		{
			elements.Add(item);
			OrderHeap();
		}

		public void Delete(HeapNode item)
		{
			int i = elements.IndexOf(item);
			int last = elements.Count - 1;

			elements[i] = elements[last];
			elements.RemoveAt(last);
			OrderHeap();
		}

		public HeapNode ExtractMin() //Pop
		{
			if (elements.Count > 0)
			{
				HeapNode item = elements[0];
				Delete(item);
				return item;
			}

			return null;
		}

		public HeapNode FindMin() //Peek
		{
			if (elements.Count > 0)
			{
				return elements[0];
			}

			return null;
		}

		private void OrderHeap()
		{
			for (int i = elements.Count - 1; i > 0; i--)
			{
				int parentPosition = (i - 1) / 2;

				if (elements[parentPosition].Data > elements[i].Data)
				{
					SwapElements(parentPosition, i);
				}
			}
		}

		private void SwapElements(int firstIndex, int secondIndex)
		{
			HeapNode tmp = elements[firstIndex];
			elements[firstIndex] = elements[secondIndex];
			elements[secondIndex] = tmp;
		}

		public List<HeapNode> GetChildren(int parentIndex)
		{
			if (parentIndex >= 0)
			{
				List<HeapNode> children = new List<HeapNode>();
				int childIndexOne = (2 * parentIndex) + 1;
				int childIndexTwo = (2 * parentIndex) + 2;
				children.Add(elements[childIndexOne]);
				children.Add(elements[childIndexTwo]);

				return children;
			}

			return null;
		}

		public HeapNode GetParent(int childIndex)
		{
			if (childIndex > 0 && elements.Count > childIndex)
			{
				int parentIndex = (childIndex - 1) / 2;
				return elements[parentIndex];
			}

			return null;
		}

	}
}
