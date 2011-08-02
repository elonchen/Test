//
//  Education.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Education : NSObject {
	int index;
	NSString *title;
	NSString *location;
	int importance;
	NSString *speaker;
	NSString *time;
	NSString *notes;
	NSString *photos;
	int tsId;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *speaker;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *photos;


- (id)initWithIndex:(int)newIndex Title:(NSString *)newTitle Location:(NSString *)newLocation Importance:(int)newImportance Speaker:(NSString *)newSpeaker Time:(NSString *)newTime Notes:(NSString *)newNotes Photos:(NSString *)newPhotos TsId:(int)newTsId;
- (int)getIndex;
- (int)getImportance;

@end
