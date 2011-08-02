//
//  EventTitleCell.m
//  TradeShowInfo
//
//  Created by Elon on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventTitleCell.h"


@implementation EventTitleCell
@synthesize title;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}



- (void)dealloc {
	[title release];
    [super dealloc];
}


@end
