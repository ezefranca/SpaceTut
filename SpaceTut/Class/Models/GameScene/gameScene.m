//
//  MyScene.m
//  tutInvader
//
//  Created by Gabriel Vieira on 15/04/14.
//  Copyright (c) 2014 Gabriel Vieira. All rights reserved.
//

#import "gameScene.h"
#import "gameFloor.h"
#import "Enemy.h"
#import "Shot.h"
#import "RandonRote.h"
#import "Player.h"

@implementation gameScene

@synthesize explosaoFrame;

#pragma mark class init

-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.bg2 = [SKSpriteNode spriteNodeWithImageNamed:@"newbg2"];
        self.bg2.position = CGPointMake(568*2.5, 160);
        [self addChild:self.bg2];
        
        
        
        self.emenySpawn = [[Timer alloc]init];
        [self.emenySpawn startTimer];
        
        
        self.bg1 = [SKSpriteNode spriteNodeWithImageNamed:@"newbg1"];
        self.bg1.position = CGPointMake(284, 160);
        [self addChild:self.bg1];
       
        self.pode = NO;
        
        
        self.chao = [[gameFloor alloc]initWithSize:CGSizeMake(size.height , 1)];
        [self addChild:self.chao];
        
        self.aguaFrame = [self loadSpriteSheetFromImageWithName:@"jelly" withNumberOfSprites:12 withNumberOfRows:4 withNumberOfSpritesPerRow:3];
        self.explosaoFrame = [self loadSpriteSheetFromImageWithName:@"ex1" withNumberOfSprites:25 withNumberOfRows:5 withNumberOfSpritesPerRow:5];
        self.explosaoFrameVerde = [self loadSpriteSheetFromImageWithName:@"ex2" withNumberOfSprites:25 withNumberOfRows:5 withNumberOfSpritesPerRow:5];
        self.tirosFrame = [self alocandoSpriteTiro];
        
        
        self.spriteTut = [[Tut alloc]initWithParadas];
        SKAction *action = [SKAction rotateByAngle:(M_PI/2) * (-1) duration:1];
       [self.spriteTut runAction:action];
        
        
        [self addChild:self.spriteTut];
        
        NSString *myParticlePath = [[NSBundle mainBundle] pathForResource:@"FireParticle" ofType:@"sks"];
        self.FireParticle = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
        self.FireParticle.particlePosition = CGPointMake(self.spriteTut.position.x - 30, self.spriteTut.position.y);
        self.FireParticle.particleBirthRate = 100;
        
        
        
        NSString *myParticlePath2 = [[NSBundle mainBundle] pathForResource:@"SnowParticle" ofType:@"sks"];
        SKEmitterNode*p = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath2];
        p.particlePosition = CGPointMake(270, 160);
        p.particleBirthRate = 10;
        
        
        
        [self addChild:self.FireParticle];
         [self addChild:p];
        
       // SKAction *cu = [SKAction animateWithTextures:self.aguaFrame timePerFrame:0.2f];
        //[self.spriteTut runAction:[SKAction repeatActionForever:cu]];
        self.spriteTut.anchorPoint = CGPointMake(0.5, 0.5);
        
        
        self.physicsWorld.gravity = CGVectorMake(0.0f, 0.0f);
        self.physicsWorld.contactDelegate = self;
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        self.pointsPerSecondSpeed = 70;
        self.podeMoverBg1 = YES;
        self.podeMoverBg2 = NO;
        
        [self gerateEnemy];
        
        NSLog(@"%f  %f", self.size.height , self.size.width);
        
        self.podeDescer = NO;
        self.podeSubir = NO;
        
        Player *pla = [[Player alloc]init];
        pla.pontuacao = 5;
        
    }
    return self;
}

#pragma mark touch events

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInNode:self] ;
    
    if (touchPoint.x > self.size.width /2) {
        self.pode = YES;
    }
    
    if (touchPoint.x < self.size.width/2 && touchPoint.y < self.size.height/2) {
        self.podeDescer = YES;
    }
    
    if (touchPoint.x < self.size.width/2 && touchPoint.y > self.size.height/2) {
        self.podeSubir = YES;
    }
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.pode = NO;
    self.podeDescer = NO;
    self.podeSubir = NO;
}

#pragma mark Colision

- (void)didBeginContact:(SKPhysicsContact *)contact
{
    NSLog(@"contact detected");
    [Colision check:contact.bodyA.node :contact.bodyB.node :self];
}

#pragma mark Main Game Loop

-(void)update:(CFTimeInterval)currentTime {
    
    
    [self.emenySpawn stopTimer];
    if ((int)[self.emenySpawn timeElapsedInSeconds] == 1) {
        
        [self gerateEnemy];
        [self.emenySpawn startTimer];
    }
    
    [self enumerateChildNodesWithName:@"explosao" usingBlock:^(SKNode *node, BOOL *stop) {
        if (![node hasActions]) {
             [node removeFromParent];
        }
    }];
    
    [self tutMoviments];
    [self verificaBackground];
    
    //To compute velocity we need delta time to multiply by points per second
    if (self.lastUpdateTime)
    {
        self.deltaTime = currentTime - self.lastUpdateTime;
    }
    else
    {
        self.deltaTime = 0;
    }
    
    self.lastUpdateTime = currentTime;
    
    CGPoint bgVelocity = CGPointMake(-self.pointsPerSecondSpeed, 0.0);
    CGPoint amtToMove = CGPointMake(bgVelocity.x * self.deltaTime, bgVelocity.y * self.deltaTime);
    
    if (self.podeMoverBg1) {
        self.bg1.position = CGPointMake(self.bg1.position.x+amtToMove.x, self.bg1.position.y);
    }
    
    if (self.podeMoverBg2) {
         self.bg2.position = CGPointMake(self.bg2.position.x+amtToMove.x, self.bg2.position.y);
    }
}

