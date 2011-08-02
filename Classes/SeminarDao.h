//
//  SeminarDao.h
//  TradeShowInfo
//
//  Created by Elon on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"
#import "Seminar.h"

@interface SeminarDao : BaseDao {
	
}

-(Seminar *) getSeminarById:(int) index;
-(NSMutableArray *) select:(int) sortIndex;

-(void)insertWithTitle:(NSString *)title Location:(NSString *)location Importance:(int)importance Notes:(NSString *)notes Speaker:(NSString *) speaker Datetime:(NSString *)datetime Photos:(NSString *)photos TsId:(int)tsId;
-(BOOL)updateAt:(int)index Title:(NSString *)title Location:(NSString *)location Importance:(int)importance Notes:(NSString *)notes Speaker:(NSString *)speaker Datetime:(NSString *)datetime Photos:(NSString *)photos TsId:(int)tsId;
-(BOOL)deleteAt:(int)index;

@end
