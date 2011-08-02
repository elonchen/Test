//
//  NoteCell.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoteCell.h"


@implementation NoteCell
@synthesize myTaleView,notesCell;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
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
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"NoteCell";
    
	
	if (indexPath.section==0) {
		NotesFieldCell *cell=(NotesFieldCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (notesCell==nil) {			
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NotesFieldCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			
			notesCell= (NotesFieldCell *)cell;
		}
		else {
			cell=notesCell;
		}
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		return cell;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 380.0;	
}

@end
