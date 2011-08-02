//
//  TbNote.h
//  TradeShowInfo
//
//  Created by brightcreek on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TbNote : NSObject {
	int index;
	NSString *title;
	NSString *body;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *body;

- (id)initWithIndex:(int)newIndex Title:(NSString *)newTitle Body:(NSString *)newBody;
- (int)getIndex;

@end

