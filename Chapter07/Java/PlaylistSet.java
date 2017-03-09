package main.java;

import java.util.HashSet;

/**
 * Created by William Smith on 9/12/16.
 */
public class PlaylistSet {

    HashSet<Song> _songs;

    public int capacity;
    public boolean premiumUser;
    public boolean isEmpty()
    {
        return _songs.size() == 0;
    }

    public boolean isFull()
    {
        if (this.premiumUser == true)
        {
            return false;
        }
        else {
            return _songs.size() == this.capacity;
        }
    }

    public PlaylistSet(boolean premiumUser, int capacity)
    {
        _songs = new HashSet<>();
        this.premiumUser = premiumUser;
        this.capacity = capacity;
    }

    public boolean addSong(Song song)
    {
        if (!this.isFull())
        {
            return _songs.add(song);
        }
        return false;
    }

    public boolean removeSong(Song song)
    {
        return _songs.remove(song);
    }

    public void mergeWithPlaylist(HashSet<Song> playlist)
    {
        _songs.addAll(playlist);
    }

    public HashSet<Song> findSharedSongsInPlaylist(HashSet<Song> playlist)
    {
        HashSet<Song> songsCopy = new HashSet<>(_songs);
        songsCopy.retainAll(playlist);
        return songsCopy;
    }

    public HashSet<Song> findUniqueSongs(HashSet<Song> playlist)
    {
        HashSet<Song> songsCopy = new HashSet<>(_songs);
        songsCopy.removeAll(playlist);
        return songsCopy;
    }

    public boolean isSubset(HashSet<Song> playlist)
    {
        return _songs.containsAll(playlist);
    }

    public boolean isSuperset(HashSet<Song> playlist)
    {
        return playlist.containsAll(_songs);
    }

    public int totalSongs()
    {
        return _songs.size();
    }
}
