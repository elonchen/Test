//
//  ShowHintsCell.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ShowHintsCell.h"
#import "Constants.h"

@implementation ShowHintsCell

@synthesize labelName;
@synthesize button;
@synthesize hintsDao;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}

-(IBAction)hintsShowClicked:(id)sender{
	hintsDao = [[HintsDao alloc] init];
	[hintsDao reopenAll];
}

- (void)dealloc {
	[self.labelName release];
	[self.button release];
    [super dealloc];
}

- (void)layoutSubviews {
	//button.backgroundColor =[UIColor redColor];
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 
	
	labelName.textColor=[Constants editLabelTextColor];
	
}

@end
