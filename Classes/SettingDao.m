//
//  SettingDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingDao.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@implementation SettingDao

-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"Setting"];
}

-(Setting *)selectTypeValueWithTypeName:(NSString *)typeName{
	NSString *sql = [self setTable:@"SELECT * FROM %@ where typeName=?"] ;
	
	Setting *s = [Setting alloc];
	FMResultSet *rs = [db executeQuery:sql, typeName];
	if ([rs next]) {
		[s	initWithIndex:[rs intForColumn:@"id"] 
				 TypeName:[rs stringForColumn:@"typeName"] 
			    TypeValue:[rs stringForColumn:@"typeValue"]
					 TsId:[rs intForColumn:@"tsId"]];
		//[s release];
	}
	[rs close];
	return s;
}

-(BOOL)updateWithTypeName:(NSString *)typeName TypeValue:(NSString *)typeValue{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET typeValue=? WHERE typeName=?"], typeValue, typeName];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
	return success;
}
@end
