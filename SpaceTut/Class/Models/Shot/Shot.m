//
//  Shot.m
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 23/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "Shot.h"
#import "Define.h"

@implementation Shot

-(id)initWithAnimationAndPosition : (NSArray *)frames : (CGPoint)position
{
    self = [super init];
    
    if(self)
    {
       
        self.position = position;
        self.size = CGSizeMake(40, 18);
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        self.physicsBody.density = 0.1f;
        self.physicsBody.categoryBitMask = tiroAzul;
        self.physicsBody.contactTestBitMask = inimigo;
        self.physicsBody.collisionBitMask = inimigo;
        self.name = @"tiro";
        self.physicsBody.dynamic = YES;
        SKAction *cu = [SKAction animateWithTextures:frames timePerFrame:0.2f];
        [self runAction:[SKAction repeatActionForever:cu]];

    }
    
    return self;
}

@end
