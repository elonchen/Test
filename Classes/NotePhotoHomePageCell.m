//
//  NotePhotoHomePageCell.m
//  TradeShowInfo
//
//  Created by Elon on 3/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NotePhotoHomePageCell.h"



@implementation NotePhotoHomePageCell
@synthesize myTaleView,notesCell,homePageCell,deleteNoteCell,deletePhotoCell,deleteURLCell;

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
	[homePageCell release];
	[self.myTaleView release];
    [super dealloc];
}

- (void)layoutSubviews {
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 
	myTaleView.backgroundColor=[Constants backgroundColor];
	deleteNoteCell=0;
	deletePhotoCell=0;
	deleteURLCell=0;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//	if (deleteNoteCell==1) {
//		NSLog(@"deleteNoteCell==1");
//		return 2;
//	}
	return 3-deleteNoteCell-deletePhotoCell-deleteURLCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"NotePhotoHomePageCell";
    

	if (indexPath.section==0) {
		NoteLabelCell *cell=(NoteLabelCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (notesCell==nil) {			
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NoteLabelCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			
			//cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			
			cell.labelName.text=@"Note";
			cell.labelName.textColor=[Constants editLabelTextColor];
			cell.labelName.font=[UIFont boldSystemFontOfSize:labelTextFontSize];
			notesCell=cell;
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
		cell.textLabel.font = [UIFont boldSystemFontOfSize:labelTextFontSize];
		
		cell.detailTextLabel.text = @"  add new";
		cell.detailTextLabel.textColor = [UIColor grayColor];
		cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:labelTextFontSize];
		
		return cell;
	}
	else {
		HomePageCell *cell = (HomePageCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (homePageCell==nil) {			
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"HomePageCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			cell.labelName.text=@"Home Page";
			
			cell.labelName.textColor=[Constants editLabelTextColor];
			cell.labelName.font=[UIFont boldSystemFontOfSize:labelTextFontSize];
			
			
			cell.textField.font=[UIFont boldSystemFontOfSize:labelTextFontSize];
			cell.textField.placeholder=@"URL";
			cell.textField.returnKeyType=UIReturnKeyDone;
			homePageCell=cell;
		}
		else {
			cell=homePageCell;
		}		
		return cell;
	}

		
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 44.0;	
}

/*
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {	
	UIView* view=[UIView alloc];
	view.backgroundColor=[UIColor clearColor];
	return view;	
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 1.0;	
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section {	
    UIView* view=[UIView alloc];
	view.backgroundColor=[UIColor clearColor];
	return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 1.0;
}
*/

@end
