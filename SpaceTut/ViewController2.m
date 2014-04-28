//
//  ViewController2.m
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 28/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "ViewController2.h"
#import "gameScene.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SKView *skView = (SKView *)self.view;
    // skView.showsFPS = YES;
    // skView.showsNodeCount = YES;
    
    
    // Create and configure the scene.
    //  SKScene * scene = [MenuScene sceneWithSize:];
    SKScene * scene = [gameScene sceneWithSize:skView.bounds.size];
    scene.size = skView.bounds.size;
    scene.scaleMode = SKSceneScaleModeResizeFill;
    
    // Present the scene.
    [skView presentScene:scene];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
