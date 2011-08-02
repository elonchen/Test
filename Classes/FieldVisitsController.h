//
//  FieldVisitsController.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	"/usr/include/sqlite3.h"
#import "SectionHeaderView.h"
#import "FieldDao.h"
#import "EditField.h"
#import "Constants.h"
#import "BaseController.h"

@interface FieldVisitsController : BaseController {
	NSMutableArray *fieldArray;
	//sqlite3 *database;
	UITableView *fieldView;
	UISegmentedControl *orderBy;
	FieldDao *fieldDao;
	NSDateFormatter *dateFormatter;
	int sortIndex;

}

@property (nonatomic, retain) NSMutableArray *fieldArray;
@property (nonatomic, retain) IBOutlet UITableView *fieldView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *orderBy;
@property (nonatomic, retain) FieldDao *fieldDao;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, assign) int sortIndex;


-(IBAction)fieldOnSort:(id)sender;
-(IBAction)addFieldClicked:(id)sender;


-(void)refreshFieldView;

@end
