//
//  CalendarDao.h
//  TradeShowInfo
//
//  Created by brightcreek on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseDao.h"
#import "Calendar.h"

@interface CalendarDao : BaseDao {
}

-(Calendar *)getCalendarById:(int)index;
-(NSMutableArray *)select:(int)sortIndex;
-(void)insertWithTitle:(NSString *)title Importance:(int)importance Begin:(NSString *)begin End:(NSString *)end Notes:(NSString *)notes;
-(BOOL)updateAt:(int)index Title:(NSString *)title Importance:(int)importance Begin:(NSString *)begin End:(NSString *)end Notes:(NSString *)notes;
-(BOOL)deleteAt:(int)index;

@end
