//
//  ImportanceCell.m
//  TradeShowInfo
//
//  Created by Elon on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImportanceCell.h"
#import "Constants.h"

@implementation ImportanceCell
@synthesize labelImportance,labelLine,labelNumber;
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


- (void)dealloc {
	[labelLine release];
	[labelImportance release];
	[labelNumber release];
    [super dealloc];
}


- (void)layoutSubviews {
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 
    //NSLog(@"test cell load");
	labelLine.backgroundColor=[Constants labelLineColor];
	labelImportance.textColor=[Constants editLabelTextColor];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    NSLog(@"tag %@",[touch view]);
	
	NSLog(@"name %@",labelNumber);
	
    if([touch view] == labelNumber)
	{
		NSLog(@"importance clicked");
		[delegate importanceCell:self numberClicked:labelNumber.text];
	}
} 

@end
