//
//  iTennisAppDelegate.h
//  iTennis
//
//  Created by Brandon Trebitowski on 1/14/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SplashViewController.h"

@interface iTennisAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SplashViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SplashViewController *viewController;

@end

