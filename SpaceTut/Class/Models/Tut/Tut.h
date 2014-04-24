//
//  Tut.h
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 24/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Tut : SKSpriteNode

@property int life;

-(id)initWithParadas;

+(BOOL)checkLife : (Tut *)t;

@end
