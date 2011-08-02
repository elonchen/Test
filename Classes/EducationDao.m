//
//  EducationDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EducationDao.h"

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "Education.h"


@implementation EducationDao


-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"Education"];
}


// SELECT
-(Education *)getEducationById:(int)index{
	
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
	if ([rs next]) {	
		Education *e = [[[Education alloc] initWithIndex:[rs intForColumn:@"id"] 
												   Title:[rs stringForColumn:@"title"] 
												Location:[rs stringForColumn:@"location"] 
											  Importance:[rs intForColumn:@"importance"] 
												 Speaker:[rs stringForColumn:@"speaker"] 
													Time:[rs stringForColumn:@"time"]
												   Notes:[rs stringForColumn:@"notes"] 
												  Photos:[rs stringForColumn:@"photos"] 
													TsId:[rs intForColumn:@"tsId"]]
		
					  autorelease];
		[rs close];
		return e;
	}
	return nil;
}

// SELECT
-(NSMutableArray *)select:(int)sortIndex{
	
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:0] ;
	
	NSString *sql = nil;
	if(sortIndex==0){
		sql = @"SELECT * FROM Education order by time";
	}else {
		sql = @"SELECT * FROM Education order by importance";
	}
	
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		Education *e = [[Education alloc] initWithIndex:[rs intForColumn:@"id"] 
												 Title:[rs stringForColumn:@"title"] 
											  Location:[rs stringForColumn:@"location"] 
											Importance:[rs intForColumn:@"importance"] 
											   Speaker:[rs stringForColumn:@"speaker"] 
												  Time:[rs stringForColumn:@"time"]
												 Notes:[rs stringForColumn:@"notes"] 
												Photos:[rs stringForColumn:@"photos"] 
												  TsId:[rs intForColumn:@"tsId"]];
		
		
		
		[result addObject:e];
		[e release];
	}
	[rs close];
	return result;
}

// INSERT
-(void)insertWithTitle:(NSString *)title Location:(NSString *)location Importance:(int)importance Speaker:(NSString *)speaker Time:(NSString *)time Notes:(NSString *)notes Photos:(NSString *)photos TsId:(int)tsId{
	NSLog(@"in insert");
	[db executeUpdate:[self setTable:@"INSERT INTO %@ (title, location, importance, speaker, time, notes, photos, tsId) VALUES (?,?,?,?,?,?,?,?)"], title, location, [NSNumber numberWithInt:importance], speaker, time, notes, photos, [NSNumber numberWithInt:tsId]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}

// UPDATE
-(BOOL)updateAt:(int)index Title:(NSString *)title Location:(NSString *)location Importance:(int)importance Speaker:(NSString *)speaker Time:(NSString *)time Notes:(NSString *)notes Photos:(NSString *)photos TsId:(int)tsId{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET title=?, location=?, importance=?, speaker=?, time=?, notes=?, photos=? WHERE id=?"], title, location, [NSNumber numberWithInt:importance], speaker, time, notes, photos, [NSNumber numberWithInt:index]];
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