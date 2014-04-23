//
//  Explosion.m
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 23/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "Explosion.h"

@implementation Explosion

-(id)initWithAnimationAndPosition : (NSArray *)frames : (CGPoint)position
{
    
    self = [super init];
    
    if (self) {
        
        self.size = CGSizeMake(50, 50);
        self.name = @"explosao";
        self.position = position;
        SKAction *cu = [SKAction animateWithTextures:frames timePerFrame:0.02f];
        [self runAction:[SKAction repeatAction:cu count:1]];
    }
    
    return self;
}

@end
