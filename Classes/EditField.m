//
//  EditField.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditField.h"
#import "Constants.h"
#import "NotePhotoHomePageCell.h"


@implementation EditField
@synthesize TTVC,SEDate,NPHPcell,headerViewOfContacts,headerViewOfToDos;
@synthesize fieldDao;
@synthesize edit;

@synthesize status;

//@synthesize addressCell;
@synthesize newEditNotesField;


- (void)viewDidLoad {
    [super viewDidLoad];	
	UIBarButtonItem * doneButton =
	[[UIBarButtonItem alloc]
	 initWithTitle:@"Done"
	 style:UIBarButtonItemStyleBordered
	 target:self
	 action:@selector(doneButtonClicked:) 
	 ];
	self.navigationItem.rightBarButtonItem=doneButton;
	[doneButton release];
	self.view.backgroundColor=[Constants backgroundColor];
	headerViewOfContacts= [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Contacts (0)" section:2 delegate:self];
	headerViewOfToDos = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"To Do Items (0)" section:3 delegate:self];
	super.arrayImportance=[[NSMutableArray alloc] init];
	for (int i=1;i<=10 ; i++) {
		[super.arrayImportance addObject:[NSString stringWithFormat:@"%d",i]];
	}
	
}
-(IBAction)doneButtonClicked:(id)sender{
	[self dispearAllTextfield];
	[self saveField];
//	fieldDao = [[FieldDao alloc] init];
//	
//	if (edit) {
//		[fieldDao updateAt:[self getIndex] 
//					  Name:TTVC.eventTitleCell.title.text 
//				Importance:[TTVC.importanceCell.labelNumber.text intValue] 
//				   Address:@"" 
//					  Time:[super converStrToDBTimeFomart:SEDate.startCell.rightLabel.text] 
//					 Notes:NPHPcell.notesCell.textView.text 
//					Photos:@"" 
//				  HomePage:@"" 
//					  TsId:1];
//	}else{
//		[fieldDao insertWithTitle:TTVC.eventTitleCell.title.text 
//					   Importance:[TTVC.importanceCell.labelNumber.text intValue] 
//						  Address:@"" 
//							 Time:[super converStrToDBTimeFomart:SEDate.startCell.rightLabel.text] 
//							Notes:NPHPcell.notesCell.textView.text 
//						   Photos:@"" 
//						 HomePage:@"" 
//							 TsId:1];
//	}
}

-(void)saveField{
	fieldDao = [[FieldDao alloc] init];
	
	if (edit) {
		[fieldDao updateAt:[self getIndex] 
					  Name:TTVC.eventTitleCell.title.text 
				Importance:[TTVC.importanceCell.labelNumber.text intValue] 
				   Address:@"" 
					  Time:[super converStrToDBTimeFomart:SEDate.startCell.rightLabel.text] 
					 Notes:NPHPcell.notesCell.labelValue.text 
					Photos:@"" 
				  HomePage:@"" 
					  TsId:1];
	}else{
		[fieldDao insertWithTitle:TTVC.eventTitleCell.title.text 
					   Importance:[TTVC.importanceCell.labelNumber.text intValue] 
						  Address:@"" 
							 Time:[super converStrToDBTimeFomart:SEDate.startCell.rightLabel.text] 
							Notes:NPHPcell.notesCell.labelValue.text 
						   Photos:@"" 
						 HomePage:@"" 
							 TsId:1];
	}
}
- (void)dispearAllTextfield{
	//[NPHPcell.notesCell.textView resignFirstResponder];
	[TTVC.eventTitleCell.title resignFirstResponder];
	[TTVC.importanceCell.labelNumber resignFirstResponder];
	[NPHPcell.homePageCell.textField resignFirstResponder];
	//keyboardToolbar.alpha = 0.0;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	
	if (status != 0) {
		fieldDao = [[FieldDao alloc] init];
		
		Field *c = [fieldDao getFieldById:[self getIndex]];
		TTVC.eventTitleCell.title.text =c.name;
		TTVC.importanceCell.labelNumber.text = [NSString stringWithFormat:@"%d",[c getImportance]];
		
		SEDate.startCell.rightLabel.text = [super converStrToShowTimeFomart:c.time];
		SEDate.endCell.rightLabel.text = [super converStrToShowTimeFomart:c.time];
		
		if (status == 1) {
			NPHPcell.notesCell.labelValue.text = c.notes;
		}else if (status == 2) {
			NPHPcell.notesCell.labelValue.text = newEditNotesField.editNote;
		}
		
		NPHPcell.homePageCell.textField.text = c.homePage;	
	}
	
	NPHPcell.notesCell.labelValue.minimumFontSize = 17.0;
	
	TTVC.importanceCell.delegate=self;
	NPHPcell.notesCell.delegate = self;
}

