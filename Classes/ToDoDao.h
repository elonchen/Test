//
//  ToDoDao.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"
#import "ToDo.h"

@interface ToDoDao : BaseDao {

}

-(ToDo *)getToDoItemById:(int)index;
-(NSMutableArray *)select:(int)sortIndex;
// INSERT
- (id)insertWithTitle:(NSString *)title By:(NSString *)by Importance:(int)importance Time:(NSString *)time Status:(NSString *)status Detail:(NSString *)detail Notes:(NSString *)notes Photos:(NSString *)photos TsId:(int)tsId;
// UPDATE
-(BOOL)updateAt:(int)index Title:(NSString *)title By:(NSString *)by Importance:(int)importance Time:(NSString *)time Status:(NSString *)status Detail:(NSString *)detail Notes:(NSString *)notes Photos:(NSString *)photos TsId:(int)tsId;

@end
