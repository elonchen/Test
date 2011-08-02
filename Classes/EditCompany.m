//
//  EditCompany.m
//  TradeShowInfo
//
//  Created by Elon on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditCompany.h"
#import "SectionHeaderView.h"
#import "Constants.h"
#import "TwoTableViewCell.h"
#import "Company.h"
#import "CompanyDao.h"

#define countOfContacts 30


@implementation EditCompany
@synthesize TTVC,NPHPC;
@synthesize headerViewOfContacts,headerViewOfToDos,openFlagOfContacts;


@synthesize edit,comName,boothNum;
@synthesize importance;

@synthesize keyboardToolbar;
@synthesize companyDao;

@synthesize status;

@synthesize newEditNotesField;


-(IBAction)doneButtonClicked:(id)sender{
	[self dispearAllTextfield];
	[self saveCompany];
//	if (edit) {
//		[companyDao updateAt:[super getIndex]
//						Name:TTVC.companyBoothCell.inputCompanyName.text 
//					   Booth:TTVC.companyBoothCell.inputBoothNumber.text 
//				  Importance:[TTVC.importanceCell.labelNumber.text intValue]
//					   Notes:NPHPC.notesCell.labelValue.text 
//					  Photos:nil 
//					HomePage:NPHPC.homePageCell.textField.text 
//						TsId:1];
//		
//	
//	}else {
//		[companyDao insertWithTitle:TTVC.companyBoothCell.inputCompanyName.text 
//							  Booth:TTVC.companyBoothCell.inputBoothNumber.text 
//						 Importance:[TTVC.importanceCell.labelNumber.text intValue]
//							  Notes:NPHPC.notesCell.labelValue.text 
//							 Photos:nil 
//						   HomePage:NPHPC.homePageCell.textField.text 
//							   TsId:1];
//	}

	
	
	//[self saveCompanyToDB:TTVC.companyBoothCell.inputCompanyName.text importance:TTVC.importanceCell.labelNumber.text booth:TTVC.companyBoothCell.inputBoothNumber.text note:NPHPC.notesCell.textView.text url:NPHPC.homePageCell.textField.text];
	//self.navigationItem.rightBarButtonItem.enabled=NO;

}

-(void)saveCompany{
	if (edit) {
		[companyDao updateAt:[super getIndex]
						Name:TTVC.companyBoothCell.inputCompanyName.text 
					   Booth:TTVC.companyBoothCell.inputBoothNumber.text 
				  Importance:[TTVC.importanceCell.labelNumber.text intValue]
					   Notes:NPHPC.notesCell.labelValue.text 
					  Photos:nil 
					HomePage:NPHPC.homePageCell.textField.text 
						TsId:1];
		
		
	}else {
		[companyDao insertWithTitle:TTVC.companyBoothCell.inputCompanyName.text 
							  Booth:TTVC.companyBoothCell.inputBoothNumber.text 
						 Importance:[TTVC.importanceCell.labelNumber.text intValue]
							  Notes:NPHPC.notesCell.labelValue.text 
							 Photos:nil 
						   HomePage:NPHPC.homePageCell.textField.text 
							   TsId:1];
	}
}

-(void)noteLabelCell:(NoteLabelCell *)noteLabelCell labelClicked:(NSString *)labelText{
	[self saveCompany];
	
	newEditNotesField = [[EditNotesField alloc] initWithNibName:@"EditNotesField" bundle:nil];	
	newEditNotesField.editNote = NPHPC.notesCell.labelValue.text;
	
	status = 2;
	
	[[self navigationController] pushViewController:newEditNotesField animated:YES];
	
}

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	companyDao = [[CompanyDao alloc] init];
	//self.companiesArray = [companyDao select];	

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	//self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
	//edit=FALSE;
	headerViewOfContacts= [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:[NSString stringWithFormat:@"Contacts (%d)",countOfContacts] section:1 delegate:self];
	headerViewOfToDos = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"To Dos(0)" section:2 delegate:self];

	// to take care the keyboard view
	//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];	
}

#pragma mark -
#pragma mark UIWindow Keyboard Notifications
- (IBAction)dismissKeyboard:(id)sender
{
	[self dispearAllTextfield];
}
- (void)dispearAllTextfield{
	//[NPHPC.notesCell.textView resignFirstResponder];
	[TTVC.companyBoothCell.inputBoothNumber resignFirstResponder];
	[TTVC.companyBoothCell.inputCompanyName resignFirstResponder];
	[NPHPC.homePageCell.textField resignFirstResponder];
	keyboardToolbar.alpha = 0.0;
}

