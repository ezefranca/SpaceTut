//
//  MenuScene.h
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 24/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ViewController.h"

@interface MenuScene : SKScene

@property ViewController *controller;
@property int x;

-(id)initWithController : (ViewController *)c;
@end
