//
//  EDSPlaylistSet.h
//  EverydayDataStructures
//
//  Created by William Smith on 9/12/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EDSSong;

@interface EDSPlaylistSet : NSObject

@property (readonly) BOOL premiumUser;
@property (readonly) BOOL isEmpty;
@property (readonly) BOOL isFull;

-(instancetype)playlistSetWithPremiumUser:(BOOL)isPremiumUser
                              andCapacity:(NSInteger)capacity;

-(BOOL)addSong:(EDSSong*)song;
-(BOOL)removeSong:(EDSSong*)song;
-(void)mergeWithPlaylist:(NSMutableSet<EDSSong*>*)playlist;
-(NSMutableSet<EDSSong*>*)findSharedSongsInPlaylist:(NSMutableSet<EDSSong*>*)playlist;
-(NSMutableSet<EDSSong*>*)findUniqueSongs:(NSMutableSet<EDSSong*>*)playlist;
-(BOOL)isSubset:(NSMutableSet<EDSSong*>*)playlist;
-(BOOL)isSuperset:(NSMutableSet<EDSSong*>*)playlist;
-(NSInteger)totalSongs;

@end
