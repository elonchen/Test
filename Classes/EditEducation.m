//
//  EditSeminar.m
//  TradeShowInfo
//
//  Created by Elon on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditEducation.h"
#import "SectionHeaderView.h"
#import "Constants.h"
#import "Education.h"

#define countOfContacts 30

@implementation EditEducation
@synthesize TAIC,NPCell, speakerCell, datetimeCell;
@synthesize headerViewOfContacts,headerViewOfBiggestIdeas,openFlagOfContacts;
@synthesize keyboardToolbar;
@synthesize educationDao;
@synthesize edit;

@synthesize status;

@synthesize newEditNotesField;

-(void)viewDidLoad{
	[super viewDidLoad];
	
	//EducationDao *educationDao = [[EducationDao alloc] init];
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(doneButtonClicked:)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	self.view.backgroundColor = [Constants backgroundColor];
	headerViewOfContacts= [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:[NSString stringWithFormat:@"Contacts (%d)",countOfContacts] section:3 delegate:self];
	headerViewOfBiggestIdeas = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Biggest Ideas(0)" section:4 delegate:self];
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
	TAIC.companyBoothCell.inputCompanyName.placeholder = @"Title";
	TAIC.companyBoothCell.labelBooth.text = @"Location";
	TAIC.companyBoothCell.inputBoothNumber.placeholder = @"Room";
	TAIC.importanceCell.labelNumber.text = @"2";
	
	speakerCell.speakerCell.labelName.text =@"Speaker";

	if (status == 0) {
		datetimeCell.startCell.rightLabel.text = @"Required";
		datetimeCell.startCell.rightLabel.textColor = [Constants placeholderColor];
		
		speakerCell.speakerCell.textField.placeholder = @"Name";
	}else{
		educationDao = [[EducationDao alloc] init];
		Education *e = [educationDao getEducationById:[self getIndex]];
		TAIC.companyBoothCell.inputCompanyName.text=e.title;
		TAIC.companyBoothCell.inputBoothNumber.text=e.location;
		
		speakerCell.speakerCell.textField.text = e.speaker;
		
		speakerCell.speakerCell.textField.font = [UIFont systemFontOfSize:17.0];
		
		TAIC.importanceCell.labelNumber.text =[NSString stringWithFormat:@"%d",[e getImportance]];
		
		datetimeCell.startCell.rightLabel.text = [self converStrToShowTimeFomart:e.time];//[super converStrToShowTimeFomart:e.time];
		
		if (status == 1) {
			NPCell.notesCell.labelValue.text = e.notes;
		}else if (status == 2) {
			NPCell.notesCell.labelValue.text = newEditNotesField.editNote;
		}
	}
	
	NPCell.notesCell.labelValue.minimumFontSize = 17.0;
	
	TAIC.importanceCell.delegate=self;// ImportanceCellClickedDelegate 
	
	NPCell.notesCell.delegate = self;
}

-(IBAction)doneButtonClicked:(id)sender{
	[self dispearAllTextfield];
	[self saveEducation];
}

- (void)saveEducation{
	educationDao = [[EducationDao alloc] init];
	if (edit) {
		[educationDao updateAt:[self getIndex] 
						 Title:TAIC.companyBoothCell.inputCompanyName.text 
					  Location:TAIC.companyBoothCell.inputBoothNumber.text
					Importance:[TAIC.importanceCell.labelNumber.text intValue]
					   Speaker:speakerCell.speakerCell.textField.text
						  Time:[self converStrToDBTimeFomart:datetimeCell.startCell.rightLabel.text]
						 Notes:NPCell.notesCell.labelValue.text
						Photos:nil
						  TsId:1];
	}else{
		[educationDao insertWithTitle:TAIC.companyBoothCell.inputCompanyName.text
							 Location:TAIC.companyBoothCell.inputBoothNumber.text
						   Importance:[TAIC.importanceCell.labelNumber.text intValue]  
							  Speaker:speakerCell.speakerCell.textField.text
								 Time:[self converStrToDBTimeFomart:datetimeCell.startCell.rightLabel.text]
								Notes:NPCell.notesCell.labelValue.text
							   Photos:nil
								 TsId:1];
	}
}

- (void)dispearAllTextfield{
	[speakerCell.speakerCell.textField resignFirstResponder];
	[TAIC.companyBoothCell.inputBoothNumber resignFirstResponder];
	[TAIC.companyBoothCell.inputCompanyName resignFirstResponder];
	//keyboardToolbar.alpha = 0.0;
}

-(void)noteLabelCell:(NoteLabelCell *)noteLabelCell labelClicked:(NSString *)labelText{
	[self saveEducation];
	
	newEditNotesField = [[EditNotesField alloc] initWithNibName:@"EditNotesField" bundle:nil];	
	newEditNotesField.editNote = NPCell.notesCell.labelValue.text;
	
	status = 2;
	
	[[self navigationController] pushViewController:newEditNotesField animated:YES];
	
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
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if(section==3)
		if (openFlagOfContacts) {
			return countOfContacts;
		}
		else {
			return 0;
		}
	if(section==4)
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
	else if(section==2){	
		return nil;
	}
	else if (section==3) {
		return headerViewOfContacts;			
	}
	else if(section==4){
		return headerViewOfBiggestIdeas;			
	}
	else if(section==5){	
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
			[TAIC retain];//So it will not be dealloced
		}
		else {
			cell=TAIC;
		}			
	}
	else if(indexPath.section == 1){
		if (speakerCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"SpeakerCell" // not StarsEndsCell
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			speakerCell = (SpeakerCell *)cell;
			[speakerCell retain];
		}else {
			cell = speakerCell;
		}		
		return cell;
	}
	else if(indexPath.section == 2){
		if (datetimeCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"StarsAndEndsCell" // not StarsEndsCell
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			datetimeCell = (StarsAndEndsCell *)cell;
			datetimeCell.dateCount = 1;
			[datetimeCell retain];
		}else {
			cell = datetimeCell;
		}		
		return cell;
	}
	else if(indexPath.section == 3){
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
		return cell;
	}
	else if(indexPath.section == 4){
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		}
	}
	else if(indexPath.section == 5){
		if (NPCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NotePhotoCell" 
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			NPCell = (NotePhotoCell *)cell;
			[NPCell retain];
		}else {
			cell = NPCell;
		}
		return cell;
	}

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	CGFloat height=0.0;
	
	if (indexPath.section==0) {
		height=114.0;
	}
	if (indexPath.section==1) {
		height=70.0;
	}
	if (indexPath.section==2) {
		height=72.0;
	}
	if (indexPath.section==3){
		height=80.0;
	}
	if (indexPath.section==4){
		height=20.0;
	}
	if (indexPath.section==5){
		height=140.0;
	}
	
	return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 44.0;
}


- (void)dealloc {
	[educationDao release];
	
	[headerViewOfBiggestIdeas release];
	[headerViewOfContacts release];
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];	
	[keyboardToolbar release], keyboardToolbar = nil;
    [super dealloc];
}
@end
