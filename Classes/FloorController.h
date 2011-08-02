//
//  FloorController.h
//  TradeShowInfo
//
//  Created by Bright Creek on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	"/usr/include/sqlite3.h"
#import "SectionHeaderView.h"
#import "CompanyDao.h"



#define databaseFileName @"data.sqlite3"

@interface FloorController : UIViewController <SectionHeaderViewDelegate>{
	NSMutableArray *companiesArray;
	sqlite3 *database;
	UITableView *companyView;
	UISegmentedControl *orderBy;
	CompanyDao *companyDao;
	int sortIndex;
	

}

@property (nonatomic, retain) NSMutableArray *companiesArray;
@property (nonatomic, retain) IBOutlet UITableView *companyView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *orderBy;
@property (nonatomic, retain) CompanyDao *companyDao;
@property (nonatomic, assign) int sortIndex;


-(IBAction)compOnSort:(id)sender;
-(IBAction)addCompanyClicked:(id)sender;


-(void)refreshCompanyView;
@end
