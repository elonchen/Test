//
//  CalendarDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarDao.h"

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "Calendar.h"

#import	"Hints.h"


@implementation CalendarDao

-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"Calendar"];
}

// SELECT
-(Calendar *)getCalendarById:(int)index{
	
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
	if ([rs next]) {
		Calendar *c = [[[Calendar alloc]
			  initWithIndex:[rs intForColumn:@"id"]
			  Title:[rs stringForColumn:@"title"]
			  Importance:[rs intForColumn:@"importance"]
			  Begin:[rs stringForColumn:@"begin"]
			  End:[rs stringForColumn:@"end"]
			  Notes:[rs stringForColumn:@"notes"]]
			  autorelease];
		[rs close];
		return c;
	}
	
	return nil;
}

// SELECT
-(NSMutableArray *)select:(int)sortIndex{
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:0];
	
	NSString *sql = nil;
	if(sortIndex==0){
		sql = @"SELECT * FROM Calendar order by begin";
	}else {
		sql = @"SELECT * FROM Calendar order by importance";
	}
	FMResultSet *rs = [db executeQuery:sql];

	while ([rs next]) {
		Calendar *c = [[Calendar alloc]
					   initWithIndex:[rs intForColumn:@"id"]
					   Title:[rs stringForColumn:@"title"]
					   Importance:[rs intForColumn:@"importance"]
					   Begin:[rs stringForColumn:@"begin"]
					   End:[rs stringForColumn:@"end"]
					   Notes:[rs stringForColumn:@"notes"]
					  ];
		[result addObject:c];
		//[c release];
	}
	[rs close];
	return result;
}
				   
 // INSERT
-(void)insertWithTitle:(NSString *)title Importance:(int)importance Begin:(NSString *)begin End:(NSString *)end Notes:(NSString *)notes{
[db executeUpdate:[self setTable:@"INSERT INTO %@ (title, importance, begin, end, notes) VALUES (?,?,?,?,?)"], title, [NSNumber numberWithInt:importance], begin, end, notes];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
 }
					   
// UPDATE
-(BOOL)updateAt:(int)index Title:(NSString *)title Importance:(int)importance Begin:(NSString *)begin End:(NSString *)end Notes:(NSString *)notes{
BOOL success = YES;
[db executeUpdate:[self setTable:@"UPDATE %@ SET title=?, importance=?, begin=?, end=?, notes=? WHERE id=?"], title, [NSNumber numberWithInt:importance], begin, end, notes, [NSNumber numberWithInt:index]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
	return success;
}
					   
// DELETE
- (BOOL)deleteAt:(int)index{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"DELETE FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
	return success;
}

-(Hints *)getHintsById:(int)index{
	FMResultSet *rs = [db executeQuery:@"SELECT * FROM Hints WHERE id = 2"];
	
	//	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
	if ([rs next]) {	
		Hints *h = [[[Hints alloc] initWithIndex:[rs intForColumn:@"id"] 
											Name:[rs stringForColumn:@"name"] 
											Show:[rs stringForColumn:@"show"] 
											TsId:[rs intForColumn:@"tsId"]]
					autorelease];
		[rs close];
		return h;
	}
	return nil;
}

- (void)dealloc {
	[super dealloc];
}

@end