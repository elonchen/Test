//
//  MeetingsController.h
//  TradeShowInfo
//
//  Created by Elon on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import	"/usr/include/sqlite3.h"
#import "MeetingDao.h"
#import "BaseController.h"
//#import "SectionHeaderView.h"

@interface MeetingController : BaseController {
	NSMutableArray *meetingsArray;
	//sqlite3 *database;
	MeetingDao *meetingDao;
	UITableView *meetingView;
	UISegmentedControl *orderBy;
	int sortIndex;
}

@property (nonatomic,retain) NSMutableArray *meetingsArray;
@property (nonatomic,retain) MeetingDao *meetingDao;
@property (nonatomic,retain) IBOutlet UITableView *meetingView;
@property (nonatomic,retain) IBOutlet UISegmentedControl *orderBy;
@property (nonatomic,assign) int sortIndex;

-(IBAction)meetingOnSort:(id)sender;
-(IBAction)addMeetingClicked:(id)sender;

-(void) refreshMeetingView;

@end
