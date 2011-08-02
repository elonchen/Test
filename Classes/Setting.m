//
//  Setting.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Setting.h"


@implementation Setting


@synthesize typeName, typeValue;

- (id)initWithIndex:(int)newIndex TypeName:(NSString *)newTypeName TypeValue:(NSString *)newTypeValue TsId:(int)newTsId{
	if(self = [super init]){
		index = newIndex;
		self.typeName = newTypeName;
		self.typeValue = newTypeValue;
		tsId = newTsId;
	}
	return self;
}

- (int)getIndex{
	return index;
}


- (void)dealloc {
	[typeName release];
	[typeValue release];
	[super dealloc];
}

@end