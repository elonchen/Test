//
//  EducationController.h
//  TradeShowInfo
//
//  Created by Elon on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import	"/usr/include/sqlite3.h"
#import "EducationDao.h"
//#import "SectionHeaderView.h"
#import "BaseController.h"

@interface EducationController : BaseController{
	NSMutableArray *educationsArray;
	//sqlite3 *database;
	EducationDao *educationDao;
	UITableView *educationView;
	UISegmentedControl *orderBy;
	int sortIndex;
}

@property (nonatomic,retain) NSMutableArray *educationsArray;
@property (nonatomic,retain) EducationDao *educationDao;
@property (nonatomic,retain) IBOutlet UITableView *educationView;
@property (nonatomic,retain) IBOutlet UISegmentedControl *orderBy;
@property (nonatomic,assign) int sortIndex;

-(IBAction)educationOnSort:(id)sender;
-(IBAction)addEducationClicked:(id)sender;

-(void) refreshEducationView;
@end
