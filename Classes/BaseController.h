//
//  BaseController.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SectionHeaderView.h"
#import	"/usr/include/sqlite3.h"

@interface BaseController : UIViewController<SectionHeaderViewDelegate> {
	sqlite3 *database;
	
	NSDateFormatter *dbTimeFormatter;
	NSDateFormatter *showTimeFormatter;	
	
	NSDate *converDate;
	NSString *converResult;
}

@property (nonatomic, retain) NSDateFormatter *showTimeFormatter;
@property (nonatomic, retain) NSDateFormatter *dbTimeFormatter;

@property (nonatomic, retain) NSDate *converDate;
@property (nonatomic, retain) NSString *converResult;

-(NSString *)converStrToShowTimeFomart:(NSString *)dateStr;

@end
