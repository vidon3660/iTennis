//
//  iTennisAppDelegate.m
//  iTennis
//
//  Created by Brandon Trebitowski on 1/14/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "iTennisAppDelegate.h"

@implementation iTennisAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	viewController = [[SplashViewController alloc] init];
    // Override point for customization after app launch    
    [window addSubview:[viewController view]];
	
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
