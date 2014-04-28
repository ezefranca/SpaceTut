//
//  MenuController.m
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 28/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "MenuController.h"
#import "ViewController.h"

@interface MenuController ()

@end

@implementation MenuController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
 {
 return YES;
 }
 
 - (NSUInteger)supportedInterfaceOrientations {
 return UIInterfaceOrientationMaskPortrait;
 }
 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)butao:(id)sender {
    
    ViewController *myNewVC = [[ViewController alloc] init];
    
    // do any setup you need for myNewVC
    
    [self presentModalViewController:myNewVC animated:YES];
}
@end
