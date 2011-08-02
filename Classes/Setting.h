//
//  Setting.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Setting : NSObject {
	int index;
	NSString *typeName;
	NSString *typeValue;
	int tsId;
}

@property (nonatomic, retain) NSString *typeName;
@property (nonatomic, retain) NSString *typeValue;


- (id)initWithIndex:(int)newIndex TypeName:(NSString *)newTypeName TypeValue:(NSString *)newTypeValue TsId:(int)newTsId;
- (int)getIndex;


@end
