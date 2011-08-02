//
//  FieldDao.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"
#import "Field.h"

@interface FieldDao : BaseDao {

}


-(Field *)getFieldById:(int)index;
-(NSMutableArray *)select:(int)sortIndex;
// INSERT
-(void)insertWithTitle:(NSString *)name Importance:(int)importance Address:(NSString *)address Time:(NSString *)time Notes:(NSString *)notes Photos:(NSString *)photos HomePage:(NSString *)homePage TsId:(int)tsId;
// UPDATE
-(BOOL)updateAt:(int)index Name:(NSString *)name Importance:(int)importance Address:(NSString *)address Time:(NSString *)time Notes:(NSString *)notes Photos:(NSString *)photos HomePage:(NSString *)homePage TsId:(int)tsId;

@end