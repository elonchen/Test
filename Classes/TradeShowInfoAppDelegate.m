//
//  TradeShowInfoAppDelegate.m
//  TradeShowInfo
//
//  Created by Bright Creek on 3/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TradeShowInfoAppDelegate.h"
#import "TradeShowInfoViewController.h"

@implementation TradeShowInfoAppDelegate

@synthesize window;
//@synthesize viewController;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    //[self.window addSubview:viewController.view];
	[self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)dealloc {
	[navigationController release];
    //[viewController release];
    [window release];
    [super dealloc];
}


@end
