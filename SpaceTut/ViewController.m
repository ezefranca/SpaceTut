//
//  ViewController.m
//  tutInvader
//
//  Created by Gabriel Vieira on 15/04/14.
//  Copyright (c) 2014 Gabriel Vieira. All rights reserved.
//

#import "ViewController.h"
#import "gameScene.h"
#import "GameController.h"
#import "MenuScene.h"
#import "InitialMenu.h"

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.skView = (SKView *)self.view;
    
//    SKScene * scene = [MenuScene sceneWithSize:];
    //SKScene * scene = [gameScene sceneWithSize:self.skView.bounds.size];
    InitialMenu *scene = [[InitialMenu alloc] initWithSize:self.skView.bounds.size tipo:0];
    scene.size = self.skView.bounds.size;
    scene.scaleMode = SKSceneScaleModeResizeFill;
    
    // Present the scene.
    [self.skView presentScene:scene];
    
    self.orientation = 0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(void)coco{
    [self.skView presentScene:nil];
    self.skView = nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}



@end
