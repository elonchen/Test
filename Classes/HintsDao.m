//
//  HintsDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HintsDao.h"
#import	"Hints.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@implementation HintsDao

-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"Hints"];
}

-(Hints *)getHintsById:(int)index{
	
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
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

-(BOOL)selectHintStatus:(int)index{
	Hints *h = [self getHintsById:index];
	if([h.show isEqualToString:@"true"]){
		return YES;
	}else {
		return NO;
	}

}

-(BOOL)closeHintAtIndex:(int)index{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET show = ? WHERE id=?"],@"false", [NSNumber numberWithInt:index]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
	return success;
}

-(BOOL)reopenAll{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET show = ?"],@"true"];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
	return success;
}

-(BOOL)closeAll{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET show = ?"],@"false"];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
	return success;
}

@end
