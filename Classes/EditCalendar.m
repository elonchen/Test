//
//  EditCalendar.m
//  TradeShowInfo
//
//  Created by Elon on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditCalendar.h"
#import "Constants.h"

#import "NotePhotoHomePageCell.h"

@implementation EditCalendar
@synthesize TTVC,SEDate,NPHPcell,headerViewOfContacts,headerViewOfToDos;
@synthesize calendarDao;
@synthesize edit;

@synthesize status;

@synthesize newEditNotesField;

#pragma mark -
#pragma mark View lifecycle


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
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
	[self saveCalendar];
}

-(void)saveCalendar{
	calendarDao = [[CalendarDao alloc] init];
	
	if (edit) {
		[calendarDao updateAt:[self getIndex] 
						Title:TTVC.eventTitleCell.title.text 
				   Importance:[TTVC.importanceCell.labelNumber.text intValue]  
						Begin:[super converStrToDBTimeFomart:SEDate.startCell.rightLabel.text]
						  End:[super converStrToDBTimeFomart:SEDate.endCell.rightLabel.text]
						Notes:NPHPcell.notesCell.labelValue.text];
	}else{
		[calendarDao insertWithTitle:TTVC.eventTitleCell.title.text 
						  Importance:[TTVC.importanceCell.labelNumber.text intValue] 
							   Begin:[super converStrToDBTimeFomart:SEDate.startCell.rightLabel.text]
								 End:[super converStrToDBTimeFomart:SEDate.endCell.rightLabel.text]
							   Notes:NPHPcell.notesCell.labelValue.text];
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
		calendarDao = [[CalendarDao alloc] init];
		
		Calendar *c = [calendarDao getCalendarById:[self getIndex]];
		TTVC.eventTitleCell.title.text =c.title;
		TTVC.importanceCell.labelNumber.text = [NSString stringWithFormat:@"%d",[c getImportance]];
		
		SEDate.startCell.rightLabel.text = [super converStrToShowTimeFomart:c.begin];
		SEDate.endCell.rightLabel.text = [super converStrToShowTimeFomart:c.end];
		
		if (status == 1) {
			NPHPcell.notesCell.labelValue.text = c.notes;
		}else if (status == 2) {
			NPHPcell.notesCell.labelValue.text = newEditNotesField.editNote;
		}
		
		NPHPcell.homePageCell.textField.text = @"www.google.com";	
	}
	TTVC.importanceCell.delegate=self;
	NPHPcell.notesCell.delegate = self;
}

-(void)noteLabelCell:(NoteLabelCell *)noteLabelCell labelClicked:(NSString *)labelText{
	[self saveCalendar];
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
    // Return the number of sections.
    return 5;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if(section==2 || section==3)
		return 0;
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    	
    if (indexPath.section==0) {
//		//TitleAndImportanceCell *cell = (TitleAndImportanceCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//		NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"TitleAndImportanceCell" 
//													 owner:self
//												   options:nil];
//		cell=[array objectAtIndex:0];
//		TTVC = (TitleAndImportanceCell *)cell;
//		
//		//cell.selectionStyle = UITableViewCellSelectionStyleNone;
//		return cell;
		if (TTVC == nil)
		{
//			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
//			cell.selectionStyle = UITableViewCellSelectionStyleNone;
//			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//			
//			cell.textLabel.text = @"Contact 0";
//			cell.textLabel.textColor = [UIColor redColor];
//			cell.textLabel.font = [UIFont systemFontOfSize:17];
//			cell.textLabel.textAlignment=UITextAlignmentLeft;
//			
//			//			cell.detailTextLabel.text = @"(10)";
//			//			cell.detailTextLabel.textColor = [UIColor grayColor];
//			//			cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
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
	}
	else if(indexPath.section==1){
		//StarsAndEndsCell *cell = (StarsAndEndsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (SEDate == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"StarsAndEndsCell" // not StarsEndsCell
														 owner:self
													   options:nil];
			
			cell=[array objectAtIndex:0];
			SEDate = (StarsAndEndsCell *)cell;
			SEDate.dateCount = 2;
			[SEDate retain];
		}else {
			cell = SEDate;
		}		
		return cell;
//		if (cell == nil)
//		{
//			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
//			cell.selectionStyle = UITableViewCellSelectionStyleNone;
//			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//			
//			cell.textLabel.text = @"Contact 1";
//			cell.textLabel.textColor = [UIColor redColor];
//			cell.textLabel.font = [UIFont systemFontOfSize:17];
//			cell.textLabel.textAlignment=UITextAlignmentLeft;
//			
//			//			cell.detailTextLabel.text = @"(10)";
//			//			cell.detailTextLabel.textColor = [UIColor grayColor];
//			//			cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
//		}
//		return cell;
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
			
			//			cell.detailTextLabel.text = @"(10)";
			//			cell.detailTextLabel.textColor = [UIColor grayColor];
			//			cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
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
			
			//			cell.detailTextLabel.text = @"(10)";
			//			cell.detailTextLabel.textColor = [UIColor grayColor];
			//			cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
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
			NPHPcell = cell;
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
	}
	if (indexPath.section==1) {
		height=122.0;
	}
	if (indexPath.section==2) {
		height=60.0;
	}
	if (indexPath.section==3){
		height=20.0;
	}
	if (indexPath.section==4){
		height=220.0;
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
	NSLog(@"%d plus clicked",section);
	//	TTVC.labelImportanceNumber.text=[NSString stringWithFormat:@"%d plus clicked",section];
	//	TTVC.companyName.text=@"test name";
	//	TTVC.boothNumber.text=@"#1#";
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
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
	[calendarDao release];
	
    [super dealloc];
}

@end

