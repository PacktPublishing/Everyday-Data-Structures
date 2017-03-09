//
//  PlaylistSet.swift
//  EverydayDataStructures-Swift
//
//  Created by William Smith on 9/12/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

import Foundation

public struct RGBAColor {
    var red = 0
    var green = 0
    var blue = 0
    var alpha = 0.0
    
    public init(R: Int, G: Int, B: Int, A: Double)
    {
        red = R
        green = G
        blue = B
        alpha = A
    }
}

open class PlaylistSet
{
    var _songs: Set<Song> = Set<Song>()
    open fileprivate(set) var _capacity: Int
    open fileprivate(set) var _premiumUser: Bool
    open fileprivate(set) var _isEmpty: Bool
    open fileprivate(set) var _isFull: Bool

    public init (capacity: Int, premiumUser: Bool)
    {
        let color = RGBAColor(R: 139, G:0, B:139, A:0.5)
        
        _capacity = capacity
        _premiumUser = premiumUser
        _isEmpty = true
        _isFull = false
    }

    open func premiumUser() -> Bool
    {
        return _premiumUser
    }

    open func isEmpty() -> Bool
    {
        return _songs.count == 0
    }

    open func isFull() -> Bool
    {
        if (_premiumUser)
        {
            return false
        }
        else
        {
            return _songs.count == _capacity
        }
    }

    open func addSong(_ song: Song) -> Bool
    {
        if (!_isFull && !_songs.contains(song))
        {
            _songs.insert(song)
            return true
        }
        return false
    }

    open func removeSong(_ song: Song) -> Bool
    {
        if (_songs.contains(song))
        {
            _songs.remove(song)
            return true
        }
        else
        {
            return false
        }
    }

    open func mergeWithPlaylist(_ playlist: Set<Song>)
    {
        _songs.formUnion(playlist)
    }

    open func findSharedSongsInPlaylist(_ playlist: Set<Song>) -> Set<Song>
    {
        return _songs.intersection(playlist)
    }

    open func findUniqueSongs(_ playlist: Set<Song>) -> Set<Song>
    {
        return _songs.subtracting(playlist)
    }

    open func isSubset(_ playlist: Set<Song>) -> Bool
    {
        return _songs.isSubset(of: playlist)
    }

    open func isSuperset(_ playlist: Set<Song>) -> Bool
    {
        return _songs.isSuperset(of: playlist)
    }

    open func totalSongs() -> Int
    {
        return _songs.count;
    }
}
