//
//  CompanyDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CompanyDao.h"

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "Company.h"

@implementation CompanyDao

-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"Company1"];
}


// SELECT
-(Company *)getCompanyById:(int)index{
	
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
	if ([rs next]) {	
		Company *c = [[[Company alloc]
						initWithIndex:[rs intForColumn:@"id"]
						Name:[rs stringForColumn:@"name"]
					    Booth:[rs stringForColumn:@"booth"]
						Importance:[rs intForColumn:@"importance"]
						Notes:[rs stringForColumn:@"notes"]
						Photos:[rs stringForColumn:@"photos"]
						HomePage:[rs stringForColumn:@"homePage"]
					    TsId:[rs intForColumn:@"tsId"]]
					   autorelease];
		[rs close];
		return c;
	}
	return nil;
}

// SELECT
-(NSMutableArray *)select:(int)sortIndex{
	NSLog(@"sort index: %d", sortIndex);
	
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:0] ;
	
	
	NSString *sql = nil;
	if(sortIndex==0){
		sql = @"SELECT * FROM Company1 order by name";
	}else {
		sql = @"SELECT * FROM Company1 order by importance";
	}

	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		Company *c = [[Company alloc]
					   initWithIndex:[rs intForColumn:@"id"]
					   Name:[rs stringForColumn:@"name"]
					   Booth:[rs stringForColumn:@"booth"]
					   Importance:[rs intForColumn:@"importance"]
					   Notes:[rs stringForColumn:@"notes"]
					   Photos:[rs stringForColumn:@"photos"]
					   HomePage:[rs stringForColumn:@"homePage"]
					   TsId:[rs intForColumn:@"tsId"]];	
		
		
		[result addObject:c];
		[c release];
	}
	[rs close];
	return result;
}

// INSERT
-(void)insertWithTitle:(NSString *)name Booth:(NSString *)booth Importance:(int)importance Notes:(NSString *)notes  Photos:(NSString *)photos HomePage:(NSString *)homePage TsId:(int)tsId{
	NSLog(@"in insert");
	[db executeUpdate:[self setTable:@"INSERT INTO %@ (name, booth, importance, notes, photos, homePage, tsId) VALUES (?,?,?,?,?,?,?)"], name, booth, [NSNumber numberWithInt:importance], notes, photos, homePage, [NSNumber numberWithInt:tsId]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}

// UPDATE
-(BOOL)updateAt:(int)index Name:(NSString *)name Booth:(NSString *)booth Importance:(int)importance Notes:(NSString *)notes  Photos:(NSString *)photos HomePage:(NSString *)homePage TsId:(int)tsId{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET name=?, booth=?, importance=?, notes=?, photos=?, homePage=? WHERE id=?"], name, booth, [NSNumber numberWithInt:importance], notes, photos, homePage, [NSNumber numberWithInt:index]];
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