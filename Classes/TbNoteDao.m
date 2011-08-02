//
//  TbNoteDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "TbNoteDao.h"
#import "TbNote.h"

@implementation TbNoteDao

-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"TbNote"];
}
// SELECT
-(NSMutableArray *)select{
	NSMutableArray *result = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@"]];
	while ([rs next]) {
		TbNote *tr = [[TbNote alloc]
					  initWithIndex:[rs intForColumn:@"id"]
					  Title:[rs stringForColumn:@"title"]
					  Body:[rs stringForColumn:@"body"]
					  ];
		[result addObject:tr];
		[tr release];
	}
	[rs close];
	return result;
}
// INSERT
-(void)insertWithTitle:(NSString *)title Body:(NSString *)body{
	[db executeUpdate:[self setTable:@"INSERT INTO %@ (title, body) VALUES (?,?)"], title, body];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}
// UPDATE
-(BOOL)updateAt:(int)index Title:(NSString *)title Body:(NSString *)body{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET title=?, body=? WHERE id=?"], title, body, [NSNumber numberWithInt:index]];
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