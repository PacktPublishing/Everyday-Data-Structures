using System;
using System.Collections.Generic;

namespace EverydayDataStructures
{
	public class WaypointList
	{
		LinkedList<Waypoint> route;
		LinkedListNode<Waypoint> current;

		public WaypointList()
		{
			this.route = new LinkedList<Waypoint>();
		}

		public void AddWaypoints(List<Waypoint> waypoints)
		{
			foreach (Waypoint w in waypoints)
			{
				this.route.AddLast(w);
			}
		}

		public bool RemoveWaypoint(Waypoint waypoint)
		{
			return this.route.Remove(waypoint);
		}

		public void InsertWaypointsBefore(List<Waypoint> waypoints, Waypoint before)
		{
			LinkedListNode<Waypoint> node = this.route.Find(before);
			if (node != null)
			{
				foreach (Waypoint w in waypoints)
				{
					this.route.AddBefore(node, w);
				}
			}
			else
			{
				this.AddWaypoints(waypoints);
			}
		}

		public bool StartRoute()
		{
			if (this.route.Count > 1)
			{
				this.current = this.StartingLine();
				return this.MoveToNextWaypoint();
			}
			return false;
		}

		public bool MoveToNextWaypoint()
		{
			if (this.current != null)
			{
				this.current.Value.DeactivateWaypoint();
				if (this.current != this.FinishLine())
				{
					this.current = this.current.Next;
					return true;
				}
				return false;
			}
			return false;
		}

		public bool MoveToPreviousWaypoint()
		{
			if (this.current != null && 
			    this.current != this.StartingLine())
			{
				this.current = this.current.Previous;
				this.current.Value.ReactivateWaypoint();
				return true;
			}
			return false;
		}

		public LinkedListNode<Waypoint> StartingLine()
		{
			return this.route.First;
		}

		public LinkedListNode<Waypoint> FinishLine()
		{
			return this.route.Last;
		}

		public LinkedListNode<Waypoint> CurrentWaypoint()
		{
			return this.current;
		}
	}
}

