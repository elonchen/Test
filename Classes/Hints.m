//
//  Hints.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Hints.h"


@implementation Hints


@synthesize name, show;

- (id)initWithIndex:(int)newIndex Name:(NSString *)newName Show:(NSString *)newShow TsId:(int)newTsId{
	if(self = [super init]){
		index = newIndex;
		self.name = newName;
		self.show = newShow;
		tsId = newTsId;
	}
	return self;
}

- (int)getIndex{
	return index;
}


- (void)dealloc {
	[name release];
	[show release];
	[super dealloc];
}

@end