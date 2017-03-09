using System;
using System.Collections.Generic;

namespace EverydayDataStructures
{
	public class CommandStack
	{
		public Stack<Command> _commandStack { get; private set; }
		int _capacity;

		public CommandStack(int commandCapacity)
		{
			this._commandStack = new Stack<Command>(commandCapacity);
			this._capacity = commandCapacity;
		}

		public bool IsFull()
		{
			return this._commandStack.Count >= this._capacity;
		}

		public bool IsEmpty()
		{
			return this._commandStack.Count == 0;
		}

		public bool PerformCommand(Command command)
		{
			if (!this.IsFull())
			{
				this._commandStack.Push(command);
				return true;
			}
			return false;
		}

		public bool PerformCommands(List<Command> commands)
		{
			bool inserted = true;
			foreach (Command c in commands)
			{
				inserted = this.PerformCommand(c);
			}
			return inserted;
		}

		public Command UndoCommand()
		{
			return this._commandStack.Pop();
		}

		public void Reset()
		{
			this._commandStack.Clear();
		}

		public int TotalCommands()
		{
			return this._commandStack.Count;
		}
	}
}

