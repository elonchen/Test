//
//  SpeakerDatetimeCell.m
//  TradeShowInfo
//
//  Created by Elon on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SpeakerDatetimeCell.h"


@implementation SpeakerDatetimeCell
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
	//[datetimeCell release];
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
	static NSString *CellIdentifier = @"SpeakerDatetimeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (indexPath.section==0) {
		if (speakerCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NotesFieldCell" // not StarsEndsCell
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			speakerCell = (NotesFieldCell *)cell;
			[speakerCell retain];
		}else {
			cell = speakerCell;
		}		
		return cell;
	}
//	if (indexPath.section==0) {
//		if (cell == nil) {
//			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
//			cell.selectionStyle = UITableViewCellSelectionStyleNone;
//			
//			//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//			
//			CGRect titleFrame = CGRectMake(20.0, 9.0, 70.0, 30.0);
//			UILabel *titleLabel = [[[UILabel alloc] initWithFrame:titleFrame] autorelease];
//			//titleLabel.backgroundColor = [UIColor clearColor];
//			//		titleLabel.textColor = [UIColor blackColor];
//			titleLabel.textAlignment = UITextAlignmentLeft;
//			titleLabel.font = [UIFont systemFontOfSize:17.0];
//			titleLabel.tag = 100;
//			titleLabel.text = @"Speaker";
//			titleLabel.textColor=[Constants editLabelTextColor];
//			[cell.contentView addSubview:titleLabel];
//			
//			UITextField *speakerField = [[[UITextField alloc] initWithFrame:CGRectMake(100.0, 15.0, 260.0, 30.0)] autorelease];
//			speakerField.textAlignment = UITextAlignmentLeft;
//			speakerField.font = [UIFont systemFontOfSize:14.0];
//			speakerField.tag = 200;
//			speakerField.placeholder = @"Name";
//			[cell.contentView addSubview:speakerField];
//		}
//		return cell;
//	}
//	else if(indexPath.section==1) {
//		if (datetimeCell == nil) {
//			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"StarsEndsCell" // not StarsEndsCell
//														 owner:self
//													   options:nil];
//			cell=[array objectAtIndex:0];
//			datetimeCell = (StarsEndsCell *)cell;
//			[datetimeCell retain];
//		}else {
//			cell = datetimeCell;
//		}		
//		return cell;
//	}	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 44.0;	
}

@end
