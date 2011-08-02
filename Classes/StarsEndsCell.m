//
//  StarsEndsCell.m
//  TradeShowInfo
//
//  Created by Elon on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StarsEndsCell.h"
#import "Constants.h"

@implementation StarsEndsCell
//@synthesize startLeftLabel,startRightLabel,endLeftLabel,endRightLabel;
@synthesize leftLabel,rightLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
	leftLabel.font=[UIFont boldSystemFontOfSize:labelTextFontSize];
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
//	[startLeftLabel release];
//	[startRightLabel release];
//	[endLeftLabel release];
//	[endRightLabel release];
	[leftLabel release];
	[rightLabel release];
    [super dealloc];
}


- (void)layoutSubviews {
	[super layoutSubviews];
//	startLeftLabel.textColor=[Constants labelTextColor];
//	endLeftLabel.textColor=[Constants labelTextColor];	
	leftLabel.textColor=[Constants editLabelTextColor];	
}

@end
