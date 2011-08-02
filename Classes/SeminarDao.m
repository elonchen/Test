//
//  SeminarDao.m
//  TradeShowInfo
//
//  Created by Elon on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SeminarDao.h"
#import "Seminar.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@implementation SeminarDao

-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"Education"];
}

-(Seminar *) getSeminarById:(int)index{
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
	if ([rs next]) {	
		Seminar *s = [[[Seminar alloc]
					   initWithIndex:[rs intForColumn:@"id"]
					   Title:[rs stringForColumn:@"title"]
					   Location:[rs stringForColumn:@"location"]
					   Importance:[rs intForColumn:@"importance"]
					   Notes:[rs stringForColumn:@"notes"]
					   Speaker:[rs stringForColumn:@"speaker"]
					   Datetime:[rs stringForColumn:@"time"]
					   Photos:[rs stringForColumn:@"photos"]
					   TsId:[rs intForColumn:@"tsId"]]
					  autorelease];
		[rs close];
		return s;
	}
	return nil;
}

-(NSMutableArray *) select:(int)sortIndex{
	NSLog(@"sort index: %d", sortIndex);
	
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:0] ;
	
	
	NSString *sql = nil;
	if(sortIndex==0){
		sql = @"SELECT * FROM Education order by time";
	}else {
		sql = @"SELECT * FROM Education order by importance";
	}
	
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		Seminar *s = [[Seminar alloc]
					  initWithIndex:[rs intForColumn:@"id"]
					  Title:[rs stringForColumn:@"title"]
					  Location:[rs stringForColumn:@"location"]
					  Importance:[rs intForColumn:@"importance"]
					  Notes:[rs stringForColumn:@"notes"]
					  Speaker:[rs stringForColumn:@"speaker"]
					  Datetime:[rs stringForColumn:@"time"]
					  Photos:[rs stringForColumn:@"photos"]
					  TsId:[rs intForColumn:@"tsId"]];	
		
		
		[result addObject:s];
		[s release];
	}
	[rs close];
	return result;
}

-(void)insertWithTitle:(NSString *)title Location:(NSString *)location Importance:(int)importance Notes:(NSString *)notes  Speaker:(NSString *)speaker Datetime:(NSString *)datetime Photos:(NSString *)photos TsId:(int)tsId{
	NSLog(@"in insert");
	[db executeUpdate:[self setTable:@"INSERT INTO %@ (title, location, importance, notes, speaker, time, photos, tsId) VALUES (?,?,?,?,?,?,?)"], title, location, [NSNumber numberWithInt:importance], notes, speaker, datetime, photos, [NSNumber numberWithInt:tsId]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}

-(BOOL)updateAt:(int)index Title:(NSString *)title Location:(NSString *)location Importance:(int)importance Notes:(NSString *)notes  Speaker:(NSString *)speaker Datetime:(NSString *)datetime Photos:(NSString *)photos TsId:(int)tsId{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET title=?, location=?, importance=?, notes=?, speaker=?, time=?, photos=? WHERE id=?"], title, location, [NSNumber numberWithInt:importance], notes, speaker, datetime, photos, [NSNumber numberWithInt:index]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
	return success;
}

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
