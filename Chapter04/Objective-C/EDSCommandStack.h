//
//  EDSCommandStack.h
//  EverydayDataStructures
//
//  Created by William Smith on 8/28/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EDSCommand;

@interface EDSCommandStack() 
{ 
    NSMutableArray<EDSCommand*> *_commandStack; 
    NSInteger _capacity; 
} 

@property (nonatomic,readonly) NSMutableArray *commandStack;

-(instancetype)initWithCommandCapacity:(NSInteger)commandCapacity 
{ 
    if (self = [super init]) 
    { 
        _commandStack = [NSMutableArray array]; 
        _capacity = capacity; 
    } 
    return self; 
} 

-(BOOL)isFull 
{ 
    return [_commandStack count] >= _capacity; 
} 
 
-(BOOL)isEmpty 
{ 
    return [_commandStack count] == 0; 
} 

-(BOOL)performCommand:(EDSCommand*)command 
{ 
	if (![self isFull]) 
	{ 
		[_commandStack addObject:command]; 
		return YES;
	} 
	return NO; 
}

-(BOOL)performCommands:(NSArray<EDSCommand*> *)commands 
{ 
    bool inserted = true; 
    for (EDSCommand *c in commands) { 
        inserted =  [self performCommand:c]; 
    } 
    return inserted; 
} 

-(EDSCommand*)undoCommand 
{ 
	EDSCommand *c = [_commandStack lastObject]; 
	[_commandStack removeLastObject]; 
	return c; 
} 

-(void)reset 
{ 
    [_commandStack removeAllObjects]; 
} 
 
-(NSInteger)totalCommands 
{ 
    return [_commandStack count]; 
} 

@end
