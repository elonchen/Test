//
//  NoteLabelCell.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoteLabelCell.h"
#import "Constants.h"

@implementation NoteLabelCell

@synthesize labelName;
@synthesize labelValue;
@synthesize delegate;

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

-(IBAction)todoClicked:(id)sender{

}

- (void)dealloc {
	[self.labelName release];
	[self.labelValue release];
    [super dealloc];
}

- (void)layoutSubviews {
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 
	
	labelName.textColor=[Constants editLabelTextColor];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    //NSLog(@"tag %@",touch);
//    if([touch view] == labelName)
//	{
//		NSLog(@"importance clicked");
//		[delegate noteLabelCell:self labelClicked:(NSString *)labelValue.text];
//	}
			[delegate noteLabelCell:self labelClicked:(NSString *)labelValue.text];
} 

@end
