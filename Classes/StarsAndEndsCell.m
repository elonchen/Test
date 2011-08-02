//
//  StarsAndEndsCell.m
//  TradeShowInfo
//
//  Created by Elon on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StarsAndEndsCell.h"
#import "StarsEndsCell.h"
#import "Constants.h"

@implementation StarsAndEndsCell
@synthesize leftTableView,startCell,endCell;
@synthesize showDateFormatter;
@synthesize datePickerView;
@synthesize actionSheet;
@synthesize dateEditingRow;
@synthesize dateCount;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

	
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}

- (void)dealloc {
	[startCell release];
	[endCell release];
	[leftTableView release];
	[showDateFormatter release];
	[datePickerView release];
	[actionSheet release];
    [super dealloc];
}

- (void)layoutSubviews {
	
	showDateFormatter=[[NSDateFormatter alloc] init];
	[showDateFormatter setDateFormat:@"ccc, MMM dd hh:mm a"];
	[super layoutSubviews];
   	self.backgroundColor=[Constants backgroundColor];
	leftTableView.backgroundColor=[Constants backgroundColor];
}

/*<UITableViewDelegate,UITableViewDataSource> Start*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return dateCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"StarsEndsCell";

	StarsEndsCell *cell=(StarsEndsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (indexPath.row==0) {
		if (startCell==nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"StarsEndsCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			if (dateCount == 1) {
				cell.leftLabel.text = @"Date & Time";
			}
			startCell=cell;
			[startCell retain];
		}else {
			cell = startCell;
		}
	}else {
		if (endCell==nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"StarsEndsCell" 
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			cell.leftLabel.text = @"Ends";
			endCell=cell;
			[endCell retain];
		}else {
			cell = endCell;
		}
	}
	//cell.rightLabel.text = @"Required";
	//cell.rightLabel.textColor = [UIColor colorWithRed:185.0/255.0 green:185.0/255.0 blue:185.0/255.0 alpha:backgroundColorAlpha];

	cell.tag = indexPath.row+1000;
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//if (indexPath.row ==0) {
//		StarsEndsCell *cell = (StarsEndsCell *)[self viewWithTag:1000];
//		cell.rightLabel.text = @"0000";
//		
//	}else {
//		StarsEndsCell *cell = (StarsEndsCell *)[self viewWithTag:1001];
//		cell.rightLabel.text = @"1111";
//	}
	[self showDataPicker:indexPath];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 50.0;	
}

-(void) showDataPicker:(NSIndexPath *)indexPath{
	
	NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n\n" ;
	
	actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
	[actionSheet showInView:self.window];
	
	
	datePickerView = [[[UIDatePicker alloc] initWithFrame:CGRectMake(0.0, 44.0, 0.0, 0.0)] autorelease];
	datePickerView.tag = 101;
	datePickerView.datePickerMode = UIDatePickerModeDateAndTime;//[(UISegmentedControl *)self.navigationItem.titleView selectedSegmentIndex];
	
	
	UIToolbar *pickerDateToolbar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
	pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
	[pickerDateToolbar sizeToFit];			
	NSMutableArray *barItems = [[NSMutableArray alloc] init];			
	
	
	UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(DatePickerCancelClick:)];
	[barItems addObject:cancelBtn];
	
	UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	[barItems addObject:flexSpace];
	
	UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
	
	if(indexPath.row==0){
		dateEditingRow = 0;
		StarsEndsCell *cell = (StarsEndsCell *)[self viewWithTag:1000];
		
		//NSDateFormatter *timeFormatter=[[NSDateFormatter alloc] init];
//		[timeFormatter setDateFormat:@"ccc, MMM dd hh:mm a"];
		@try {
			NSDate *time = [showDateFormatter dateFromString:cell.rightLabel.text];
			datePickerView.date = time;
		}
		@catch (NSException * e) {
			NSDate *today = [NSDate date];
			datePickerView.date = today;
		}
		
		//NSDate *time = [timeFormatter dateFromString:@"Thu, Apr 25 02:15 PM"];
		
		
		doneBtn.action = @selector(dateDoneClick);
		[cell release];
	}else{
		dateEditingRow = 1;
		StarsEndsCell *cell = (StarsEndsCell *)[self viewWithTag:1001];
		@try {
			NSDate *time = [showDateFormatter dateFromString:cell.rightLabel.text];
			datePickerView.date = time;
		}
		@catch (NSException * e) {
			NSDate *today = [NSDate date];
			datePickerView.date = today;
		}
		doneBtn.action = @selector(dateDoneClick);
		[cell release];
	}	
	[barItems addObject:doneBtn];
	[pickerDateToolbar setItems:barItems animated:YES];
	
//	[actionSheet showInView:self.view];
	[actionSheet addSubview:pickerDateToolbar];
	
	[actionSheet addSubview:datePickerView];
	
	[self viewToUp:-80];
}



-(void) dateDoneClick{
	StarsEndsCell *cell = [StarsEndsCell alloc];
	if (dateEditingRow == 0) {
		cell = (StarsEndsCell *)[self viewWithTag:1000];
	}else {
		cell = (StarsEndsCell *)[self viewWithTag:1001];
	}
	cell.rightLabel.text = [showDateFormatter stringFromDate:[datePickerView date] ];
	//[cell release];
	[actionSheet dismissWithClickedButtonIndex:0 animated:TRUE];
	[self ViewToDown];
}
-(IBAction)DatePickerCancelClick:(id)sender{
	[actionSheet dismissWithClickedButtonIndex:0 animated:TRUE];
	[self ViewToDown];
}
-(void)viewToUp:(CGFloat)VIEW_UP{
	NSTimeInterval animationDuration = 0.30f;
	[UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
	[UIView setAnimationDuration:animationDuration];
	float width = self.superview.frame.size.width;
	float height = self.superview.frame.size.height;
	CGRect rect = CGRectMake(0.0f,VIEW_UP,width,height);
	self.superview.frame = rect;	
	[UIView commitAnimations];
}

-(void)ViewToDown{
	NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.superview.frame.size.width, self.superview.frame.size.height);	
    self.superview.frame = rect;	
    [UIView commitAnimations];
}
 

@end
