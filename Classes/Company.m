//
//  Company.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Company.h"


@implementation Company

@synthesize name, booth, notes, photos, homePage;

- (id)initWithIndex:(int)newIndex Name:(NSString *)newName Booth:(NSString *)newBooth Importance:(int)newImportance Notes:(NSString *)newNotes Photos:(NSString *)newPhotos HomePage:(NSString *)newHomePage TsId:(int)newTsId{
	if(self = [super init]){
		index = newIndex;
		self.name = newName;
		self.booth = newBooth;
		importance = newImportance;
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
	[booth release];
	[photos release];
	[homePage release];
	[notes release];
	[super dealloc];
}

@end