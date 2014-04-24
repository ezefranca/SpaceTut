//
//  Colision.m
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 23/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "Colision.h"
#import "Explosion.h"
#import "gameScene.h"
#import "Tut.h"
#import "Enemy.h"

@implementation Colision

+(void)check : (SKNode*)bodyA : (SKNode*)bodyB : (gameScene *)Scene
{
    
    if ([bodyA.name isEqualToString:@"tut"]) {
      
        Tut *t = (Tut*)bodyA;
        t.life = t.life - 1;
        
        SKAction *cu = [SKAction animateWithTextures:@[[SKTexture textureWithImageNamed:@"2"], [SKTexture textureWithImageNamed:@"tut"] ] timePerFrame:0.15f];
        [t runAction:[SKAction repeatAction:cu count:1]];

        
        NSLog(@"%i" , t.life);
        if(![Tut checkLife:t])
        {
            SKSpriteNode *explosao = [[Explosion alloc]initWithAnimationAndPosition:Scene.explosaoFrameVerde :CGPointMake(bodyA.position.x , bodyA.position.y ) : CGSizeMake(150, 150)];
            [Scene addChild:explosao];
            [t removeFromParent];
            [Scene.FireParticle removeFromParent];
        }
    }
    
    if ([bodyA.name isEqualToString:@"tiro"]) {
        

        SKSpriteNode *explosao = [[Explosion alloc]initWithAnimationAndPosition:Scene.explosaoFrame :CGPointMake(bodyA.position.x + 30, bodyA.position.y ) : CGSizeMake(50, 50)];
        [Scene addChild:explosao];
        [bodyA removeFromParent];

        //checar inimigo basico
        if ([bodyB class] == [Enemy class]) {
            Enemy *e = (Enemy *)bodyB;
            e.life = e.life - 1;
            [Enemy checkLife:e];
        }
        //checar BOSS
        
        
        //matar
        
    }
}

@end
