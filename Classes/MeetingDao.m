//
//  MeetingDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MeetingDao.h"

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "Meeting.h"

@implementation MeetingDao


-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"Meeting"];
}


// SELECT
-(Meeting *)getMeetingById:(int)index{
	
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
	if ([rs next]) {	
		Meeting *m = [[[Meeting alloc] initWithIndex:[rs intForColumn:@"id"] 
												   Title:[rs stringForColumn:@"title"] 
												Location:[rs stringForColumn:@"location"] 
											  Importance:[rs intForColumn:@"importance"] 
													Time:[rs stringForColumn:@"time"]
												   Notes:[rs stringForColumn:@"notes"] 
												  Photos:[rs stringForColumn:@"photos"] 
													TsId:[rs intForColumn:@"tsId"]]
						
						autorelease];
		[rs close];
		return m;
	}
	return nil;
}

// SELECT
-(NSMutableArray *)select:(int)sortIndex{
	
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:0] ;
	
	NSString *sql = nil;
	if(sortIndex==0){
		sql = @"SELECT * FROM Meeting order by time";
	}else {
		sql = @"SELECT * FROM Meeting order by importance";
	}
	
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		Meeting *m = [[Meeting alloc] initWithIndex:[rs intForColumn:@"id"] 
												  Title:[rs stringForColumn:@"title"] 
											   Location:[rs stringForColumn:@"location"] 
											 Importance:[rs intForColumn:@"importance"] 
												   Time:[rs stringForColumn:@"time"]
												  Notes:[rs stringForColumn:@"notes"] 
												 Photos:[rs stringForColumn:@"photos"] 
												   TsId:[rs intForColumn:@"tsId"]];
		
		
		
		[result addObject:m];
		[m release];
	}
	[rs close];
	return result;
}

// INSERT
-(void)insertWithTitle:(NSString *)title Location:(NSString *)location Importance:(int)importance Time:(NSString *)time Notes:(NSString *)notes Photos:(NSString *)photos TsId:(int)tsId{
	NSLog(@"in insert");
	[db executeUpdate:[self setTable:@"INSERT INTO %@ (title, location, importance, time, notes, photos, tsId) VALUES (?,?,?,?,?,?,?)"], title, location, [NSNumber numberWithInt:importance], time, notes, photos, [NSNumber numberWithInt:tsId]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}

// UPDATE
-(BOOL)updateAt:(int)index Title:(NSString *)title Location:(NSString *)location Importance:(int)importance Time:(NSString *)time Notes:(NSString *)notes Photos:(NSString *)photos TsId:(int)tsId{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET title=?, location=?, importance=?, time=?, notes=?, photos=? WHERE id=?"], title, location, [NSNumber numberWithInt:importance], time, notes, photos, [NSNumber numberWithInt:index]];
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

- (void)dealloc {
	[super dealloc];
}

@end