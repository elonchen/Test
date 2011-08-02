//
//  CalendarController.h
//  TradeShowInfo
//
//  Created by Bright Creek on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarDao.h"

@interface CalendarController : UIViewController{
	NSMutableArray *calendarArray;
	//sqlite3 *database;
	UITableView *calendarView;
	UIToolbar *sortBar;
	UIToolbar *addBar;
	UISegmentedControl *orderBy;
	NSDateFormatter *dateFormatter;
	CalendarDao *calendarDao;
	int sortIndex;
}

@property (nonatomic, retain) NSMutableArray *calendarArray;
@property (nonatomic, retain) IBOutlet UITableView *calendarView;
@property (nonatomic, retain) IBOutlet UIToolbar *sortBar;
@property (nonatomic, retain) IBOutlet UIToolbar *addBar;
@property (nonatomic, retain) IBOutlet UISegmentedControl *orderBy;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) CalendarDao *calendarDao;
@property (nonatomic, assign) int sortIndex;

-(IBAction)calendarOnSort:(id)sender;
-(IBAction)addCalendarClicked:(id)sender;
-(void)convertCalendar;
-(void)getCalendarByDate;
-(void)getCalendarByImportance;
//- (NSString *)dataFilePath; 
//-(void)refreshCompanyView;
//-(void)databaseInit;@end
@end