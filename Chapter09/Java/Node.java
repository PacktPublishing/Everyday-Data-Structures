package main.java;

import java.util.List;
import java.util.LinkedList;

/**
 * Created by William Smith on 9/24/16.
 */
public class Node {
    public int Data;
    public Node Left;
    public Node Right;

    public List<Node> getChildren()
    {
        List<Node> children = new LinkedList<Node>();
        if (this.Left != null)
        {
            children.add(this.Left);
        }
        if (this.Right != null)
        {
            children.add(this.Right);
        }
        return children;
    }

    public Node(int data)
    {
        this.Data = data;
    }

    public boolean insertData(int data)
    {
        Node node = new Node (data);
        return this.insertNode(node);
    }

    public boolean insertNode(Node node)
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
                return this.Left.insertNode(node);
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
                return this.Right.insertNode(node);
            }
        }
    }

    public boolean graft(Node node)
    {
        if (node == null)
        {
            return false;
        }

        List<Node> nodes = node.listTree();
        for (Node n : nodes)
        {
            this.insertNode(n);
        }

        return true;
    }

    public Node removeData(int data)
    {
        Node node = new Node(data);
        return this.removeNode(node);
    }

    public Node removeNode(Node node)
    {
        if (node == null)
        {
            return null;
        }

        Node retNode;
        Node modNode;
        List<Node> treeList = new LinkedList<Node>();

        if (this.Data == node.Data)
        {
            //Root match
            retNode = new Node(this.Data);
            modNode = this;
            if (this.getChildren().size() == 0)
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
            for (Node child : this.getChildren())
            {
                if (child.removeNode(node) != null)
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
            treeList.addAll(modNode.Left.listTree());
            modNode.Left = null;
        }
        else if (modNode.Right != null)
        {
            modNode.Data = modNode.Right.Data;
            treeList.addAll(modNode.Right.listTree());
            modNode.Right = null;
        }
        else
        {
            modNode = null;
        }

        for (Node n : treeList)
        {
            modNode.insertNode(n);
        }

        //Finished
        return retNode;
    }

    public Node prune(Node root)
    {
        if (root == null)
        {
            return null;
        }

        Node matchNode;
        if (this.Data == root.Data)
        {
            //Root match
            Node b = this.copyTree();
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
            for (Node child : this.getChildren())
            {
                if (child.prune(root) != null)
                {
                    return child;
                }
            }

            //No match in tree
            return null;
        }

        Node branch = matchNode.copyTree();
        matchNode = null;

        return branch;
    }

    public Node findData(int data)
    {
        Node node = new Node (data);
        return this.findNode(node);
    }

    public Node findNode(Node node)
    {
        if (node.Data == this.Data)
        {
            return this;
        }

        for (Node child : this.getChildren())
        {
            Node result = child.findNode(node);
            if (result != null)
            {
                return result;
            }
        }

        return null;
    }

    public Node copyTree()
    {
        Node n = new Node(this.Data);
        if (this.Left != null)
        {
            n.Left = this.Left.copyTree();
        }

        if(this.Right != null)
        {
            n.Right = this.Right.copyTree();
        }
        return n;
    }

    public List<Node> listTree() {
        List<Node> result = new LinkedList<Node>();
        result.add(new Node(this.Data));
        for (Node child : this.getChildren())
        {
            result.addAll(child.listTree());
        }
        return result;
    }
}
