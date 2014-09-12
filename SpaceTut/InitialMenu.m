
#import "InitialMenu.h"
#import "gameScene.h"

@implementation InitialMenu

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.01 green:0.01 blue:0.01 alpha:0.5];
        SKSpriteNode *bg = [[SKSpriteNode alloc] initWithImageNamed:@"Background tela inicial.jpg"];
        bg.position = CGPointMake(self.frame.size.height/2, self.frame.size.width/2);
        
        [self addChild:bg];
    }
    return self;
}



-(id)initWithSize:(CGSize)size  tipo:(int)config{
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.01 green:0.01 blue:0.01 alpha:0.5];
        SKSpriteNode *bg = [[SKSpriteNode alloc] initWithImageNamed:@"Background tela inicial.jpg"];
        
        switch (config) {
            case 0:
                bg.position = CGPointMake(self.frame.size.height/2, self.frame.size.width/2);
                break;
                
            default:
                bg.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
                break;
        }
        [self addChild:bg];
        
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
    gameScene * stage = [[gameScene alloc] initWithSize:self.view.bounds.size];
    stage.scaleMode = SKSceneScaleModeAspectFill;
    [self.view presentScene:stage transition:[SKTransition revealWithDirection: SKTransitionDirectionLeft duration:2]];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}





@end
