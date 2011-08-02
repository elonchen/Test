//
//  Seminar.h
//  TradeShowInfo
//
//  Created by Elon on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Seminar : NSObject {
	int index;
	NSString *title;
	int importance;
	NSString *location;
	NSString *speaker;
	NSString *datetime;
	NSString *notes;
	NSString *photos;
	int tsId;
}

@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *location;
@property (nonatomic,retain) NSString *speaker;
@property (nonatomic,retain) NSString *datetime;
@property (nonatomic,retain) NSString *notes;
@property (nonatomic,retain) NSString *photos;

-(id) initWithIndex:(int) newIndex Title:(NSString *) newTitle Importance:(int) newImportance Location:(NSString *) newLocation Speaker:(NSString *) newSpeaker Datetime:(NSString *) newDatetime Notes:(NSString *) newNotes Photos:(NSString *) newPhotos TsId:(int)newTsId;
-(int) getIndex;
-(int) getImportance;

@end
