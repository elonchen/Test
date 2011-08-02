//
//  StarsAndEndsCell.h
//  TradeShowInfo
//
//  Created by Elon on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarsEndsCell.h"

@interface StarsAndEndsCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{
	IBOutlet UITableView *leftTableView;
	StarsEndsCell *startCell;
	StarsEndsCell *endCell;
	int *dateEditingRow;
	NSDateFormatter *showDateFormatter;
	UIDatePicker *datePickerView;
	UIActionSheet *actionSheet;
	int dateCount;
}

-(void) showDataPicker:(NSIndexPath *)indexPath;
@property (nonatomic,retain) UITableView *leftTableView;
@property (nonatomic,retain) StarsEndsCell *startCell;
@property (nonatomic,retain) StarsEndsCell *endCell;
@property (nonatomic, retain) NSDateFormatter *showDateFormatter;
@property (nonatomic, retain) UIDatePicker *datePickerView;
@property (nonatomic, retain) UIActionSheet *actionSheet;
@property (nonatomic, assign) int *dateEditingRow;
@property (nonatomic, assign) int dateCount;

-(void)viewToUp:(CGFloat)VIEW_UP;
-(IBAction)DatePickerCancelClick:(id)sender;
@end
