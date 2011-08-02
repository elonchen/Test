//
//  TradeShow.m
//  TradeShowInfo
//
//  Created by brightcreek on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TradeShow.h"

@implementation TradeShow
@synthesize name, begin, end;

- (id)initWithIndex:(int)newIndex Name:(NSString *)newName Begin:(NSString *)newBegin End:(NSString *)newEnd{
	if(self = [super init]){
		index = newIndex;
		self.name = newName;
		self.begin = newBegin;
		self.end = newEnd;
	}
	return self;
}

- (int)getIndex{
	return index;
}

- (void)dealloc {
	[name release];
	[begin release];
	[end release];
	[super dealloc];
}

@end