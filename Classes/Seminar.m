//
//  Seminar.m
//  TradeShowInfo
//
//  Created by Elon on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Seminar.h"


@implementation Seminar

@synthesize title, location, speaker, datetime, notes, photos;

-(id) initWithIndex:(int) newIndex Title:(NSString *) newTitle Importance:(int) newImportance Location:(NSString *) newLocation Speaker:(NSString *) newSpeaker Datetime:(NSString *) newDatetime Notes:(NSString *) newNotes Photos:(NSString *) newPhotos TsId:(int)newTsId{
	if(self = [super init]){
		index = newIndex;
		self.title = newTitle;
		importance = newImportance;
		self.location = newLocation;
		self.speaker = newSpeaker;
		self.datetime = newDatetime;
		self.notes = newNotes;
		self.photos = newPhotos;
		tsId = newTsId;
	}
	return self;
}

-(int) getIndex{
	return index;
}

-(int) getImportance{
	return importance;
}

-(void) dealloc{
	[title release];
	[location release];
	[speaker release];
	[datetime release];
	[notes release];
	[photos release];
	[super dealloc];
}

@end