- (void)keyboardWillShow:(NSNotification *)notification
{
	
//		 UIWindow *tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
//         UIView *keyboard;
//         /*遍历windwos中所有的view，取得键盘view,最新的ios不支持这样的方法*/
//         for(int i = 0;i<tempWindow.subviews.count;i++){
//                 keyboard = [tempWindow.subviews objectAtIndex:i];
//                
//                 if([[NSString stringWithUTF8String:object_getClassName(keyboard)] isEqualToString:@"UIKeyboard"]){
//					 NSLog(@"find keyboard");
//                 }
//         }
	
//	CGPoint beginCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterBeginUserInfoKey] CGPointValue];
//	CGPoint endCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterEndUserInfoKey] CGPointValue];
//	CGRect keyboardBounds = [[[notification userInfo] valueForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
	UIViewAnimationCurve animationCurve	= [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];		
			
	if(nil == keyboardToolbar) {
			keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,44)];
			keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
			keyboardToolbar.tintColor = [UIColor darkGrayColor];
			
			UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissKeyboard:)];
			UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
			
//			UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:
//																					 NSLocalizedString(@"Previous",@"Previous form field"),
//																					 NSLocalizedString(@"Next",@"Next form field"),																				  
//																					 nil]];
//			control.segmentedControlStyle = UISegmentedControlStyleBar;
//			control.tintColor = [UIColor darkGrayColor];
//			control.momentary = YES;
//			[control addTarget:self action:@selector(nextPrevious:) forControlEvents:UIControlEventValueChanged];			
//			
//			UIBarButtonItem *controlItem = [[UIBarButtonItem alloc] initWithCustomView:control];
//			
//			self.nextPreviousControl = control;
			
			
			//NSArray *items = [[NSArray alloc] initWithObjects:controlItem, flex, barButtonItem, nil];
			NSArray *items = [[NSArray alloc] initWithObjects:flex, barButtonItem, nil];
			[keyboardToolbar setItems:items];
			//[control release];
			[barButtonItem release];
			[flex release];
			[items release];			
			
			
			//[self.view.superview addSubview:keyboardToolbar];		
		}		

//	}		

	CGFloat x=0.0;
	CGFloat y=self.view.frame.size.height - 196.0;
	keyboardToolbar.frame = CGRectMake(x, 
									   y, 
									   keyboardToolbar.frame.size.width, 
									   keyboardToolbar.frame.size.height);
	NSLog(@"%f,%f,%f,%f",x,y,keyboardToolbar.frame.size.width,keyboardToolbar.frame.size.height);
	//keyboardToolbar.frame = CGRectMake(0,100,keyboardToolbar.frame.size.width, keyboardToolbar.frame.size.height);
	[self.view.window addSubview:keyboardToolbar];		
	
	[UIView beginAnimations:@"RS_showKeyboardAnimation" context:nil];	
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	
	keyboardToolbar.alpha = 1.0;	
//	keyboardToolbar.frame = CGRectMake(endCentre.x - (keyboardBounds.size.width/2), 
//									   endCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height - self.view.frame.origin.y, 
//									   keyboardToolbar.frame.size.width, 
//									   keyboardToolbar.frame.size.height);
	//keyboardToolbar.frame = CGRectMake(0,100,keyboardToolbar.frame.size.width, keyboardToolbar.frame.size.height);

	[UIView commitAnimations];		
	
	keyboardToolbarShouldHide = YES;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
	if (nil == keyboardToolbar || !keyboardToolbarShouldHide) {
		return;
	}	
	
	//	CGPoint beginCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterBeginUserInfoKey] CGPointValue];
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
}/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	
	//NSLog(@"all displayed");	
