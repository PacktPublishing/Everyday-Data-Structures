package main.java;

import java.util.EmptyStackException;
import java.util.Stack;
import java.util.List;


/**
 * Created by William Smith on 8/28/16.
 */

public class CommandStack {
    private Stack<Command> _commandStack;
    public Stack<Command> GetCommandStack()
    {
        return this._commandStack;
    }

    int _capacity;

    public CommandStack(int commandCapacity)
    {
        this._commandStack = new Stack<Command>();
        this._capacity = commandCapacity;
    }

    public boolean isFull()
    {
        return this._commandStack.size() >= this._capacity;
    }

    public boolean isEmpty()
    {
        return this._commandStack.empty();
    }

    public boolean performCommand(Command command)
    {
        if (!this.isFull())
        {
            this._commandStack.push(command);
            return true;
        }
        return false;
    }

    public boolean performCommands(List<Command> commands)
    {
        boolean inserted = true;
        for (Command c : commands)
        {
            inserted = this.performCommand(c);
        }
        return inserted;
    }

    public Command UndoCommand()
    {
        return this._commandStack.pop();
    }

    public void reset()
    {
        this._commandStack.removeAllElements();
    }

    public int totalCommands()
    {
        return this._commandStack.size();
    }
}
