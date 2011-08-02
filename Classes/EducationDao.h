//
//  EducationDao.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"
#import "Education.h"


@interface EducationDao : BaseDao {

}


-(Education *)getEducationById:(int)index;
-(NSMutableArray *)select:(int)sortIndex;
// INSERT
-(void)insertWithTitle:(NSString *)title Location:(NSString *)location Importance:(int)importance Speaker:(NSString *)speaker Time:(NSString *)time Notes:(NSString *)notes Photos:(NSString *)photos TsId:(int)tsId;
// UPDATE
-(BOOL)updateAt:(int)index Title:(NSString *)title Location:(NSString *)location Importance:(int)importance Speaker:(NSString *)speaker Time:(NSString *)time Notes:(NSString *)notes Photos:(NSString *)photos TsId:(int)tsId;
	

@end
