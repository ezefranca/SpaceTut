//
//  ViewController.m
//  tutInvader
//
//  Created by Gabriel Vieira on 15/04/14.
//  Copyright (c) 2014 Gabriel Vieira. All rights reserved.
//

#import "ViewController.h"
#import "gameScene.h"
#import "MenuScene.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;

    
    // Create and configure the scene.
  //  SKScene * scene = [MenuScene sceneWithSize:];
    SKScene * scene = [[MenuScene alloc]initWithController:self];
    scene.size = skView.bounds.size;
    scene.scaleMode = SKSceneScaleModeResizeFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
    self.orientation = 0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(void)coco
{
    
}



@end
