//
//  Calendar.m
//  TradeShowInfo
//
//  Created by brightcreek on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Calendar.h"


@implementation Calendar

@synthesize title, begin, end, notes, photos;
@synthesize weekDay, day, time;


- (id)initWithIndex:(int)newIndex Title:(NSString *)newTitle Importance:(int)newImportance Begin:(NSString *)newBegin End:(NSString *)newEnd Notes:(NSString *)newNotes{
	if(self = [super init]){
		index = newIndex;
		self.title = newTitle;
		importance = newImportance;
		self.begin = newBegin;
		self.end = newEnd;
		self.notes = newNotes;
		
	}
	return self;
}

- (int)getIndex{
	return index;
}
- (int)getImportance{
	return importance;
}

- (void)dealloc {
	[title release];
	[begin release];
	[end release];
	[notes release];
	[photos release];
	[super dealloc];
}

@end