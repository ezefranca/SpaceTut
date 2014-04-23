//
//  Enemy.h
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 23/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Enemy : SKSpriteNode

@property int life;

-(id)initWithAnimationAndPosition : (NSArray *)frames;

+(void)checkLife : (Enemy *)e;
@end
