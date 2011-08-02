//
//  Education.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Education.h"


@implementation Education



@synthesize title, location, speaker, time, notes, photos;

- (id)initWithIndex:(int)newIndex Title:(NSString *)newTitle Location:(NSString *)newLocation Importance:(int)newImportance Speaker:(NSString *)newSpeaker Time:(NSString *)newTime Notes:(NSString *)newNotes Photos:(NSString *)newPhotos TsId:(int)newTsId{
	if(self = [super init]){
		index = newIndex;
		self.title = newTitle;
		self.location = newLocation;
		importance = newImportance;
		self.speaker = newSpeaker;
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
	[speaker release];
	[time release];
	[photos release];
	[notes release];
	[super dealloc];
}

@end