//
//  TradeShow.h
//  TradeShowInfo
//
//  Created by brightcreek on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TradeShow : NSObject {
	int index;
	NSString *name;
	NSString *begin;
	NSString *end;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *begin;
@property (nonatomic, retain) NSString *end;

- (id)initWithIndex:(int)newIndex Name:(NSString *)newName Begin:(NSString *)newBegin End:(NSString *)newEnd;
- (int)getIndex;

@end

