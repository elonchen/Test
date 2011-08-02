//
//  EditTodo.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditTodo.h"
#import "SectionHeaderView.h"
#import "TodoDao.h"
#import "Constants.h"

#define countOfContacts 0

@implementation EditTodo
@synthesize TAIC,SDPCell,DTCell;
@synthesize headerViewOfContacts,openFlagOfContacts;
@synthesize keyboardToolbar;
@synthesize todoDao;
@synthesize edit;

@synthesize status;

@synthesize newEditNotesField;

-(void)viewDidLoad{
	[super viewDidLoad];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(doneButtonClicked:)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	self.view.backgroundColor = [Constants backgroundColor];
	headerViewOfContacts= [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:[NSString stringWithFormat:@"Contacts (%d)",countOfContacts] section:2 delegate:self];
}

- (void)dispearAllTextfield{
	[TAIC.companyBoothCell.inputBoothNumber resignFirstResponder];
	[TAIC.companyBoothCell.inputCompanyName resignFirstResponder];
	//[SDPCell.detailCell. resignFirstResponder];
	//keyboardToolbar.alpha = 0.0;
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
	TAIC.companyBoothCell.inputCompanyName.placeholder = @"Title";
	TAIC.companyBoothCell.labelBooth.text = @"By";
	TAIC.companyBoothCell.inputBoothNumber.placeholder = @"Name";
	TAIC.importanceCell.labelNumber.text = @"2";
	
	DTCell.startCell.leftLabel.text = @"Date & Time";
	SDPCell.detailCell.labelName.text = @"Detail";
	
	if (status == 0) {
		DTCell.startCell.rightLabel.text = @"Required";
		DTCell.startCell.rightLabel.textColor = [Constants placeholderColor];
	}else{
		todoDao = [[ToDoDao alloc] init];
		ToDo *e = [todoDao getToDoItemById:[self getIndex]];
		TAIC.companyBoothCell.inputCompanyName.text=e.title;
		TAIC.companyBoothCell.inputBoothNumber.text=e.by;
		
		TAIC.importanceCell.labelNumber.text =[NSString stringWithFormat:@"%d",[e getImportance]];
		
		DTCell.startCell.rightLabel.text = [self converStrToShowTimeFomart:e.time];//[super converStrToShowTimeFomart:e.time];
		[SDPCell.statusCell.switchName setOn:([@"TODO" isEqualToString:e.status]?YES:NO)];
		
		if (status == 1) {
			SDPCell.detailCell.labelValue.text = e.detail;
		}else if (status == 2) {
			SDPCell.detailCell.labelValue.text = newEditNotesField.editNote;
		}
	}
	
	SDPCell.detailCell.labelValue.minimumFontSize = 17.0;
	
	TAIC.importanceCell.delegate=self;// ImportanceCellClickedDelegate 
	SDPCell.detailCell.delegate = self;
}

-(void)noteLabelCell:(NoteLabelCell *)noteLabelCell labelClicked:(NSString *)labelText{
	[self saveToDo];
	
	newEditNotesField = [[EditNotesField alloc] initWithNibName:@"EditNotesField" bundle:nil];	
	newEditNotesField.editNote = SDPCell.detailCell.labelValue.text;
	
	status = 2;
	[[self navigationController] pushViewController:newEditNotesField animated:YES];
	
}

-(IBAction)doneButtonClicked:(id)sender{
	[self dispearAllTextfield];
	[self saveToDo];
}

-(void)saveToDo{
	todoDao = [[ToDoDao alloc] init];
	if (edit) {
		[todoDao updateAt:[self getIndex] 
					Title:TAIC.companyBoothCell.inputCompanyName.text 
					   By:TAIC.companyBoothCell.inputBoothNumber.text
			   Importance:[TAIC.importanceCell.labelNumber.text intValue]
					 Time:[self converStrToDBTimeFomart:DTCell.startCell.rightLabel.text]
				   Status:SDPCell.statusCell.switchName.on?@"TODO":@"DONE"
				   Detail:SDPCell.detailCell.labelValue.text
					Notes: nil
				   Photos:nil
					 TsId:1];
	}else{
		[todoDao insertWithTitle:TAIC.companyBoothCell.inputCompanyName.text
							  By:TAIC.companyBoothCell.inputBoothNumber.text
					  Importance:[TAIC.importanceCell.labelNumber.text intValue]
							Time:[self converStrToDBTimeFomart:DTCell.startCell.rightLabel.text]
						  Status:SDPCell.statusCell.switchName.on?@"TODO":@"DONE"
						  Detail:SDPCell.detailCell.labelValue.text
						   Notes: nil
						  Photos:nil
							TsId:1];
	}
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
    return 4;
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
		return nil;
	}
	
	return nil;	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"ToDoCell";
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
		if (SDPCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"StatusDetailPhotoCell" 
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			SDPCell = (StatusDetailPhotoCell *)cell;
			[SDPCell retain];
		}else {
			cell = SDPCell;
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
		height=72.0;
	}
	if (indexPath.section==2){
		height=60.0;
	}
	if (indexPath.section==3){
		height=200.0;
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
