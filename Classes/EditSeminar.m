//
//  EditSeminar.m
//  TradeShowInfo
//
//  Created by Elon on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditSeminar.h"
#import "SectionHeaderView.h"
#import "SeminarDao.h"
#import "Constants.h"

#define countOfContacts 30

@implementation EditSeminar
@synthesize TAIC,NPCell, SDCell;
@synthesize headerViewOfContacts,headerViewOfToDos,openFlagOfContacts;
@synthesize keyboardToolbar;
@synthesize seminarDao;
@synthesize seminarName,location,importance,datetime;
@synthesize edit;

-(void)viewDidLoad{
	[super viewDidLoad];
	
	SeminarDao *seminarDao = [[SeminarDao alloc] init];
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(doneButtonClicked:)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	self.view.backgroundColor = [Constants backgroundColor];
	headerViewOfContacts= [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:[NSString stringWithFormat:@"Contacts (%d)",countOfContacts] section:1 delegate:self];
	headerViewOfToDos = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"To Dos(0)" section:2 delegate:self];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];	
}

-(IBAction)doneButtonClicked:(id)sender{
	[self dispearAllTextfield];
	
	seminarDao = [[SeminarDao alloc] init];
	
//	if (edit) {
//		[calendarDao updateAt:[self getIndex] 
//						Title:TTVC.eventTitleCell.title.text 
//				   Importance:[TTVC.importanceCell.labelNumber.text intValue]  
//						Begin:[super converStrToDBTimeFomart:SEDate.startCell.rightLabel.text]
//						  End:[super converStrToDBTimeFomart:SEDate.endCell.rightLabel.text]
//						Notes:NPHPcell.notesCell.textView.text];
//	}else{
//		[calendarDao insertWithTitle:TTVC.eventTitleCell.title.text 
//						  Importance:[TTVC.importanceCell.labelNumber.text intValue] 
//							   Begin:[super converStrToDBTimeFomart:SEDate.startCell.rightLabel.text]
//								 End:[super converStrToDBTimeFomart:SEDate.endCell.rightLabel.text]
//							   Notes:NPHPcell.notesCell.textView.text];
//	}
}

- (void)keyboardWillShow:(NSNotification *)notification
{
	UIViewAnimationCurve animationCurve	= [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];		
	
	if(nil == keyboardToolbar) {
		keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,44)];
		keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
		keyboardToolbar.tintColor = [UIColor darkGrayColor];
		
		UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissKeyboard:)];
		UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
		
		NSArray *items = [[NSArray alloc] initWithObjects:flex, barButtonItem, nil];
		[keyboardToolbar setItems:items];

		[barButtonItem release];
		[flex release];
		[items release];			
		
		
		[self.view.superview addSubview:keyboardToolbar];		
	}			
	
	CGFloat x=0.0;
	CGFloat y=self.view.frame.size.height - 260.0;
	keyboardToolbar.frame = CGRectMake(x, 
									   y, 
									   keyboardToolbar.frame.size.width, 
									   keyboardToolbar.frame.size.height);
	NSLog(@"%f,%f,%f,%f",x,y,keyboardToolbar.frame.size.width,keyboardToolbar.frame.size.height);

	[self.view addSubview:keyboardToolbar];		
	
	[UIView beginAnimations:@"RS_showKeyboardAnimation" context:nil];	
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	
	keyboardToolbar.alpha = 1.0;	
	
	[UIView commitAnimations];		
	
	keyboardToolbarShouldHide = YES;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
	if (nil == keyboardToolbar || !keyboardToolbarShouldHide) {
		return;
	}	
	
	CGPoint endCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterEndUserInfoKey] CGPointValue];
	CGRect keyboardBounds = [[[notification userInfo] valueForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
	UIViewAnimationCurve animationCurve	= [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];	
	
	[UIView beginAnimations:@"RS_hideKeyboardAnimation" context:nil];	
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	
	
	keyboardToolbar.alpha = 0.0;
	keyboardToolbar.frame = CGRectMake(endCentre.x - (keyboardBounds.size.width/2), 
									   endCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height,
									   keyboardToolbar.frame.size.width, 
									   keyboardToolbar.frame.size.height);
	
	[UIView commitAnimations];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if(section==2)
		if (openFlagOfContacts) {
			return countOfContacts;
		}
		else {
			return 0;
		}
	if(section==3)
		return 0;
    return 1;
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
	
	if (section==0) {
		return nil;
	}
	else if(section==1){	
		return nil;
	}
	else if (section==2) {
		return headerViewOfContacts;			
	}
	else if(section==3){
		return headerViewOfToDos;			
	}
	else if(section==4){	
		return nil;
	}
	
	return nil;	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"SiminarCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (indexPath.section == 0) {
		if (TAIC == nil) {
			NSArray *array =[[NSBundle mainBundle] loadNibNamed:@"TwoTableViewCell" 
														  owner:self
														options:nil];
			
			cell=[array objectAtIndex:0]; 

			TAIC=(TwoTableViewCell *)cell;
			
			TAIC.companyBoothCell.inputCompanyName.placeholder = @"Title";
			TAIC.companyBoothCell.labelBooth.text = @"Location";
			TAIC.companyBoothCell.inputBoothNumber.placeholder = @"Room";
			TAIC.importanceCell.labelNumber.text = @"2";
			NSLog(@"%@ Hunter test", TAIC);
			
			[TAIC retain];//So it will not be dealloced
			NSLog(@"TAIC is nil, create new on viewDidLoad.");
		}
		else {
			cell=TAIC;
		}			
	}
	else if(indexPath.section == 1){
		if (SDCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"SpeakerDatetimeCell" 
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			SDCell = (SpeakerDatetimeCell *)cell;
			[SDCell retain];
		}else {
			cell = SDCell;
		}
		return cell;
	}
	else if(indexPath.section == 2){
		if (cell == nil)
		{
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			
			cell.textLabel.text = @"Contact Test";
			cell.textLabel.textColor = [UIColor blackColor];
			cell.textLabel.font = [UIFont systemFontOfSize:15];
			cell.textLabel.textAlignment=UITextAlignmentLeft;
		}
	}
	else if(indexPath.section == 3){
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		}
	}
	else if(indexPath.section == 4){
		if (NPCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NotePhotoCell" 
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			NPCell = (NotePhotoCell *)cell;
			[NPCell retain];
		}else {
			cell = NPCell;
		}
		return cell;
	}
	
//	if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	CGFloat height=0.0;
	
	if (indexPath.section==0) {
		height=114.0;
	}
	if (indexPath.section==1) {
		height=140.0;
	}
	if (indexPath.section==2){
		height=60.0;
	}
	if (indexPath.section==3){
		height=20.0;
	}
	if (indexPath.section==4){
		height=150.0;
	}
	
	return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 44.0;
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 0.0;
}

- (void)dealloc {
	[seminarName release];
	[location release];
	[importance release];
	[datetime release];
	[seminarDao release];
	
	[headerViewOfToDos release];
	[headerViewOfContacts release];
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];	
	[keyboardToolbar release], keyboardToolbar = nil;
    [super dealloc];
}
@end
