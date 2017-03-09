//
//  EDSCommandStack.m
//  EverydayDataStructures
//
//  Created by William Smith on 8/28/16.
//  Copyright © 2016 Websmiths, LLC. All rights reserved.
//

#import "EDSCommandStack.h"
#import "EDSCommand.h"

@interface EDSCommandStack()
{
    NSMutableArray<EDSCommand*> *_commandStack;
    NSInteger _capacity;
}

@end

@implementation EDSCommandStack

-(instancetype)initWithCommandCapacity:(NSInteger)commandCapacity
{
    if (self = [super init])
    {
        _commandStack = [NSMutableArray array];
        _capacity = commandCapacity;
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
    bool inserted = YES;
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
