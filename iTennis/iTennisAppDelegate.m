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

//- (void)applicationDidFinishLaunching:(UIApplication *)application {
//
//	viewController = [[SplashViewController alloc] init];
//    // Override point for customization after app launch
//    [window addSubview:[viewController view]];
//
//    [window makeKeyAndVisible];
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    
    //[self.window addSubview:[self.viewController view]];
    [self.window makeKeyAndVisible];
    return YES;
}



- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
