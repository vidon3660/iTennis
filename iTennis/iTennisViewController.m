//
//  iTennisViewController.m
//  iTennis
//
//  Created by  on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "iTennisViewController.h"

#define kGameStateRunning   1
#define kGameStatePaused    2

#define kBallSpeedX         10
#define kBallSpeedY         15


@interface iTennisViewController ()

@end

@implementation iTennisViewController
@synthesize ball, racquet_green, racquet_yellow;
@synthesize tapToBegin, computer_score, player_score;
@synthesize ballVelocity, gameState;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.gameState = kGameStatePaused;
    ballVelocity = CGPointMake(kBallSpeedX, kBallSpeedY);
    [NSTimer scheduledTimerWithTimeInterval:(1.0f/30.0f) target:self selector:@selector(gameLoop) 
                                   userInfo:nil repeats:YES];
}

- (void) gameLoop
{
    //if (gameState == kGameStateRunning)
    {
        ball.center = CGPointMake(ball.center.x + ballVelocity.x, ball.center.y + ballVelocity.y);
        
        if (ball.center.x > self.view.bounds.size.width || ball.center.x < 0) {
            ballVelocity.x = -ballVelocity.x;
        }
        if (ball.center.y > self.view.bounds.size.height || ball.center.y < 0) {
            ballVelocity.y = -ballVelocity.y;
        }
    }
}
- (void)viewDidUnload
{
    [player_score release];
    player_score = nil;
    [computer_score release];
    computer_score = nil;
    [self setPlayer_score:nil];
    [self setComputer_score:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [player_score release];
    [computer_score release];
    [racquet_yellow release];
    [racquet_green release];
    [tapToBegin release];
    [ball release];
    [super dealloc];
}
@end
