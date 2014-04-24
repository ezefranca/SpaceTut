//
//  Enemy.m
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 23/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "Enemy.h"
#import "Define.h"

@implementation Enemy

-(id)initWithAnimationAndPosition : (NSArray *)frames
{
    self = [super init];
    
    if (self) {
        
        self.size = CGSizeMake(50, 50);
        SKAction *cu = [SKAction animateWithTextures:frames timePerFrame:0.2f];
        [self runAction:[SKAction repeatActionForever:cu]];
        self.scale = 0.6;
        self.position = CGPointMake(100, 100);
        self.zPosition = 1;
        self.name = @"enemyJelly";
        self.physicsBody.dynamic = YES;
        self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
        self.physicsBody.categoryBitMask = inimigo;
        self.physicsBody.contactTestBitMask = tartaruga | borda | tiroAzul;
        self.physicsBody.collisionBitMask = tartaruga | borda | tiroAzul;
        self.life = 1;

    }
    
    return self;
}

+(void)checkLife : (Enemy *)e
{
    if (e.life == 0) {
        [e removeFromParent];
    }
}


@end
