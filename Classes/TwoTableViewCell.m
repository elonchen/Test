//
//  TwoTableViewCell.m
//  TradeShowInfo
//
//  Created by Elon on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TwoTableViewCell.h"
#import "CompanyNameAndBoothNumberCell.h"
#import "ImportanceCell.h"
#import "Constants.h"

@implementation TwoTableViewCell
@synthesize leftTableView;
@synthesize rightTableView;

@synthesize companyBoothCell,importanceCell;

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
	[companyBoothCell release];
	[importanceCell release];
    [super dealloc];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (leftTableView==tableView) {
		if (companyBoothCell==nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"CompanyNameAndBoothNumberCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			companyBoothCell=(CompanyNameAndBoothNumberCell *)cell;
			
		}
		else {
			cell=companyBoothCell;
		}
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		return cell;

	}

	if (rightTableView==tableView) {
		if (importanceCell==nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"ImportanceCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			importanceCell=(ImportanceCell *)cell;
		}
		else {
			cell=importanceCell;
		}
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		return cell;
		
	}

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 90.0;	
}



/*
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {		
	UIView *toolView=[[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1.0, 6.0)] autorelease];
	return toolView;	
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 6.0;	
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section {
	UIView *toolView=[[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1.0, 6.0)] autorelease];
    return toolView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 6.0;
}
*/

- (void)layoutSubviews {
	[super layoutSubviews];// x,y,w,h layout from IB design for xib 
    leftTableView.backgroundColor=[Constants backgroundColor];
	rightTableView.backgroundColor=[Constants backgroundColor];
	//self.backgroundColor=[Constants backgroundColor];

}

@end
