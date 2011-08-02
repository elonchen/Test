//
//  TradeShowDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TradeShowDao.h"

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "TradeShow.h"

@implementation TradeShowDao

-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"TradeShow"];
}

// SELECT
-(TradeShow *)getTradeShowById:(int)index{
	TradeShow *ts = [[TradeShow alloc] autorelease];
	
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
	if ([rs next]) {
	//	NSLog(@"ddd%@", [rs dataForColumn:@"begin"]);
		ts = [[TradeShow alloc]
				initWithIndex:[rs intForColumn:@"id"]
				Name:[rs stringForColumn:@"name"]
				Begin:[rs stringForColumn:@"begin"]
				End:[rs stringForColumn:@"end"]
				];
		[rs close];
		return ts;
	}
	
	return nil;
}

// SELECT
-(NSMutableArray *)select{
	NSMutableArray *result = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@"]];
	while ([rs next]) {
		
		TradeShow *ts = [[TradeShow alloc]
					  initWithIndex:[rs intForColumn:@"id"]
					  Name:[rs stringForColumn:@"name"]
					  Begin:[rs stringForColumn:@"begin"]
					  End:[rs stringForColumn:@"end"]
						 
					  ];
		[result addObject:ts];
		[ts release];
	}
	[rs close];
	return result;
}

// INSERT
-(void)insertWithTitle:(NSString *)name Begin:(NSString *)begin End:(NSString *)end{
	[db executeUpdate:[self setTable:@"INSERT INTO %@ (name, begin, end) VALUES (?,?,?)"], name, begin, end];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}
// UPDATE
-(BOOL)updateAt:(int)index Name:(NSString *)name Begin:(NSString *)begin End:(NSString *)end{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET name=?, begin=?, end=? WHERE id=?"], name, begin, end, [NSNumber numberWithInt:index]];
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