//
//  Player.m
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 24/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "Player.h"

@implementation Player

+(Player *) sharedStore
{
    static Player *sharedStore = nil;
    
    if(!sharedStore)
    {
        sharedStore = [[super allocWithZone:nil] init];
        
    }
    
    return sharedStore;
}

+(id) allocWithZone: (struct _NSZone *) zone
{
    return [self sharedStore];
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        if (!self.nome)
        {
            self.nome = [[NSString alloc]init];
        }
    }
    
    return self;
}

@end
