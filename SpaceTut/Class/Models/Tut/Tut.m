//
//  Tut.m
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 24/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "Tut.h"
#import "Define.h"


@implementation Tut

-(id)initWithParadas
{
    
    self = [super init];
    
	if (self) {
        
        SKTexture *t = [SKTexture textureWithImageNamed:@"tut"];
        
        self.texture = t;
        self.size = CGSizeMake(50, 80);
        self.position = CGPointMake(100, 160);
        self.physicsBody.dynamic = YES;
        self.name = @"tut" ;
        self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
        self.physicsBody.categoryBitMask = tartaruga;
        self.physicsBody.contactTestBitMask = tartaruga | borda | inimigo;
        self.physicsBody.collisionBitMask = tartaruga | borda ;
        self.zPosition = 100;
        self.anchorPoint = CGPointMake(0.5, 0.5);
        self.life = 2;
        
	}
	return self;
    
}

+(BOOL)checkLife : (Tut *)t
{
    if (t.life == 0) {
        return NO;
    }
    
    return YES;
}

@end
