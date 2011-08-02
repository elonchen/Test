//
//  EditMeeting.m
//  TradeShowInfo
//
//  Created by Elon on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditMeeting.h"
#import "SectionHeaderView.h"
#import "MeetingDao.h"
#import "Constants.h"

#define countOfMeetingAttendees 2

@implementation EditMeeting
@synthesize TAIC,NPCell,DTCell;
@synthesize headerViewOfMeetingAttendees,headerViewOfFollowUpToDoItems,openFlagOfMeetingAttendees;
//@synthesize keyboardToolbar;
@synthesize meetingDao;
@synthesize edit;

@synthesize status;

@synthesize newEditNotesField;

-(void)viewDidLoad{
	[super viewDidLoad];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(doneButtonClicked:)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	self.view.backgroundColor = [Constants backgroundColor];
	headerViewOfMeetingAttendees= [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:[NSString stringWithFormat:@"Meeting Attendees (%d)",countOfMeetingAttendees] section:2 delegate:self];
	headerViewOfFollowUpToDoItems = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Follow-Up To Do Items(0)" section:3 delegate:self];
}

- (IBAction)dismissKeyboard:(id)sender
{
	[self dispearAllTextfield];
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
	TAIC.companyBoothCell.inputCompanyName.placeholder = @"Title";
	TAIC.companyBoothCell.labelBooth.text = @"Location";
	TAIC.companyBoothCell.inputBoothNumber.placeholder = @"Room";
	TAIC.importanceCell.labelNumber.text = @"2";
	
	DTCell.startCell.leftLabel.text = @"Date & Time";
	
	if (status == 0) {
		DTCell.startCell.rightLabel.text = @"Required";
		DTCell.startCell.rightLabel.textColor = [Constants placeholderColor];
	}else{
		meetingDao = [[MeetingDao alloc] init];
		Meeting *e = [meetingDao getMeetingById:[self getIndex]];
		TAIC.companyBoothCell.inputCompanyName.text=e.title;
		TAIC.companyBoothCell.inputBoothNumber.text=e.location;
		
		TAIC.importanceCell.labelNumber.text =[NSString stringWithFormat:@"%d",[e getImportance]];
		
		DTCell.startCell.rightLabel.text = [self converStrToShowTimeFomart:e.time];//[super converStrToShowTimeFomart:e.time];
		
		if (status == 1) {
			NPCell.notesCell.labelValue.text = e.notes;
		}else if (status == 2) {
			NPCell.notesCell.labelValue.text = newEditNotesField.editNote;
		}
	}
	
	//NPCell.notesCell.labelValue.font = [UIFont systemFontOfSize:17.0];
	NPCell.notesCell.labelValue.minimumFontSize = 17.0;
	
	TAIC.importanceCell.delegate=self;// ImportanceCellClickedDelegate 
	NPCell.notesCell.delegate = self;
}

-(void)noteLabelCell:(NoteLabelCell *)noteLabelCell labelClicked:(NSString *)labelText{
	
	[self saveMeeting];
	newEditNotesField = [[EditNotesField alloc] initWithNibName:@"EditNotesField" bundle:nil];	
	newEditNotesField.editNote = NPCell.notesCell.labelValue.text;
	
	status = 2;
	[[self navigationController] pushViewController:newEditNotesField animated:YES];
	
}

-(IBAction)doneButtonClicked:(id)sender{
	[self dispearAllTextfield];
	[self saveMeeting];
}

- (void)saveMeeting{
	meetingDao = [[MeetingDao alloc] init];
	if (edit) {
		[meetingDao updateAt:[self getIndex] 
					   Title:TAIC.companyBoothCell.inputCompanyName.text 
					Location:TAIC.companyBoothCell.inputBoothNumber.text
				  Importance:[TAIC.importanceCell.labelNumber.text intValue]
						Time:[self converStrToDBTimeFomart:DTCell.startCell.rightLabel.text]
					   Notes:NPCell.notesCell.labelValue.text
					  Photos:nil
						TsId:1];
	}else{
		[meetingDao insertWithTitle:TAIC.companyBoothCell.inputCompanyName.text
						   Location:TAIC.companyBoothCell.inputBoothNumber.text
						 Importance:[TAIC.importanceCell.labelNumber.text intValue]  
							   Time:[self converStrToDBTimeFomart:DTCell.startCell.rightLabel.text]
							  Notes:NPCell.notesCell.labelValue.text
							 Photos:nil
							   TsId:1];
	}
}

- (void)dispearAllTextfield{
	[TAIC.companyBoothCell.inputBoothNumber resignFirstResponder];
	[TAIC.companyBoothCell.inputCompanyName resignFirstResponder];
	//[NPCell.notesCell.textField resignFirstResponder];
	//keyboardToolbar.alpha = 0.0;
}

-(void)importanceCell:(ImportanceCell*)importanceCell numberClicked:(NSString *)number{
	[super	showImportancePicker:TAIC.importanceCell.labelNumber.text];
	[self dispearAllTextfield];
}

//must implement for set the data for the importance.
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    TAIC.importanceCell.labelNumber.text=[super.arrayImportance objectAtIndex:row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if(section==2)
		if (openFlagOfMeetingAttendees) {
			return countOfMeetingAttendees;
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
		return headerViewOfMeetingAttendees;			
	}
	else if(section==3){
		return headerViewOfFollowUpToDoItems;			
	}
	else if(section==4){	
		return nil;
	}
	
	return nil;	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MeetingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (indexPath.section == 0) {
		if (TAIC == nil) {
			NSArray *array =[[NSBundle mainBundle] loadNibNamed:@"TwoTableViewCell" 
														  owner:self
														options:nil];
			
			cell=[array objectAtIndex:0]; 
			TAIC=(TwoTableViewCell *)cell;
			
			[TAIC retain];//So it will not be dealloced
		}
		else {
			cell=TAIC;
		}			
	}
	else if(indexPath.section == 1){
		if (DTCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"StarsAndEndsCell" // not StarsEndsCell
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			DTCell = (StarsAndEndsCell *)cell;
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			DTCell.dateCount = 1;
			[DTCell retain];
		}else {
			cell = DTCell;
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
		height=72.0;
	}
	if (indexPath.section==2){
		height=80.0;
	}
	if (indexPath.section==3){
		height=20.0;
	}
	if (indexPath.section==4){
		height=140.0;
	}
	
	return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 44.0;
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
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
    [super dealloc];
}


@end
