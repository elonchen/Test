//
//  TbNote.m
//  TradeShowInfo
//
//  Created by brightcreek on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TbNote.h"

@implementation TbNote
@synthesize title, body;

- (id)initWithIndex:(int)newIndex Title:(NSString *)newTitle Body:(NSString *)newBody{
	if(self = [super init]){
		index = newIndex;
		self.title = newTitle;
		self.body = newBody;
	}
	return self;
}

- (int)getIndex{
	return index;
}

- (void)dealloc {
	[title release];
	[body release];
	[super dealloc];
}

@end