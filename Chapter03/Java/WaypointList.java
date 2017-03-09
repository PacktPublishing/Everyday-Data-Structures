package main.java;

import java.util.List;
import java.util.LinkedList;

/**
 * Created by William Smith on 8/25/16.
 */
public class WaypointList
{
    LinkedList<Waypoint> route;
    Waypoint current;

    public WaypointList()
    {
        this.route = new LinkedList<Waypoint>();
    }

    public void AddWaypoints(List<Waypoint> waypoints)
    {
        this.route.addAll(waypoints);
    }

    public boolean RemoveWaypoint(Waypoint waypoint)
    {
        return this.route.remove(waypoint);
    }

    public void InsertWaypointsBefore(List<Waypoint> waypoints, Waypoint before)
    {
        int index = this.route.indexOf(before);
        if (index >= 0)
        {
            this.route.addAll(index, waypoints);
        }
        else
        {
            this.AddWaypoints(waypoints);
        }
    }

    public boolean StartRoute()
    {
        if (this.route.size() > 1)
        {
            this.current = this.StartingLine();
            return this.MoveToNextWaypoint();
        }
        return false;
    }

    public boolean MoveToNextWaypoint()
    {
        if (this.current != null)
        {
            this.current.DeactivateWaypoint();
            if (this.current != this.FinishLine())
            {
                int index = this.route.indexOf(this.current);
                this.current = this.route.listIterator(index).next();
                return true;
            }
            return false;
        }
        return false;
    }

    public boolean MoveToPreviousWaypoint()
    {
        if (this.current != null &&
            this.current != this.StartingLine())
        {
            int index = this.route.indexOf(this.current);
            this.current = this.route.listIterator(index).previous();
            this.current.ReactivateWaypoint();
            return true;
        }
        return false;
    }

    public Waypoint StartingLine()
    {
        return this.route.getFirst();
    }

    public Waypoint FinishLine()
    {
        return this.route.getLast();
    }

    public Waypoint CurrentWaypoint()
    {
        return this.current;
    }
}
