//
//  iTennisViewController.h
//  iTennis
//
//  Created by  on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iTennisViewController : UIViewController
{
    IBOutlet UIImageView *ball;
    IBOutlet UIImageView *racquet_yellow;
    IBOutlet UIImageView *racquet_green;
    IBOutlet UILabel *tapToBegin;
    IBOutlet UILabel *computer_score;
    IBOutlet UILabel *player_score;
    
    CGPoint ballVelocity;
    NSInteger gameState;
    
    NSInteger player_score_value;
    NSInteger computer_score_value;
}

@property (nonatomic, retain) IBOutlet UIImageView *ball;
@property (retain, nonatomic) IBOutlet UIImageView *racquet_yellow;
@property (retain, nonatomic) IBOutlet UIImageView *racquet_green;
@property (nonatomic, retain) IBOutlet UILabel *tapToBegin;
@property (retain, nonatomic) IBOutlet UILabel *computer_score;
@property (retain, nonatomic) IBOutlet UILabel *player_score;
@property (nonatomic) CGPoint ballVelocity;
@property (nonatomic) NSInteger gameState;

- (void) reset:(BOOL) newGame;

@end
