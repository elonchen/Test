//
//  Field.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Field : NSObject {
	int index;
	NSString *name;
	int importance;
	NSString *address;
	NSString *time;
	NSString *notes;
	NSString *photos;
	NSString *homePage;
	int tsId;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *photos;
@property (nonatomic, retain) NSString *homePage;


- (id)initWithIndex:(int)newIndex Name:(NSString *)newName Importance:(int)newImportance Address:(NSString *)newAddress Time:(NSString *)newTime Notes:(NSString *)newNotes Photos:(NSString *)newPhotos HomePage:(NSString *)newHomePage TsId:(int)newTsId;
- (int)getIndex;
- (int)getImportance;

@end

