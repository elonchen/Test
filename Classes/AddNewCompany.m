//
//  AddNewCompany.m
//  TradeShowInfo
//
//  Created by Elon on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddNewCompany.h"
#import "Constants.h"
#import "SectionHeaderView.h"
#import "NotePhotoHomePageCell.h"

#define countOfRowsToInsert 3

@implementation AddNewCompany
@synthesize inputTextFieldCompanyName;
@synthesize inputTextFieldBoothNumber;
@synthesize inputTextFieldNote;
@synthesize inputTextFieldURL;
@synthesize labelImportance;
@synthesize pickerImportance;
@synthesize pickerToolbar;

@synthesize buttonCompany;
@synthesize buttonNote;
@synthesize buttonPhoto;
@synthesize buttonHomePage;

@synthesize labelNote;
@synthesize labelHomePage;
@synthesize labelPhoto;

@synthesize lineCompanyH;
@synthesize lineCompanyV;
@synthesize lineImportance;
@synthesize actionSheet;


@synthesize notePhotoURL;
@synthesize contactsAndToDos;

@synthesize openFlag;
@synthesize sectionInfoArray;


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"Cell";
   	
	if (notePhotoURL==tableView) {
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (indexPath.section==0) {
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
			}
			//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			
			//cell.textLabel.text = @"Label";
			//cell.textLabel.textColor = [UIColor redColor];
			//cell.textLabel.font = [UIFont systemFontOfSize:21];
			
			//cell.detailTextLabel.text = @"(10)";
			//cell.detailTextLabel.textColor = [UIColor grayColor];
			//cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
			
			CGRect noteFrame = CGRectMake(40.0, 10.0, 45.0, 20.0);
			UILabel *noteLabel=[[UILabel alloc] initWithFrame:noteFrame];
			//noteLabel.backgroundColor=[UIColor colorWithRed:labelColorR/255.0 green:labelColorG/255.0 blue:labelColorB/255.0 alpha:labelColorAlpha];
			noteLabel.textColor=[Constants labelTextColor];
			noteLabel.textAlignment=UITextAlignmentLeft;
			noteLabel.font=[UIFont boldSystemFontOfSize:labelTextFontSize];//boldSystemFontOfSize systemFontOfSize
			noteLabel.text=@"Note";
			
			UITextView *noteInput=[[UITextView alloc] initWithFrame:CGRectMake(70.0, 10.0, 200.0, 50.0)];
			[noteInput setDelegate:self];// textViewDidBeginEditing
			
			[cell.contentView addSubview:noteLabel];
			[cell.contentView addSubview:noteInput];
			
			inputTextFieldNote=noteInput;
			
			[noteLabel release];
			[noteInput release];
			
			return cell;
		}
		else if(indexPath.section==1) {
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
			}
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			
			cell.textLabel.text = @"Photos";
			cell.textLabel.textColor = [Constants labelTextColor];
			cell.textLabel.font = [UIFont boldSystemFontOfSize:labelTextFontSize];
			
			cell.detailTextLabel.text = @"add new";
			cell.detailTextLabel.textColor = [UIColor grayColor];
			cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:labelTextFontSize];
			
			return cell;
		}
		else {
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
			}
		
			
			CGRect noteFrame = CGRectMake(10.0, 14.0, 70.0, 20.0);
			UILabel *noteLabel=[[UILabel alloc] initWithFrame:noteFrame];
			//noteLabel.backgroundColor=[UIColor colorWithRed:labelColorR/255.0 green:labelColorG/255.0 blue:labelColorB/255.0 alpha:labelColorAlpha];
			noteLabel.textColor=[Constants labelTextColor];
			noteLabel.textAlignment=UITextAlignmentLeft;
			noteLabel.font=[UIFont boldSystemFontOfSize:labelTextFontSize];
			noteLabel.text=@"Home Page";
			
			UITextField *noteInput=[[UITextField alloc] initWithFrame:CGRectMake(90.0, 18.0, 200.0, 20.0)];
			noteInput.font=[UIFont boldSystemFontOfSize:labelTextFontSize];
			noteInput.placeholder=@"URL";
			noteInput.returnKeyType=UIReturnKeyDone;
			[noteInput addTarget:self
						  action:@selector(beginToInputURL:) 
				forControlEvents:UIControlEventEditingDidBegin];
			[noteInput addTarget:self
						  action:@selector(textFieldShouldReturn:) 
				forControlEvents:UIControlEventEditingDidEndOnExit];
			
			[cell.contentView addSubview:noteLabel];
			[cell.contentView addSubview:noteInput];
			
			[noteLabel release];
			[noteInput release];
			
			return cell;
		}
	}
	if (contactsAndToDos==tableView) {
		if (indexPath.section==0) {
			UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"TwoTableViewCell" 
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			
			//cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
			return cell;
		}
		
		
		if (indexPath.section==1) {
			UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
				cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
				
				cell.textLabel.text = @"Label";
				cell.textLabel.textColor = [UIColor redColor];
				cell.textLabel.font = [UIFont systemFontOfSize:21];
				
				cell.detailTextLabel.text = @"(10)";
				cell.detailTextLabel.textColor = [UIColor grayColor];
				cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
			}
			return cell;
		}
		if (indexPath.section==2) {
			UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
			}
			return cell;
		}
		if (indexPath.section==3) 
		{
			
			//NotePhotoHomePageCell *cell = (NotePhotoHomePageCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
			UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NotePhotoHomePageCell" 
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			
			//cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
			return cell;
		}
	}
	
}