//	if (edit) {
//		Company *c = [companyDao getCompanyById: [super getIndex]];
//		TTVC.companyBoothCell.inputCompanyName.text=c.name;
//		TTVC.companyBoothCell.inputBoothNumber.text=c.booth;
//		TTVC.importanceCell.labelNumber.text=[NSString stringWithFormat:@"%d",[c getImportance]];
//		NPHPC.notesCell.labelValue.text = c.notes;
//		NPHPC.homePageCell.textField.text = c.homePage;
//
//	}
	
	if (status != 0) {
		Company *c = [companyDao getCompanyById: [super getIndex]];
		TTVC.companyBoothCell.inputCompanyName.text=c.name;
		TTVC.companyBoothCell.inputBoothNumber.text=c.booth;
		TTVC.importanceCell.labelNumber.text=[NSString stringWithFormat:@"%d",[c getImportance]];
		
		if (status == 1) {
			NPHPC.notesCell.labelValue.text = c.notes;
		}else if (status == 2) {
			NPHPC.notesCell.labelValue.text = newEditNotesField.editNote;
		}
		
		NPHPC.homePageCell.textField.text = c.homePage;
		
	}
	
	NPHPC.notesCell.labelValue.minimumFontSize = 17.0;
	
	TTVC.importanceCell.delegate=self;// ImportanceCellClickedDelegate 

	NPHPC.notesCell.delegate = self;
}
-(void)importanceCell:(ImportanceCell*)importanceCell numberClicked:(NSString *)number{
	[super	showImportancePicker:TTVC.importanceCell.labelNumber.text];
	[self dispearAllTextfield];
}

//must implement for set the data for the importance.
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    TTVC.importanceCell.labelNumber.text=[super.arrayImportance objectAtIndex:row];
}



/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if(section==1)
		if (openFlagOfContacts) {
			return countOfContacts;
		}
		else {
			return 0;
		}
	if(section==2)
		return 0;
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    

    if (indexPath.section==0) {
		
		if (TTVC==nil) {
			NSArray *array =[[NSBundle mainBundle] loadNibNamed:@"TwoTableViewCell" 
											   owner:self
											 options:nil];
			
			cell=[array objectAtIndex:0]; 
			TTVC=(TwoTableViewCell *)cell;
			[TTVC retain];//So it will not be dealloced
			NSLog(@"TTVC is nil, create new on viewDidLoad.");
		}
		else {
			cell=TTVC;
		}


	}
	else if(indexPath.section==1){
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
	else if(indexPath.section==2){
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		}
	}
	else if(indexPath.section==3){
		if (NPHPC==nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NotePhotoHomePageCell" 
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			NPHPC=(NotePhotoHomePageCell *)cell;
			[NPHPC retain];
		}
		else {
			cell=NPHPC;
		}


	}

	
	if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	CGFloat height=0.0;

	if (indexPath.section==0) {
		height=120.0;
	}
	if (indexPath.section==1) {
		height=44.0;
	}
	if (indexPath.section==2){
		height=20.0;
	}
	if (indexPath.section==3){
		height=220.0;
	}
		
	return height;
}







-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {

	if (section==0) {
		return nil;
	}
	else if (section==1) {
		return headerViewOfContacts;			
	}
	else if(section==2){
		return headerViewOfToDos;			
	}
	else if(section==3){	
		return nil;
	}
	
	return nil;	
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


-(void)insertOrDeleteContacts:(NSInteger)sectionNumber{
	if (sectionNumber==1) {
		if (openFlagOfContacts==NO) {
			/*
			 Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
			 */
			//NSInteger countOfRowsToInsert = 2;
			NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
			for (NSInteger i = 0; i < countOfContacts; i++) {
				[indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionNumber]];
			}
			
			openFlagOfContacts=YES;
			[self.tableView beginUpdates];
			[self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:UITableViewRowAnimationTop];
			[self.tableView endUpdates];
			
			[indexPathsToInsert release];
			NSLog(@"table view height %f",self.view.frame.size.height);
		}
		else {
			openFlagOfContacts=NO;
			//NSInteger countOfRowsToDelete = [contactsAndToDos numberOfRowsInSection:sectionClosed];
			
			//if (countOfRowsToDelete > 0)
			{
				NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
				for (NSInteger i = 0; i < countOfContacts; i++) {
					[indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionNumber]];
				}
				[self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
				[indexPathsToDelete release];
			}
			NSLog(@"table view height %f",self.view.frame.size.height);
		}
	}
}

#pragma mark Section header delegate
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened{
	NSLog(@"%d opened",sectionOpened);

	[self insertOrDeleteContacts:sectionOpened];

}
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed{
	NSLog(@"%d closed",sectionClosed);
	[self insertOrDeleteContacts:sectionClosed];
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
}


- (void)dealloc {
	[comName release];
	[boothNum release];
	[importance release];
	[companyDao release];
//	[arrayImportance release];
	
	[TTVC release];
	[NPHPC release];
	[headerViewOfToDos release];
	[headerViewOfContacts release];
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];	
	[keyboardToolbar release], keyboardToolbar = nil;
    [super dealloc];
}


@end

