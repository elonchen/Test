//
//  ToDoDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ToDoDao.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@implementation ToDoDao


-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"ToDo"];
}


// SELECT
-(ToDo *)getToDoItemById:(int)index{
	
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
	if ([rs next]) {	
		ToDo *e = [[[ToDo alloc]	   initWithIndex:[rs intForColumn:@"id"] 
												   Title:[rs stringForColumn:@"title"] 
													  By:[rs stringForColumn:@"by"] 
											  Importance:[rs intForColumn:@"importance"]  
													Time:[rs stringForColumn:@"time"]
												  Status:[rs stringForColumn:@"status"]
												  Detail:[rs stringForColumn:@"detail"]
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
		sql = @"SELECT * FROM ToDo order by time";
	}else {
		sql = @"SELECT * FROM ToDo order by importance";
	}
	
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		ToDo *e = [[ToDo alloc]          initWithIndex:[rs intForColumn:@"id"] 
												 Title:[rs stringForColumn:@"title"] 
													By:[rs stringForColumn:@"by"] 
											Importance:[rs intForColumn:@"importance"]  
												  Time:[rs stringForColumn:@"time"]
												Status:[rs stringForColumn:@"status"]
												Detail:[rs stringForColumn:@"detail"]
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
- (id)insertWithTitle:(NSString *)title By:(NSString *)by Importance:(int)importance Time:(NSString *)time Status:(NSString *)status Detail:(NSString *)detail Notes:(NSString *)notes Photos:(NSString *)photos TsId:(int)tsId{
	NSLog(@"in insert");
	[db executeUpdate:[self setTable:@"INSERT INTO %@ (title, by, importance, time, status, detail, notes, photos, tsId) VALUES (?,?,?,?,?,?,?,?,?)"], title, by, [NSNumber numberWithInt:importance], time, status, detail, notes, photos, [NSNumber numberWithInt:tsId]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}

// UPDATE
-(BOOL)updateAt:(int)index Title:(NSString *)title By:(NSString *)by Importance:(int)importance Time:(NSString *)time Status:(NSString *)status Detail:(NSString *)detail Notes:(NSString *)notes Photos:(NSString *)photos TsId:(int)tsId{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET title=?, by=?, importance=?, time=?, status=?, detail=?, notes=?, photos=? WHERE id=?"], title, by, [NSNumber numberWithInt:importance], time, status, detail, notes, photos, [NSNumber numberWithInt:index]];
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
