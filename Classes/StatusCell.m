//
//  StatusCell.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StatusCell.h"
#import "Constants.h"

@implementation StatusCell
@synthesize labelName;
@synthesize switchName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}

-(IBAction)switchChanged:(id)sender{
	
}

- (void)dealloc {
	[self.labelName release];
	[self.switchName release];
    [super dealloc];
}

- (void)layoutSubviews {
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 
	
	labelName.textColor=[Constants editLabelTextColor];
	
}

@end
