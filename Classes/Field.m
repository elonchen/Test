//
//  Field.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Field.h"


@implementation Field


@synthesize name, address, time, notes, photos, homePage;

- (id)initWithIndex:(int)newIndex Name:(NSString *)newName Importance:(int)newImportance Address:(NSString *)newAddress Time:(NSString *)newTime Notes:(NSString *)newNotes Photos:(NSString *)newPhotos HomePage:(NSString *)newHomePage TsId:(int)newTsId{
	if(self = [super init]){
		index = newIndex;
		self.name = newName;
		importance = newImportance;
		self.address = newAddress;
		self.time = newTime;
		self.notes = newNotes;
		self.photos = newPhotos;
		self.homePage = newHomePage;
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
	
	[name release];
	[address release];
	[time release];
	[photos release];
	[notes release];
	[homePage release];
	[super dealloc];
}

@end