//
//  InitialMenu.m
//

//

#import "InitialMenu.h"
#import "MenuScene.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "gameScene.h"



@implementation InitialMenu

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.physicsWorld.contactDelegate = self;  // makes collision detection possible
        self.backgroundColor = [SKColor colorWithRed:0.1 green:1.0 blue:0.1 alpha:1.0];

        _myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        _myLabel.text = @"start!";
        _myLabel.fontSize = 20;
        _myLabel.position = CGPointMake(self.frame.size.width - _myLabel.frame.size.width/2,
                                       self.frame.size.height/4 + _myLabel.frame.size.height/2 );
        [self setBotao : [SKSpriteNode spriteNodeWithColor: [UIColor redColor]
                                                      size: CGSizeMake(_myLabel.frame.size.width, _myLabel.frame.size.height*2 +20)]];
        //[[self botao] setSize:myLabel.frame.size];
        [self botao].position = _myLabel.position;
        
        [self addChild: [self botao]];
        [self addChild: _myLabel];

    }
    return self;
}
-(void)didMoveToView:(SKView *)view{

}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 //    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        if (CGRectContainsPoint([self botao].frame, location)) {
//        }
//    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if (CGRectContainsPoint([self botao].frame, location)) {
            gameScene * stage = [[gameScene alloc] initWithSize:self.view.bounds.size];
            stage.scaleMode = SKSceneScaleModeAspectFill;
            [self.view presentScene:stage transition:[SKTransition doorsOpenHorizontalWithDuration:2] ];
        }
    }
}

-(void) didBeginContact:(SKPhysicsContact *)contact{
    SKPhysicsBody *firstBody, *secondBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else{
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
