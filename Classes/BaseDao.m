//
//  BaseDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SqlSampleAppDelegate.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "BaseDao.h"

@implementation BaseDao
@synthesize db;

- (id)init{
	if(self = [super init]){
		// AppDelegate open database
		//SqlSampleAppDelegate *appDelegate = (SqlSampleAppDelegate *)[[UIApplication sharedApplication] delegate];

		SqlSampleAppDelegate *appDelegate =[[SqlSampleAppDelegate alloc] autorelease];
		[appDelegate initDatabase];
	//	if (![appDelegate initDatabase]){
//			NSLog(@"Failed to init Database.");
//		}
		db = [[appDelegate db] retain];
	}
	return self;
}
// implement in subclass
-(NSString *)setTable:(NSString *)sql{
	return NULL;
}

- (void)dealloc {
	[db release];
	[super dealloc];
}

@end