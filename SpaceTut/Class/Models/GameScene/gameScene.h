//
//  MyScene.h
//  tutInvader
//

//  Copyright (c) 2014 Gabriel Vieira. All rights reserved.
//



#import <SpriteKit/SpriteKit.h>
#import "Define.h"
#import "Timer.h"
#import "Tut.h"
#import "Player.h"
#import "Enemy.h"
#import "Colision.h"


@interface gameScene : SKScene <SKPhysicsContactDelegate>

@property Tut *spriteTut;
@property SKSpriteNode *chao;
@property SKSpriteNode *bg1;
@property SKSpriteNode *bg2;
@property BOOL pode;
@property NSTimeInterval lastUpdateTime;
@property NSTimeInterval deltaTime;
@property float pointsPerSecondSpeed;
@property BOOL podeMoverBg1;
@property BOOL podeMoverBg2;
@property NSArray *aguaFrame;
@property NSArray *tirosFrame;
@property NSArray *bossFrame;
@property NSArray *explosaoFrame;
@property NSArray *explosaoFrameVerde;
@property BOOL podeSubir;
@property BOOL podeDescer;
@property SKEmitterNode *FireParticle;
@property Timer *emenySpawn;
@property Colision *colisao;
@property SKAction *somTiro;
@property SKLabelNode *labelPontos;
@property SKLabelNode  *labelVida;
@property Player *jogador;
@property NSArray *tiroBoss;
@property Enemy *boss;

@property int countJelly;
@property BOOL bicho_criado;

@end
