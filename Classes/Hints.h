//
//  Hints.h
//  TradeShowInfo
//
//  Created by brightcreek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Hints : NSObject {
	int index;
	NSString *name;
	NSString *show;
	int tsId;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *show;


- (id)initWithIndex:(int)newIndex Name:(NSString *)newName Show:(NSString *)newShow TsId:(int)newTsId;
- (int)getIndex;


@end
