//
//  CompanyNameAndBoothNumberCell.m
//  TradeShowInfo
//
//  Created by Elon on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CompanyNameAndBoothNumberCell.h"
#import "Constants.h"

@implementation CompanyNameAndBoothNumberCell
@synthesize labelLine;
@synthesize inputCompanyName;
@synthesize inputBoothNumber;
@synthesize labelLineV;
@synthesize	labelBooth;

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
	[labelLine release];
	[inputBoothNumber release];
	[inputCompanyName release];
	[labelLineV	release];
	[labelBooth release];
    [super dealloc];
}

- (void)layoutSubviews {
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 

	labelLine.backgroundColor=[Constants labelLineColor];
	labelLineV.backgroundColor=[Constants labelLineColor];
	labelBooth.textColor=[Constants editLabelTextColor];
}

-(IBAction)doneKeyClicked:(id)sender{
	[sender resignFirstResponder];
}
@end
