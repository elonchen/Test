//
//  SpeakerCell.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SpeakerCell.h"


@implementation SpeakerCell
@synthesize myTaleView,speakerCell;

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
	[speakerCell release];
	[self.myTaleView release];
    [super dealloc];
}

- (void)layoutSubviews {
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 
	myTaleView.backgroundColor=[Constants backgroundColor];
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"SpeakerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (indexPath.section==0) {
		if (speakerCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"HomePageCell" // not StarsEndsCell
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			speakerCell = (HomePageCell *)cell;
			[speakerCell retain];
		}else {
			cell = speakerCell;
		}	
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		return cell;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 44.0;	
}

@end
