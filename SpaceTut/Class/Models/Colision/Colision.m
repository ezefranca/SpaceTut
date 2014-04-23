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
#import "Enemy.h"

@implementation Colision

+(void)check : (SKNode*)bodyA : (SKNode*)bodyB : (gameScene *)Scene
{
    
    if ([bodyA.name isEqualToString:@"tiro"]) {
        
        SKSpriteNode *explosao = [[Explosion alloc]initWithAnimationAndPosition:Scene.explosaoFrame :CGPointMake(bodyA.position.x + 30, bodyA.position.y )];
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
    
    
    if ([bodyB.name isEqualToString:@"tiro"]) {
        
        SKSpriteNode *explosao = [[Explosion alloc]initWithAnimationAndPosition:Scene.explosaoFrame :CGPointMake(bodyB.position.x + 30, bodyB.position.y )];
        [Scene addChild:explosao];
        [bodyB removeFromParent];
       
        //checar inimigo basico
        if ([bodyA class] == [Enemy class]) {
            Enemy *e = (Enemy *)bodyA;
            e.life = e.life - 1;
            [Enemy checkLife:e];
        }
        
        //checar boss
        
        
        //matar
        
    }

}

@end
