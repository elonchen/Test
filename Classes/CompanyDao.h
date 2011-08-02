//
//  CompanyDao.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



#import "BaseDao.h"
#import "Company.h"

@interface CompanyDao : BaseDao {
}


-(Company *)getCompanyById:(int)index;
-(NSMutableArray *)select:(int)sortIndex;
// INSERT
-(void)insertWithTitle:(NSString *)name Booth:(NSString *)booth Importance:(int)importance Notes:(NSString *)notes  Photos:(NSString *)photos HomePage:(NSString *)homePage TsId:(int)tsId;
-(BOOL)updateAt:(int)index Name:(NSString *)name Booth:(NSString *)booth Importance:(int)importance Notes:(NSString *)notes  Photos:(NSString *)photos HomePage:(NSString *)homePage TsId:(int)tsId;
-(BOOL)deleteAt:(int)index;

@end
