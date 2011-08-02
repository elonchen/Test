//
//  IconNav.h
//  Navigation
//
//  Created by Bright Creek on 2/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IconNav : UIViewController  <UIActionSheetDelegate>{

	NSInteger iconIndex;
}
-(IBAction)planningClicked:(id)sender;
-(IBAction)floorClicked:(id)sender;
-(IBAction)calendarClicked:(id)sender;
-(IBAction)educationClicked:(id)sender;
-(IBAction)todoClicked:(id)sender;
-(IBAction)fieldVisitsClicked:(id)sender;
-(IBAction)meetingsClicked:(id)sender;
-(IBAction)settingClicked:(id)sender;
-(IBAction)showCopyright:(id)sender;
-(void)showNextNibAtIndex:(NSInteger)index;
@property(nonatomic,retain) IBOutlet UIView *infoView;
@end
