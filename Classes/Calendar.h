//
//  Calendar.h
//  TradeShowInfo
//
//  Created by brightcreek on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Calendar : NSObject {
	int index;
	NSString *title;
	int importance;
	NSString *begin;
	NSString *end;
	NSString *notes;
	NSString *photos;
	
	NSString *weekDay;
	NSString *day;
	NSString *time;
	
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *begin;
@property (nonatomic, retain) NSString *end;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *photos;
@property (nonatomic, retain) NSString *weekDay;
@property (nonatomic, retain) NSString *day;
@property (nonatomic, retain) NSString *time;

- (id)initWithIndex:(int)newIndex Title:(NSString *)newTitle Importance:(int)newImportance Begin:(NSString *)newBegin End:(NSString *)newEnd Notes:(NSString *)newNotes;
- (int)getIndex;
- (int)getImportance;

@end

