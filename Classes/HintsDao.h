//
//  HintsDao.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"
#import	"Hints.h"

@interface HintsDao : BaseDao {

}

-(Hints *)getHintsById:(int)index;
-(BOOL)selectHintStatus:(int)index;
-(BOOL)closeHintAtIndex:(int)index;
-(BOOL)reopenAll;
-(BOOL)closeAll;

@end
