//
//  ToDo.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//
#import "ToDo.h"


@implementation ToDo


@synthesize title, by, time, status, detail, notes, photos;

- (id)initWithIndex:(int)newIndex Title:(NSString *)newTitle By:(NSString *)newBy Importance:(int)newImportance Time:(NSString *)newTime Status:(NSString *)newStatus Detail:(NSString *)newDetail Notes:(NSString *)newNotes Photos:(NSString *)newPhotos TsId:(int)newTsId{
	if(self = [super init]){
		index = newIndex;
		self.title = newTitle;
		self.by = newBy;
		importance = newImportance;
		self.time = newTime;
		self.status = newStatus;
		self.detail = newDetail;
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
	[by release];
	[time release];
	[status release];
	[detail release];
	[photos release];
	[notes release];
	[super dealloc];
}

@end