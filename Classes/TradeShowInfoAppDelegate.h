//
//  TradeShowInfoAppDelegate.h
//  TradeShowInfo
//
//  Created by Bright Creek on 3/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TradeShowInfoViewController;

@interface TradeShowInfoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    //TradeShowInfoViewController *viewController;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
//@property (nonatomic, retain) IBOutlet TradeShowInfoViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