-(void)noteLabelCell:(NoteLabelCell *)noteLabelCell labelClicked:(NSString *)labelText{
	
	[self saveField];
	newEditNotesField = [[EditNotesField alloc] initWithNibName:@"EditNotesField" bundle:nil];	
	newEditNotesField.editNote = NPHPcell.notesCell.labelValue.text;
	
	status = 2;
	[[self navigationController] pushViewController:newEditNotesField animated:YES];
	
}

-(void)importanceCell:(ImportanceCell*)importanceCell numberClicked:(NSString *)number{
	[super	showImportancePicker:TTVC.importanceCell.labelNumber.text];	
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    TTVC.importanceCell.labelNumber.text=[super.arrayImportance objectAtIndex:row];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if(section==2 || section==3)
		return 0;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (indexPath.section==0) {
		if (TTVC == nil)
		{
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"TitleAndImportanceCell" 
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			TTVC = (TitleAndImportanceCell *)cell;
			[TTVC retain];
		}else {
			cell = TTVC;
		}
		
		return cell;
//	}else if (indexPath.section==1) {
//		if (addressCell == nil)
//		{
//			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"AddressCell" 
//														 owner:self
//													   options:nil];
//			cell=[array objectAtIndex:0];
//			addressCell = (AddressCell *)cell;
//			[addressCell retain];
//		}else {
//			cell = addressCell;
//		}
//		return cell;
	}
	else if(indexPath.section==1){
		if (SEDate == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"StarsAndEndsCell"
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			SEDate = (StarsAndEndsCell *)cell;
			SEDate.dateCount = 1;
			[SEDate retain];
		}else {
			cell = SEDate;
		}		
		return cell;
	}
	else if(indexPath.section==2){
		if (cell == nil)
		{
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			
			cell.textLabel.text = @"Contact 2";
			cell.textLabel.textColor = [UIColor redColor];
			cell.textLabel.font = [UIFont systemFontOfSize:17];
			cell.textLabel.textAlignment=UITextAlignmentLeft;
		}
		return cell;
	}
	else if(indexPath.section==3){
		if (cell == nil)
		{
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			
			cell.textLabel.text = @"Contact 3";
			cell.textLabel.textColor = [UIColor redColor];
			cell.textLabel.font = [UIFont systemFontOfSize:17];
			cell.textLabel.textAlignment=UITextAlignmentLeft;
		}
		return cell;
	}
	else if(indexPath.section==4){
		if (NPHPcell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NotePhotoHomePageCell" 
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			NPHPcell = (NotePhotoHomePageCell *)cell;
			[NPHPcell retain];
		}else {
			cell = NPHPcell;
		}
		return cell;
		
	}
	return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	CGFloat height=0.0;
	
	if (indexPath.section==0) {
		height=114.0;
	}else if (indexPath.section==1){
		height=72.0;
	}else if (indexPath.section==2){
		height=60.0;
	}else if (indexPath.section==3){
		height=20.0;
	}else if (indexPath.section==4){
		height=220.0;
	}else {
		height=60.0;
	}

	
	return height;
}


-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {	
	if (section==0) {
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	if (section==2 || section==3) {
		return 44.0;			
	}
	return 0.0;
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 0.0;
}




#pragma mark Section header delegate
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened{
	NSLog(@"%d opened",sectionOpened);	
}
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed{
	NSLog(@"%d closed",sectionClosed);	
}
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionPlus:(NSInteger)section{
	
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	headerViewOfToDos=nil;
	headerViewOfContacts=nil;
	TTVC=nil;
	super.actionSheet=nil;
	super.arrayImportance=nil;
	SEDate=nil;
	NPHPcell = nil;
}


- (void)dealloc {
	[TTVC release];
	[SEDate release];
	[NPHPcell release];
	[headerViewOfToDos release];
	[headerViewOfContacts release];
	[fieldDao release];
	
    [super dealloc];
}

@end