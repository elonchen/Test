//
//  TbNoteDao.h
//  TradeShowInfo
//
//  Created by brightcreek on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"

@interface TbNoteDao : BaseDao {
}

-(NSMutableArray *)select;
-(void)insertWithTitle:(NSString *)title Body:(NSString *)body;
-(BOOL)updateAt:(int)index Title:(NSString *)title Body:(NSString *)body;
-(BOOL)deleteAt:(int)index;

@end

