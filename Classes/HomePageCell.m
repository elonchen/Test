//
//  HomePageCell.m
//  TradeShowInfo
//
//  Created by Elon on 3/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomePageCell.h"
#import "Constants.h"

@implementation HomePageCell
@synthesize labelName;
@synthesize textField; 

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
	[self.labelName release];
	[self.textField release];
    [super dealloc];
}


- (void)layoutSubviews {
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 
	
	labelName.textColor=[Constants editLabelTextColor];
	
}

-(void)doneClicked:(id)sender{
	[sender resignFirstResponder];
}
@end
