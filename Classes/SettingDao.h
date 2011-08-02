//
//  SettingDao.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"
#import "Setting.h"

@interface SettingDao : BaseDao {

}

-(Setting *)selectTypeValueWithTypeName:(NSString *)typeName;
-(BOOL)updateWithTypeName:(NSString *)typeName TypeValue:(NSString *)typeValue;

@end
