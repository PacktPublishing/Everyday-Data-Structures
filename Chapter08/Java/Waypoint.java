package main.java;

/**
 * Created by William Smith on 8/25/16.
 */
public class Waypoint {

    int lat;
    int lon;
    boolean active;

    public Waypoint(int latitude, int longitude)
    {
        this.lat = latitude;
        this.lon = longitude;
        this.active = true;
    }

    public boolean getActive()
    {
        return this.active;
    }

    public void DeactivateWaypoint()
    {
        this.active = false;
    }

    public void ReactivateWaypoint()
    {
        this.active = true;
    }
}
