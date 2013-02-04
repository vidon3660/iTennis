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

#define kComputerSpeed      15

#define kScoreToWin         5

@interface iTennisViewController ()

@end

@implementation iTennisViewController
@synthesize ball, racquet_green, racquet_yellow;
@synthesize tapToBegin, computer_score, player_score;
@synthesize ballVelocity, gameState;
@synthesize volleyFileID, clappingFileID;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.gameState = kGameStatePaused;
    ballVelocity = CGPointMake(kBallSpeedX, kBallSpeedY);
    
    NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"Clapping Crowd Studio 01" ofType:@"caf"];
    CFURLRef clapURL = (CFURLRef ) [NSURL fileURLWithPath:clapPath];
    AudioServicesCreateSystemSoundID(clapURL, &clappingFileID);
    
    NSString *volleyPath = [[NSBundle mainBundle] pathForResource:@"Tennis Volley 01" ofType:@"caf"];
    CFURLRef volleyURL = (CFURLRef ) [NSURL fileURLWithPath:volleyPath];
    AudioServicesCreateSystemSoundID(volleyURL, &volleyFileID);
    
    
    [NSTimer scheduledTimerWithTimeInterval:(1.0f/30.0f) target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
    
}

- (void) gameLoop
{
    if (gameState == kGameStateRunning)
    {
        ball.center = CGPointMake(ball.center.x + ballVelocity.x, ball.center.y + ballVelocity.y);
        
        if (ball.center.x > self.view.bounds.size.width || ball.center.x < 0) {
            ballVelocity.x = -ballVelocity.x;
        }
        if (ball.center.y > self.view.bounds.size.height || ball.center.y < 0) {
                     ballVelocity.y = -ballVelocity.y;
        }
        
        // Collision with paddles
        if (CGRectIntersectsRect(ball.frame, racquet_yellow.frame))
        {
            if (ball.center.y > racquet_yellow.center.y) {
                ballVelocity.y = -ballVelocity.y;
                AudioServicesPlaySystemSound(volleyFileID);
            }
        }
        if (CGRectIntersectsRect(ball.frame, racquet_green.frame))
        {
            if (ball.center.y < racquet_green.center.y) {
                ballVelocity.y = -ballVelocity.y;
                AudioServicesPlaySystemSound(volleyFileID);            }
        }
        
        // Begin Simple AI
        if (ball.center.y < self.view.center.y)
        {
            if (ball.center.x < racquet_yellow.center.x) {
                CGPoint compLocation = CGPointMake(racquet_yellow.center.x - kComputerSpeed, racquet_yellow.center.y);                               
                racquet_yellow.center = compLocation;
            }
            if (ball.center.x > racquet_yellow.center.x) {
                CGPoint compLocation = CGPointMake(racquet_yellow.center.x + kComputerSpeed, racquet_yellow.center.y);
                racquet_yellow.center = compLocation;
            }
        }
        
        // Begin Scoring Game Logic
        if (ball.center.y <= 0) {
            player_score_value++;
            [self reset:(player_score_value >= kScoreToWin)];
        }
        if (ball.center.y > self.view.bounds.size.height) {
            computer_score_value++;
            [self reset:(computer_score_value >= kScoreToWin)];
        }
    }
    else {
        if (tapToBegin.hidden == YES) {
            tapToBegin.text = NO;
        }
    }
}

- (void) reset:(BOOL) newGame
{
    self.gameState = kGameStatePaused;
    AudioServicesPlaySystemSound(clappingFileID);
    ball.center = self.view.center;
    if (newGame)
    {
        if (computer_score_value > player_score_value) {
            tapToBegin.text = @"Computer Wins!";
        }
        else {
            tapToBegin.text = @"Player Wins!";
        }
        
        player_score_value = 0;
        computer_score_value = 0;
    }
    else {
        tapToBegin.text = @"Tap To Begin";
    }
    
    player_score.text = [NSString stringWithFormat:@"%d", player_score_value];
    computer_score.text = [NSString stringWithFormat:@"%d", computer_score_value];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (gameState == kGameStatePaused)
    {
        gameState = kGameStateRunning;
        tapToBegin.hidden = YES;
    }
    else if (gameState == kGameStateRunning)
    {
        [self touchesMoved:touches withEvent:event];
    }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    CGPoint xlocation = CGPointMake(location.x, racquet_green.center.y);
    racquet_green.center = xlocation;
}

- (void)viewDidUnload
{
    [player_score release];
    player_score = nil;
    [computer_score release];
    computer_score = nil;
    [self setPlayer_score:nil];
    [self setComputer_score:nil];
    [tapToBegin release];
    tapToBegin = nil;
    [self setRacquet_green:nil];
    [self setRacquet_yellow:nil];
    [self setRacquet_yellow:nil];
    [self setRacquet_yellow:nil];
    [self setRacquet_green:nil];
    [computer_score release];
    computer_score = nil;
    [player_score release];
    player_score = nil;
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
    [tapToBegin release];
    [racquet_green release];
    [racquet_yellow release];
    [racquet_yellow release];
    [racquet_yellow release];
    [racquet_green release];
    [computer_score release];
    [player_score release];
    [super dealloc];
}
@end
