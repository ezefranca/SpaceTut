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

-(id)init
{
    self = [super init];
    
    if (self) {
        
        self.batTut = @[[SKTexture textureWithImageNamed:@"2"], [SKTexture textureWithImageNamed:@"tut"] ] ;
        
        self.tutDano = [SKAction animateWithTextures:self.batTut timePerFrame:0.15f];
        
        self.jogador = [[Player alloc]init] ;
        self.jogador.pontuacao = 0;
    }
    
    return self;
}


-(void)check : (SKNode*)bodyA : (SKNode*)bodyB : (gameScene *)Scene
{
    
    if ([bodyA.name isEqualToString:@"tut"]) {
      
        Tut *t = (Tut*)bodyA;
        t.life = t.life - 1;
        
        [t runAction:[SKAction repeatAction:self.tutDano count:1]];

         [bodyB removeFromParent];
        
        if(![Tut checkLife:t])
        {
            SKSpriteNode *explosao = [[Explosion alloc]initWithAnimationAndPosition:Scene.explosaoFrameVerde :CGPointMake(bodyA.position.x , bodyA.position.y ) : CGSizeMake(150, 150)];
            [Scene addChild:explosao];
            [t removeFromParent];
            [Scene.FireParticle removeFromParent];
        }
        
       
    }
    
    if ([bodyA.name isEqualToString:@"tiro"]) {
        SKSpriteNode *explosao;
        
        if ([bodyB.name isEqualToString: @"boss"]) {
             explosao = [[Explosion alloc]initWithAnimationAndPosition:Scene.explosaoFrame :CGPointMake(bodyA.position.x + 30, bodyA.position.y ) : CGSizeMake( 150, 150)];
        }
        else
        {
               explosao = [[Explosion alloc]initWithAnimationAndPosition:Scene.explosaoFrame :CGPointMake(bodyA.position.x + 30, bodyA.position.y ) : CGSizeMake( 50, 50)];
        }
        
        [Scene addChild:explosao];
        [bodyA removeFromParent];

        //checar inimigo basico
        if ([bodyB class] == [Enemy class]) {
            Enemy *e = (Enemy *)bodyB;
            e.life = e.life - 1;
            [Enemy checkLife:e];
            
            self.jogador.pontuacao += 10;
        }
        //checar BOSS
        if ([bodyB.name isEqualToString:@"tut"]) {
            Tut *t = (Tut*)bodyB;
            t.life = t.life - 1;
            
            [t runAction:[SKAction repeatAction:self.tutDano count:1]];
            
            if(![Tut checkLife:t])
            {
                SKSpriteNode *explosao = [[Explosion alloc]initWithAnimationAndPosition:Scene.explosaoFrameVerde :CGPointMake(bodyA.position.x , bodyA.position.y ) : CGSizeMake(150, 150)];
                [Scene addChild:explosao];
                [t removeFromParent];
                [Scene.FireParticle removeFromParent];
                
                SKLabelNode *l = [[SKLabelNode alloc]init];
                l = [[SKLabelNode alloc]init];
                l.position = CGPointMake(200, 160);
                l.fontColor = [UIColor whiteColor];
                l.fontSize = 40;
                l.text = @"VOCE PERDEU";
                [Scene addChild:l];
            }

        }
        
        //matar
        
    }
}

@end
