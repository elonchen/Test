//
//  StatusDetailPhotoCell.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StatusDetailPhotoCell.h"


@implementation StatusDetailPhotoCell
@synthesize myTaleView,statusCell,detailCell;

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

- (void)layoutSubviews {
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 
	myTaleView.backgroundColor=[Constants backgroundColor];
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"NotePhotoCell";
    
	if (indexPath.section==0) {
		StatusCell *cell=(StatusCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (statusCell==nil) {			
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"StatusCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			
			//cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
			//cell.selectionStyle = UITableViewCellSelectionStyleNone;
			//cell.labelName.text=@"Status";
//			cell.labelName.textColor=[Constants labelTextColor];
//			cell.labelName.font=[UIFont boldSystemFontOfSize:labelTextFontSize];
			statusCell=(StatusCell *)cell;
			[statusCell retain];
		}
		else {
			cell=statusCell;
		}
		return cell;
	}
	else if (indexPath.section==1) {
		NoteLabelCell *cell=(NoteLabelCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (detailCell==nil) {			
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NoteLabelCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			
			//cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//			cell.selectionStyle = UITableViewCellSelectionStyleNone;
//			cell.labelName.text=@"Note";
//			cell.labelName.textColor=[Constants labelTextColor];
//			cell.labelName.font=[UIFont boldSystemFontOfSize:labelTextFontSize];
			detailCell=(NoteLabelCell *)cell;
			[detailCell retain];
		}
		else {
			cell=detailCell;
		}
		return cell;
	}
	else if(indexPath.section==2) {
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil)
		{
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
		cell.textLabel.text = @"   Photos";
		cell.textLabel.textAlignment = UITextAlignmentLeft;
		cell.textLabel.textColor = [Constants labelTextColor];
		cell.textLabel.font = [UIFont boldSystemFontOfSize:labelTextFontSize];
		
		cell.detailTextLabel.text = @"  add new";
		cell.detailTextLabel.textColor = [UIColor grayColor];
		cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:labelTextFontSize];
		
		return cell;
	}	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 44.0;	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[statusCell release];
	[detailCell release];
	[self.myTaleView release];
    [super dealloc];
}


@end
