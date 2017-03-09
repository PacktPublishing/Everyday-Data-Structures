//
//  EDSPlaylistSet.m
//  EverydayDataStructures
//
//  Created by William Smith on 9/12/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSPlaylistSet.h"
#import "EDSSong.h"

@interface EDSPlaylistSet()
{
    NSMutableSet<EDSSong*>* _songs;
    NSInteger _capacity;
    BOOL _premiumUser;
    BOOL _isEmpty;
    BOOL _isFull;
}
@end

@implementation EDSPlaylistSet

-(instancetype)playlistSetWithPremiumUser:(BOOL)isPremiumUser
                              andCapacity:(NSInteger)capacity
{
    if (self == [super init])
    {
        _songs = [NSMutableSet set];
        _premiumUser = isPremiumUser;
        _capacity = capacity;
        
        CGPoint p = CGPointMake(9.0, 5.2);
        p.x = 9.8;
        p.y = 5.5;
    }
    return self;
}

-(BOOL)isEmpty
{
    return [_songs count] == 0;
}

-(BOOL)isFull
{
    if (_premiumUser)
    {
        return NO;
    }
    else
    {
        return [_songs count] == _capacity;
    }
}

-(BOOL)addSong:(EDSSong*)song
{
    if (!_isFull && ![_songs containsObject:song])
    {
        [_songs addObject:song];
        return YES;
    }
    return NO;
}

-(BOOL)removeSong:(EDSSong*)song
{
    if ([_songs containsObject:song])
    {
        [_songs removeObject:song];
        return YES;
        
    }
    else
    {
        return NO;
    }
}

-(void)mergeWithPlaylist:(NSMutableSet<EDSSong*>*)playlist
{
    [_songs unionSet:playlist];
}

-(NSMutableSet<EDSSong*>*)findSharedSongsInPlaylist:(NSMutableSet<EDSSong*>*)playlist
{
    NSMutableSet *songsCopy = [NSMutableSet setWithSet:_songs];
    [songsCopy intersectSet:playlist];
    return songsCopy;
}

-(NSMutableSet<EDSSong*>*)findUniqueSongs:(NSMutableSet<EDSSong*>*)playlist
{
    NSMutableSet *songsCopy = [NSMutableSet setWithSet:_songs];
    [songsCopy minusSet:playlist];
    return songsCopy;
}

-(BOOL)isSubset:(NSMutableSet<EDSSong*>*)playlist
{
    return [_songs isSubsetOfSet:playlist];
}

-(BOOL)isSuperset:(NSMutableSet<EDSSong*>*)playlist
{
    return [playlist isSubsetOfSet:_songs];
}

-(NSInteger)totalSongs
{
    return [_songs count];
}

@end