-(void)atirar
{
    SKSpriteNode *tiro = [[Shot alloc]initWithAnimationAndPosition:self.tirosFrame :CGPointMake(self.spriteTut.position.x + 60, self.spriteTut.position.y)  ];
    [self addChild:tiro];
    [tiro.physicsBody applyForce:CGVectorMake(25.0f, 0.0f)];
}

-(void)tutMoviments
{
    if (self.pode) {
        [self atirar];
        [self runAction:[SKAction playSoundFileNamed:@"som.wav" waitForCompletion:NO]];

        self.pode = NO;
    }
    
    if (self.podeDescer) {
        self.spriteTut.position = CGPointMake(self.spriteTut.position.x, self.spriteTut.position.y - 4);
        self.FireParticle.position =  CGPointMake(self.spriteTut.position.x - 110, self.spriteTut.position.y - 160);
    }
    
    if (self.podeSubir) {
        self.spriteTut.position = CGPointMake(self.spriteTut.position.x, self.spriteTut.position.y + 4);
        self.FireParticle.position =  CGPointMake(self.spriteTut.position.x - 110, self.spriteTut.position.y - 160);
    }
}

-(void)verificaBackground
{
    //varios bg monstro infinito
    if (self.bg1.position.x <= -270) {
        self.podeMoverBg2 = YES;
    }
    
    if ((self.bg2.position.x < 852 && self.bg2.position.x > 840 ) && self.podeMoverBg2 == YES) {
        self.podeMoverBg1 = NO;
        self.bg1.position = CGPointMake(568*2.5, 160);
    }
    
    if (self.bg2.position.x <= -270) {
        self.podeMoverBg1 = YES;
    }
    
    if ((self.bg1.position.x < 852 && self.bg1.position.x > 840 ) && self.podeMoverBg1 == YES) {
        self.podeMoverBg2 = NO;
        self.bg2.position = CGPointMake(568*2.5, 160);
    }
}

#pragma mark gerando inimigos

-(void)gerateEnemy{
    
    SKSpriteNode *enemy = [[Enemy alloc]initWithAnimationAndPosition:self.aguaFrame ];
    
    
     CGMutablePathRef cgpath = [RandonRote returnRote:[ self getRandomNumberBetween:1 to:5]];
       /*
    CGPoint s = CGPointMake(600.0, 160);
    CGPoint e = CGPointMake(0.0, 320);
    CGPoint cp1 = CGPointMake(450, 320);
    CGPoint cp2 = CGPointMake(250, -320);
    CGPathMoveToPoint(cgpath,NULL, s.x, s.y);
    CGPathAddCurveToPoint(cgpath, NULL, cp1.x, cp1.y, cp2.x, cp2.y, e.x, e.y);
    */
    SKAction *planeDestroy = [SKAction followPath:cgpath asOffset:NO orientToPath:YES duration:5];
    [self addChild:enemy];
    
    SKAction *remove = [SKAction removeFromParent];
    [enemy runAction:[SKAction sequence:@[planeDestroy,remove]]];
    
}

#pragma mark Randon Numbers

- (NSInteger)getRandomNumberBetween:(NSInteger)min to :(NSInteger)max
{
    return min + arc4random() % (max - min + 1);
}

#pragma mark Alocando Sprites

-(NSArray *)alocandoSpriteTiro
{
    NSArray *s = [NSArray arrayWithObjects:[SKTexture textureWithImageNamed:@"tiro3"],[SKTexture textureWithImageNamed:@"tiro2"],[SKTexture textureWithImageNamed:@"tiro1"], nil];
    return s;
}

-(NSMutableArray*)loadSpriteSheetFromImageWithName:(NSString*)name withNumberOfSprites:(int)numSprites withNumberOfRows:(int)numRows withNumberOfSpritesPerRow:(int)numSpritesPerRow {
    
    NSMutableArray* animationSheet = [NSMutableArray array];
    SKTexture* mainTexture = [SKTexture textureWithImageNamed:name];
    
    for(int j = numRows-1; j >= 0; j--) {
        for(int i = 0; i < numSpritesPerRow; i++) {
            
            SKTexture* part = [SKTexture textureWithRect:CGRectMake(i*(1.0f/numSpritesPerRow), j*(1.0f/numRows), 1.0f/numSpritesPerRow, 1.0f/numRows) inTexture:mainTexture];
            
            [animationSheet addObject:part];
            
            if(animationSheet.count == numSprites)
                break;
        }
        
        if(animationSheet.count == numSprites)
            break;
        
    }
    return animationSheet;
}

-(void)didMoveToView:(SKView *)view
{
    
}

@end
