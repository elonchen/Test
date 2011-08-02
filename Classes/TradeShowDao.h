//
//  TradeShowDao.h
//  TradeShowInfo
//
//  Created by brightcreek on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseDao.h"
#import "TradeShow.h"

@interface TradeShowDao : BaseDao {
}

-(TradeShow *)getTradeShowById:(int)index;
-(NSMutableArray *)select;
-(void)insertWithTitle:(NSString *)name Begin:(NSString *)begin End:(NSString *)end;
-(BOOL)updateAt:(int)index Name:(NSString *)name Begin:(NSString *)begin End:(NSString *)end;
-(BOOL)deleteAt:(int)index;

@end