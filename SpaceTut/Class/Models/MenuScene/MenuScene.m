//
//  MenuScene.m
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 24/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "MenuScene.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "gameScene.h"


@implementation MenuScene
@synthesize controller;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
   
    [self.view endEditing:YES];
    
    [self.controller coco];
    //[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationMaskLandscape];
   // float   angle = M_PI/2;  //rotate 180°, or 1 π radians
  //  self.view.layer.transform = CATransform3DMakeRotation(angle, 0, 0.0, 1.0);
 
    /*
    //[[UIApplication sharedApplication]setStatusBarOrientation:UIInterfaceOrientationPortrait];
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
    gameScene *newScene = [[gameScene alloc] initWithSize: CGSizeMake(568,320)];
        
    //  Optionally, insert code to configure the new scene.
    [self.scene.view presentScene: newScene transition: reveal];
    */

}

-(void)didMoveToView:(SKView *)view{
    /*
    NSLog(@"%f   %f" , view.bounds.size.width ,  view.bounds.size.height);
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, view.bounds.size.width / 2 -20, 200, 40)];
   
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = [UIColor blackColor];
    textField.font = [UIFont systemFontOfSize:17.0];
    float   angle = - M_PI/2;  //rotate °, or 1 π radians

    textField.layer.transform = CATransform3DMakeRotation(angle, 0, 0.0, 1.0);
    textField.placeholder = @"Enter your name here";
    textField.backgroundColor = [UIColor whiteColor];
    textField.autocorrectionType = UITextAutocorrectionTypeYes;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
   // textField.delegate = self.delegate;
    [self.view addSubview:textField];
    */
}

-(id)initWithController : (ViewController *)c{
    self = [super init];
    
    if (self) {
        self.controller = c;
    }
    
    return self;
}

@end
