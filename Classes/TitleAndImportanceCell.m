//
//  TitleAndImportanceCell.m
//  TradeShowInfo
//
//  Created by Elon on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TitleAndImportanceCell.h"
#import "Constants.h"

@implementation TitleAndImportanceCell
@synthesize leftTableView,rightTableView,eventTitleCell,importanceCell;

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
	[leftTableView release];
	[rightTableView release];
	[eventTitleCell release];
	[importanceCell release];
    [super dealloc];
}

- (void)layoutSubviews {
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 
    leftTableView.backgroundColor=[Constants backgroundColor];
	rightTableView.backgroundColor=[Constants backgroundColor];
}

/*<UITableViewDelegate,UITableViewDataSource> Start*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"TwoTableViewsCell";
	if (leftTableView==tableView) {
		EventTitleCell *cell=(EventTitleCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell==nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"EventTitleCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			eventTitleCell=cell;
		}
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		return cell;
	}
	
	
	if (rightTableView==tableView) {
		ImportanceCell *cell=(ImportanceCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];////????? 
		if (cell==nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"ImportanceCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			
			importanceCell=cell;
		}
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		return cell;
		
	}
	return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 90.0;	
}
/*<UITableViewDelegate,UITableViewDataSource> End*/

@end
