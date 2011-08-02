//
//  EditPlanning.h
//  TradeShowInfo
//
//  Created by Bright Creek on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Baseview.h"
//#import "MeetingDao.h"
#import "SectionHeaderView.h"

#import	"/usr/include/sqlite3.h"
#define databaseFileName @"data.sqlite3"

@interface EditPlanning : Baseview<SectionHeaderViewDelegate> {
	SectionHeaderView *headerViewOfYourBiggestGoals;
	SectionHeaderView *headerViewOfCompaniesToVisit;
	SectionHeaderView *headerViewOfFieldVisits;
	SectionHeaderView *headerViewOfSeminarsAndWorkshop;
	SectionHeaderView *headerViewOfStrategicMeetings;
	SectionHeaderView *headerViewOfDayPlanner;
	sqlite3 *database;
}

@property (nonatomic,retain) SectionHeaderView *headerViewOfYourBiggestGoals;
@property (nonatomic,retain) SectionHeaderView *headerViewOfCompaniesToVisit;
@property (nonatomic,retain) SectionHeaderView *headerViewOfFieldVisits;
@property (nonatomic,retain) SectionHeaderView *headerViewOfSeminarsAndWorkshop;
@property (nonatomic,retain) SectionHeaderView *headerViewOfStrategicMeetings;
@property (nonatomic,retain) SectionHeaderView *headerViewOfDayPlanner;

@end
