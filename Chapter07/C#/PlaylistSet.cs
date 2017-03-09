using System;
using System.Collections.Generic;

namespace EverydayDataStructures
{
	public class PlaylistSet
	{
		HashSet<Song> _songs;

		public Int16 capacity { get; private set; }
		public bool premiumUser { get; private set; }
		public bool isEmpty 
		{
			get
			{
				return _songs.Count == 0;
			}
		}

		public bool isFull
		{
			get
			{
				if (this.premiumUser == true)
				{
					return false;
				}
				else
				{
					return _songs.Count == this.capacity;
				}
			}
		}

		public PlaylistSet(bool premiumUser, Int16 capacity)
		{
			_songs = new HashSet<Song>();
			this.premiumUser = premiumUser;
			this.capacity = capacity;
		}

		public bool AddSong(Song song)
		{
			if (!this.isFull)
			{
				return _songs.Add(song);
			}
			return false;
		}

		public bool RemoveSong(Song song)
		{
			return _songs.Remove(song);
		}

		public void MergeWithPlaylist(HashSet<Song> playlist)
		{
			_songs.UnionWith(playlist);
		}

		public HashSet<Song> FindSharedSongsInPlaylist(HashSet<Song> playlist)
		{
			HashSet<Song> songsCopy = new HashSet<Song>(_songs);
			songsCopy.IntersectWith(playlist);
			return songsCopy;
		}

		public HashSet<Song> FindUniqueSongs(HashSet<Song> playlist)
		{
			HashSet<Song> songsCopy = new HashSet<Song>(_songs);
			songsCopy.ExceptWith(playlist);
			return songsCopy;
		}

		public bool IsSubset(HashSet<Song> playlist)
		{
			return _songs.IsSubsetOf(playlist);
		}

		public bool IsSuperset(HashSet<Song> playlist)
		{
			return _songs.IsSupersetOf(playlist);
		}

		public int TotalSongs()
		{
			return _songs.Count;
		}
	}
}

