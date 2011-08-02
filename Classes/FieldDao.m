//
//  FieldDao.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FieldDao.h"

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "Field.h"



@implementation FieldDao


-(NSString *)setTable:(NSString *)sql{
	return [NSString stringWithFormat:sql,  @"Field"];
}


// SELECT
-(Field *)getFieldById:(int)index{
	
	FMResultSet *rs = [db executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"], [NSNumber numberWithInt:index]];
	if ([rs next]) {	
		Field *f = [[[Field alloc] initWithIndex:[rs intForColumn:@"id"] 
											Name:[rs stringForColumn:@"name"] 
									  Importance:[rs intForColumn:@"importance"] 
										 Address:[rs stringForColumn:@"address"] 
											Time:[rs stringForColumn:@"time"] 
										   Notes:[rs stringForColumn:@"notes"] 
										  Photos:[rs stringForColumn:@"photos"]  
										HomePage:[rs stringForColumn:@"homePage"]  
											TsId:[rs intForColumn:@"tsId"]]
						autorelease];
		[rs close];
		return f;
	}
	return nil;
}

// SELECT
-(NSMutableArray *)select:(int)sortIndex{
	
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:0] ;
	
	NSString *sql = nil;
	if(sortIndex==0){
		sql = @"SELECT * FROM Field order by time";
	}else {
		sql = @"SELECT * FROM Field order by importance";
	}
	
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		Field *f = [[Field alloc] initWithIndex:[rs intForColumn:@"id"] 
											Name:[rs stringForColumn:@"name"] 
									  Importance:[rs intForColumn:@"importance"]
										 Address:[rs stringForColumn:@"address"]  
											Time:[rs stringForColumn:@"time"] 
										   Notes:[rs stringForColumn:@"notes"] 
										  Photos:[rs stringForColumn:@"photos"]  
										HomePage:[rs stringForColumn:@"homePage"]  
											TsId:[rs intForColumn:@"tsId"]];
		
		
		[result addObject:f];
		[f release];
	}
	[rs close];
	return result;
}

// INSERT

-(void)insertWithTitle:(NSString *)name Importance:(int)importance Address:(NSString *)address Time:(NSString *)time Notes:(NSString *)notes Photos:(NSString *)photos HomePage:(NSString *)homePage TsId:(int)tsId{
	NSLog(@"in insert");
	[db executeUpdate:[self setTable:@"INSERT INTO %@ (name, importance, address, time, notes, photos, homePage, tsId) VALUES (?,?,?,?,?,?,?,?)"], name, [NSNumber numberWithInt:importance], address, time, notes, photos, homePage, [NSNumber numberWithInt:tsId]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}

// UPDATE
-(BOOL)updateAt:(int)index Name:(NSString *)name Importance:(int)importance Address:(NSString *)address Time:(NSString *)time Notes:(NSString *)notes Photos:(NSString *)photos HomePage:(NSString *)homePage TsId:(int)tsId{
	BOOL success = YES;
	[db executeUpdate:[self setTable:@"UPDATE %@ SET name=?, importance=?, address=?, time=?, notes=?, photos=?, homePage=? WHERE id=?"], name, [NSNumber numberWithInt:importance], address, time, notes, photos, homePage, [NSNumber numberWithInt:index]];
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