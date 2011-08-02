//
//  BaseController.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BaseController.h"


@implementation BaseController

@synthesize converDate;
@synthesize converResult;
@synthesize showTimeFormatter;
@synthesize dbTimeFormatter;

- (void)viewDidLoad{
	[super viewDidLoad];
	
	dbTimeFormatter=[[NSDateFormatter alloc] init];
	[dbTimeFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	
	showTimeFormatter=[[NSDateFormatter alloc] init];
	[showTimeFormatter setDateFormat:@"ccc, MMM dd hh:mm a"];
}

-(NSString *)converStrToShowTimeFomart:(NSString *)dateStr{
	
	converDate = [dbTimeFormatter dateFromString:dateStr];
	converResult = [showTimeFormatter stringFromDate:converDate];
	return converResult;
}

@end
