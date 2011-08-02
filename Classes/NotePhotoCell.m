//
//  NotePhotoCell.m
//  TradeShowInfo
//
//  Created by Elon on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NotePhotoCell.h"
#import "EditNotesField.h"

@implementation NotePhotoCell
@synthesize myTaleView,notesCell;

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
	[notesCell release];
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
	return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"NotePhotoCell";
    
	
	if (indexPath.section==0) {
		NoteLabelCell *cell=(NoteLabelCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (notesCell==nil) {			
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NoteLabelCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			
			notesCell= (NoteLabelCell *)cell;
		}
		else {
			cell=notesCell;
		}
		return cell;
	}
	else if(indexPath.section==1) {
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil)
		{
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
		cell.textLabel.text = @"Photos";
		cell.textLabel.textAlignment = UITextAlignmentLeft;
		cell.textLabel.textColor = [Constants editLabelTextColor];
		cell.textLabel.font = [UIFont systemFontOfSize:17.0];
		
		cell.detailTextLabel.text = @"  add new";
		cell.detailTextLabel.textColor = [UIColor lightGrayColor];
		cell.detailTextLabel.font = [UIFont systemFontOfSize:labelTextFontSize];
		
		return cell;
	}	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 44.0;	
}

@end