-(void)beginToInputURL:(id)sender{
	[self viewToUp:-215.0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section==1)
		if (openFlag) {
			return countOfRowsToInsert;
		}
		else {
			return 0;
		}

		
	return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

	if (contactsAndToDos==tableView) {
		if (indexPath.section==0) {
			return 120.0;
		}
		if (indexPath.section==1) {
			return 60.0;
		}
		if (indexPath.section==2){
			return 20.0;
		}
		if (indexPath.section==3){
			return 220.0;
		}

	}
	
	if (notePhotoURL==tableView) {
		if (indexPath.section==0) {
			return 61.0;
		}
		else{
			return 46.0;
		}
	}
}

#pragma mark Section header delegate

-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened{
	NSLog(@"%d opened",sectionOpened);
	if (sectionOpened==1) {
		if (openFlag==NO) {
			/*
			 Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
			 */
			//NSInteger countOfRowsToInsert = 2;
			NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
			for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
				[indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
			}
			
			openFlag=YES;
			[contactsAndToDos beginUpdates];
			[contactsAndToDos insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:UITableViewRowAnimationTop];
			[contactsAndToDos endUpdates];
			
			[indexPathsToInsert release];
		}
		else {
			openFlag=NO;
			//NSInteger countOfRowsToDelete = [contactsAndToDos numberOfRowsInSection:sectionClosed];
			
			//if (countOfRowsToDelete > 0)
			{
				NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
				for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
					[indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
				}
				[contactsAndToDos deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
				[indexPathsToDelete release];
			}
		}

		
	}

}
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed{
	NSLog(@"%d closed",sectionClosed);
	if (sectionClosed==1) {
		if (openFlag==YES) {
			openFlag=NO;
			//NSInteger countOfRowsToDelete = [contactsAndToDos numberOfRowsInSection:sectionClosed];
			
			//if (countOfRowsToDelete > 0)
			{
				NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
				for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
					[indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
				}
				[contactsAndToDos deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
				[indexPathsToDelete release];
			}
		}
		else {
			/*
			 Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
			 */
			//NSInteger countOfRowsToInsert = 2;
			NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
			for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
				[indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
			}
			
			openFlag=YES;
			[contactsAndToDos beginUpdates];
			[contactsAndToDos insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:UITableViewRowAnimationTop];
			[contactsAndToDos endUpdates];
			
			[indexPathsToInsert release];
			
		}

		
	}

	
}
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionPlus:(NSInteger)section{
	NSLog(@"%d plus clicked",section);
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    if (contactsAndToDos==tableView) {
		if (section==0) {
			return nil;
		}
		else if (section==1) {
			//if ([self.sectionInfoArray objectAtIndex:section]==nil)
			{
				SectionHeaderView *headerView= [[[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Contacts" section:section delegate:self] autorelease];
				return headerView;
			}
			//else {
			//	return [self.sectionInfoArray objectAtIndex:section];
			//}
			
		}
		else if(section==2){
			//if ([self.sectionInfoArray objectAtIndex:section]==nil) 
			{
				SectionHeaderView *headerView = [[[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"To Dos" section:section delegate:self] autorelease];
				return headerView;
			}
			//else {
			//	return [self.sectionInfoArray objectAtIndex:section];
			//}
			
		}
		else if(section==3){
			//if ([self.sectionInfoArray objectAtIndex:section]==nil) 
			{
								return nil;
			}
			//else {
			//	return [self.sectionInfoArray objectAtIndex:section];
			//}
		}
	}
	
	
	if (notePhotoURL==tableView) {
		
		UIView *toolView=[[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1.0, 6.0)] autorelease];
		return toolView;
	
	}
	return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	if (contactsAndToDos==tableView) {
		//if(section==2)
			//return 0.0;
		return 44.0;
	}
	
	if (notePhotoURL==tableView) {
		return 6.0;
	}
	return 0.0;
}


-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section {
	UIView *toolView=[[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1.0, 6.0)] autorelease];
    return toolView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 0.0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	if (contactsAndToDos==tableView) {
		return 4;
	}
	if (notePhotoURL==tableView) {
		return 3;
	}
	return 0;
}


-(void)actionSheet:(UIActionSheet *)menu didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [menu cancelButtonIndex]) {
        // do something because the user clicked "cancel".
    } else {
        // do something because the user clicked "the other button".
    }
}




// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated]; 
	
    /*
     Check whether the section info array has been created, and if so whether the section count still matches the current section count. In general, you need to keep the section info synchronized with the rows and section. If you support editing in the table view, you need to appropriately update the section info during editing operations.
     */
	if (self.sectionInfoArray == nil) {
		
        // For each play, set up a corresponding SectionInfo object to contain the default height for each row.
		NSMutableArray *infoArray = [[NSMutableArray alloc] init];
		

		SectionHeaderView *headerViewContacts= [[[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Contacts" section:0 delegate:self] autorelease];
		
		SectionHeaderView *headerViewToDos = [[[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"To Dos" section:1 delegate:self] autorelease];

		SectionHeaderView *headerViewOthers = [[[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Others" section:2 delegate:self] autorelease];

		[infoArray addObject:headerViewContacts];
		[infoArray addObject:headerViewToDos];
		[infoArray addObject:headerViewOthers];
		[headerViewContacts release];
		[headerViewToDos release];
		[headerViewOthers release];
	
		
		self.sectionInfoArray = infoArray;
		[infoArray release];
	}
	
}


//
- (void) viewWillDisappear:(BOOL) animated {
	//[self alertOKCancelAction];
	
    //[super viewWillDisappear:animated];
	//[self saveDataToDB];
}

-(void)saveDataToDB{
	if ([inputTextFieldCompanyName.text length]>0) {
		char *errorMsg;
		char *update = "INSERT OR REPLACE INTO company (company_name,\
		company_importance,\
		company_boothNumber,\
		company_note,\
		company_url) VALUES (?, ?, ?, ?, ?);";
		sqlite3_stmt *stmt;
		if (sqlite3_prepare_v2(database, update, -1, &stmt, nil) == SQLITE_OK) {
			//sqlite3_bind_int(stmt, 1, i);
			sqlite3_bind_text(stmt, 1, [inputTextFieldCompanyName.text UTF8String], -1, NULL);
			sqlite3_bind_text(stmt, 2, [labelImportance.text UTF8String], -1, NULL);
			sqlite3_bind_text(stmt, 3, [inputTextFieldBoothNumber.text UTF8String], -1, NULL);
			sqlite3_bind_text(stmt, 4, [inputTextFieldNote.text UTF8String], -1, NULL);
			sqlite3_bind_text(stmt, 5, [inputTextFieldURL.text UTF8String], -1, NULL);
		}
		if (sqlite3_step(stmt) != SQLITE_DONE)
			NSAssert1(0, @"Error updating table: %s", errorMsg);
		sqlite3_finalize(stmt);
		sqlite3_close(database); 
	}
	
}

- (void)alertOKCancelAction {
	// open a alert with an OK and cancel button
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
	[alert show];
	[alert release];
}
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	// the user clicked one of the OK/Cancel buttons
	if (buttonIndex == 0)
	{
		NSLog(@"cancel");
	}
	else
	{
		NSLog(@"ok");
	}
}


- (NSString *)dataFilePath { 
	NSArray *paths = NSSearchPathForDirectoriesInDomains(
														 NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *documentsDirectory = [paths objectAtIndex:0]; 
	return [documentsDirectory stringByAppendingPathComponent:databaseFileName];
} 

//In Super View:
//- (void) viewWillAppear:(BOOL) animated {
//    [super viewWillAppear:animated];
//    if (wentToSubscreen) {
//        //Do something important here
//    }
//    wentToSubscreen = NO;
//}

-(void)databaseInit{
	if (sqlite3_open([[self dataFilePath] UTF8String], &database)
        != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    
    char *errorMsg;
    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS company (row INTEGER PRIMARY KEY AUTOINCREMENT,\
																company_name TEXT,\
																company_importance TEXT,\
																company_boothNumber TEXT,\
																company_note TEXT,\
																company_url TEXT);";
    if (sqlite3_exec (database, [createSQL  UTF8String],
                      NULL, NULL, &errorMsg) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert1(0, @"Error creating table: %s", errorMsg);
    }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	[self showDoneAndCancelButton];
	[self databaseInit];
	//[self hiddenLineAndButtons:YES];

	arrayImportance=[[NSMutableArray alloc] init];
	for (int i=1;i<=10 ; i++) {
		[arrayImportance addObject:[NSString stringWithFormat:@"%d",i]];
	}

	
	[pickerImportance selectRow:1 inComponent:0 animated:NO];
	labelImportance.text=[arrayImportance objectAtIndex:[pickerImportance selectedRowInComponent:0]];
	
	[self hiddenPickerImportance:YES];
	
	[self.view setBackgroundColor:[Constants backgroundColor]];
	[notePhotoURL setBackgroundColor:[Constants backgroundColor]];
	
	openFlag=NO;
}
-(void)hiddenPickerImportance:(BOOL)hidden{
	[pickerImportance setHidden:hidden];
	[pickerToolbar setHidden:hidden];
}

-(void)showDoneAndCancelButton{
	[self.navigationItem setHidesBackButton:YES animated:YES];

	UIBarButtonItem * cancelButton =
	[[UIBarButtonItem alloc]
	 initWithTitle:@"Cancel"
	 style:UIBarButtonItemStyleBordered
	 target:self
	 action:@selector(cancelButtonClicked:) 
	 ];	
	self.navigationItem.leftBarButtonItem=cancelButton;
	
	UIBarButtonItem * doneButton =
	[[UIBarButtonItem alloc]
	 initWithTitle:@"Done"
	 style:UIBarButtonItemStyleBordered
	 target:self
	 action:@selector(doneButtonClicked:) 
	 ];
	self.navigationItem.rightBarButtonItem=doneButton;
	self.navigationItem.rightBarButtonItem.enabled=NO;
	
	[cancelButton release];
	[doneButton release];
}

-(void)showBackAndEdit{
	self.navigationItem.leftBarButtonItem=nil;
	self.navigationItem.rightBarButtonItem=nil;
	
	UIBarButtonItem * editButton =
	[[UIBarButtonItem alloc]
	 initWithTitle:@"Edit"
	 style:UIBarButtonItemStyleBordered
	 target:self
	 action:@selector(editButtonClicked:)
	 ];
	self.navigationItem.rightBarButtonItem=editButton;
	[editButton release];
	
	
	[self.navigationItem setHidesBackButton:NO animated:YES];
	//[self hiddenLineAndButtons:YES];
}

-(IBAction)editButtonClicked:(id)sender{
	//NSLog(@"edit clicked");
	[self hiddenLineAndButtons:NO];
	[self showDoneAndCancelButton];
}

-(IBAction)doneButtonClicked:(id)sender{
	[self saveDataToDB];
	[self showBackAndEdit];
}

-(IBAction)cancelButtonClicked:(id)sender{
	[self showBackAndEdit];
	[self textFieldDone];
}

-(void)hiddenLineAndButtons:(BOOL)hidden{
	[buttonCompany setHidden:hidden];
	[lineCompanyH setHidden:hidden];
	[lineCompanyV setHidden:hidden];
	[lineImportance setHidden:hidden];
	
	if (hidden) {
		if ([inputTextFieldNote.text length]==0) {
			[inputTextFieldNote setHidden:hidden];
			[buttonNote setHidden:hidden];
			[labelNote setHidden:hidden];
		}
		{
			[buttonPhoto setHidden:hidden];
			[labelPhoto setHidden:hidden];
		}
		if ([inputTextFieldURL.text length]==0) {
			[inputTextFieldURL setHidden:hidden];
			[buttonHomePage setHidden:hidden];
			[labelHomePage setHidden:hidden];
		}
	}
	else {
		{
			[inputTextFieldNote setHidden:hidden];
			[buttonNote setHidden:hidden];
			[labelNote setHidden:hidden];
		}
		{
			[buttonPhoto setHidden:hidden];
			[labelPhoto setHidden:hidden];
		}
		{
			[inputTextFieldURL setHidden:hidden];
			[buttonHomePage setHidden:hidden];
			[labelHomePage setHidden:hidden];
		}
	}

	
}

-(IBAction)labelImportanceClicked:(id)sender{

	
	
//	NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n\n" ;
//	
//	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Set", nil];
//	[actionSheet showInView:self.view];
//	
//	
//	UIDatePicker *datePicker = [[[UIDatePicker alloc] init] autorelease];
//	datePicker.tag = 101;
//	datePicker.datePickerMode = UIDatePickerModeDate;//[(UISegmentedControl *)self.navigationItem.titleView selectedSegmentIndex];
//	
//	
//	[actionSheet addSubview:datePicker];
	
	
	
	NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n\n" ;
	actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil 
								destructiveButtonTitle:nil otherButtonTitles:nil,  nil];
	

	UIPickerView *pickerB=[[[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 44.0, 0.0, 0.0)] autorelease];
	pickerB.autoresizingMask=UIViewAutoresizingFlexibleWidth;
	pickerB.showsSelectionIndicator = YES;
	pickerB.delegate=self;
	pickerB.dataSource=self;
	pickerB.tag = 101;
	[pickerB selectRow:[arrayImportance indexOfObject:labelImportance.text] inComponent:0 animated:TRUE];
	
	UIToolbar *pickerDateToolbar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
	pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
	[pickerDateToolbar sizeToFit];
	
	NSMutableArray *barItems = [[NSMutableArray alloc] init];
	
	UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	[barItems addObject:flexSpace];
	
	UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(DatePickerDoneClick:)];
	[barItems addObject:doneBtn];
	
	[pickerDateToolbar setItems:barItems animated:YES];
	
	
//	[aac addSubview:dtpicker];
    [actionSheet showInView:self.view];
	[actionSheet addSubview:pickerDateToolbar];
	[actionSheet addSubview:pickerB];
	
}

-(void) DatePickerDoneClick:(id)sender{
	//[pickerDateToolbar setHidden:hidden];
	[actionSheet dismissWithClickedButtonIndex:0 animated:TRUE];
	//[self hiddenPickerImportance:YES];
}

-(IBAction)pickerToolbarDoneClicked:(id)sender{
	[self hiddenPickerImportance:YES];
}

-(IBAction)labelImportanceDone:(id)sender{
	//[self hiddenPickerImportance:YES];
	//[inputTextFieldCompanyName resignFirstResponder];
//	[inputTextFieldBoothNumber resignFirstResponder];
//	[inputTextFieldNote resignFirstResponder];
//	[inputTextFieldURL resignFirstResponder];
	//[self textFieldDone];
}

-(void)textFieldDone{
	[self textFieldShouldReturn:inputTextFieldCompanyName];
	[self textFieldShouldReturn:inputTextFieldBoothNumber];
	//[self textFieldShouldReturn:inputTextFieldNote];
	[self textFieldShouldReturn:inputTextFieldURL];
	
	[self textViewShouldEndEditing:inputTextFieldNote];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [arrayImportance count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    labelImportance.text=[arrayImportance objectAtIndex:row];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [arrayImportance objectAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {	
    //NOT REACHED
    return 100;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (void)textFieldDidBeginEditing:(UITextField *)textField{
	//NSLog(@"begin");
	CGFloat VIEW_UP=0.0f;
//	if (self.inputTextFieldNote == textField) {
//		VIEW_UP=-100;
//		//self.inputTextFieldNote.keyboardType=UIKeyboardTypeDefault;
//	}
	if (self.inputTextFieldURL == textField) {
		VIEW_UP=-200;
		self.inputTextFieldURL.keyboardType=UIKeyboardTypeURL;
	}
	if (self.inputTextFieldBoothNumber == textField) {
		//self.inputTextFieldBoothNumber.keyboardType=UIKeyboardTypeNumberPad;
	}
	
	[self viewToUp:VIEW_UP];
	
	self.navigationItem.rightBarButtonItem.enabled=YES;//Done button
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
	[self viewToUp:-150];
}

- (void)textViewDidChange:(UITextView *)textView{
//	if ([textView.text length]>20) {
//		[textView setFrame:CGRectMake(90.0, 10.0, 200.0, 100.0)];
//	}
	
}

-(void)viewToUp:(CGFloat)VIEW_UP{
	NSTimeInterval animationDuration = 0.30f;
	
	[UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
	
	[UIView setAnimationDuration:animationDuration];
	
	float width = self.view.frame.size.width;
	
	float height = self.view.frame.size.height;
	
	CGRect rect = CGRectMake(0.0f, VIEW_UP,width,height);
	
	self.view.frame = rect;
	
	[UIView commitAnimations];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.
	
    NSTimeInterval animationDuration = 0.30f;
	
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
	
    [UIView setAnimationDuration:animationDuration];
	
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
	
    self.view.frame = rect;
	
    [UIView commitAnimations];
	
    [textField resignFirstResponder];
	
    return YES;
	
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
	NSTimeInterval animationDuration = 0.30f;
	
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
	
    [UIView setAnimationDuration:animationDuration];
	
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
	
    self.view.frame = rect;
	
    [UIView commitAnimations];
	
    [textView resignFirstResponder];
	
    return YES;
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
	self.sectionInfoArray=nil;
}


- (void)dealloc {
	[sectionInfoArray release];
    [super dealloc];
}


@end
