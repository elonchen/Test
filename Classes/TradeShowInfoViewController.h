//
//  TradeShowInfoViewController.h
//  TradeShowInfo
//
//  Created by Bright Creek on 3/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TradeShowDao.h"
#import "Baseview.h"
#define kFilename	@"data.plist"
@interface TradeShowInfoViewController : Baseview<UITextFieldDelegate>
{
	//UIButton *button
	UITextField	*textFieldNormal;
	UITextField *addressText;
	UILabel *dateBegin;
	UILabel *dateEnd;
	NSMutableArray *menuArray;
//	UIDatePicker *datePickerView;
//	NSDateFormatter *dateFormatter;
//	UIActionSheet *actionSheet;
	TradeShowDao *tradShowDao;
	
}
@property (nonatomic, retain, readonly) UITextField	*textFieldNormal;
@property (nonatomic, retain, readonly) UITextField	*addressText;
@property (nonatomic, retain) UILabel *dateBegin;
@property (nonatomic, retain) UILabel *dateEnd;
@property (nonatomic, retain) UIDatePicker *datePickerView;
@property (nonatomic, retain) NSMutableArray *menuArray;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) UIActionSheet *actionSheet;
@property (nonatomic, retain) TradeShowDao *tradShowDao;
- (NSString *)dataFilePath; 
- (void)applicationWillTerminate:(NSNotification *)notification;

-(IBAction)homeButtonClicked:(id)sender;
-(void)viewToUp:(CGFloat)VIEW_UP;
-(void)ViewToDown;

-(BOOL)checkRequired;
@end

