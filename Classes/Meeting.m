//
//  Meeting.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Meeting.h"


@implementation Meeting


@synthesize title, location, time, notes, photos;

- (id)initWithIndex:(int)newIndex Title:(NSString *)newTitle Location:(NSString *)newLocation Importance:(int)newImportance Time:(NSString *)newTime Notes:(NSString *)newNotes Photos:(NSString *)newPhotos TsId:(int)newTsId{
	if(self = [super init]){
		index = newIndex;
		self.title = newTitle;
		self.location = newLocation;
		importance = newImportance;
		self.time = newTime;
		self.notes = newNotes;
		self.photos = newPhotos;
		tsId = newTsId;
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
	[location release];
	[time release];
	[photos release];
	[notes release];
	[super dealloc];
}

@end