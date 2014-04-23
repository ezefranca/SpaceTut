//
//  Colision.h
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 23/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Colision : NSObject
+(void)check : (SKNode*)bodyA : (SKNode*)bodyB : (SKScene *)Scene;
@end
