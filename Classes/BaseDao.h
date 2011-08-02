//
//  BaseDao.h
//  TradeShowInfo
//
//  Created by brightcreek on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;

@interface BaseDao : NSObject {
	FMDatabase *db;
}

@property (nonatomic, retain) FMDatabase *db;

-(NSString *)setTable:(NSString *)sql;

@end

