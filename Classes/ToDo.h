//
//  ToDo.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ToDo : NSObject {
	int index;
	NSString *title;
	NSString *by;
	int importance;
	NSString *time;
	NSString *status;
	NSString *detail;
	NSString *notes;
	NSString *photos;
	int tsId;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *by;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *detail;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *photos;


- (id)initWithIndex:(int)newIndex Title:(NSString *)newTitle By:(NSString *)newBy Importance:(int)newImportance Time:(NSString *)newTime Status:(NSString *)newStatus Detail:(NSString *)newDetail Notes:(NSString *)newNotes Photos:(NSString *)newPhotos TsId:(int)newTsId;
- (int)getIndex;
- (int)getImportance;

@end