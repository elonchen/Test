//
//  Company.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Company : NSObject {
	int index;
	NSString *name;
	NSString *booth;
	int importance;
	NSString *notes;
	NSString *photos;
	NSString *homePage;
	int tsId;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *booth;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *photos;
@property (nonatomic, retain) NSString *homePage;


- (id)initWithIndex:(int)newIndex Name:(NSString *)newName Booth:(NSString *)newBooth Importance:(int)newImportance Notes:(NSString *)newNotes Photos:(NSString *)newPhotos HomePage:(NSString *)newHomePage TsId:(int)newTsId;
- (int)getIndex;
- (int)getImportance;

@end

