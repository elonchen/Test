//
//  TradeShowInfoViewController.m
//  TradeShowInfo
//
//  Created by Bright Creek on 3/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TradeShowInfoViewController.h"
#import "Constants.h"
//#import "HotelInfoController.h"
#import "IconNav.h"
#import "FloorController.h"

#import "UIPicker.h"
#import "TbNoteDao.h"
#import "TradeShow.h"
#import "TradeShowDao.h"
#import "SqlSampleAppDelegate.h"



static NSString *kViewKey = @"kViewKey";
static NSString *kTitleKey = @"kTitleKey";
static NSString *defaultKey = @"defaultKey";
static NSString *kSectionTitleKey = @"kSectionTitleKey";

static NSString *TSName=@"Required";
static NSString *TSBeginDate=@"Required";
static NSString *TSEndDate=@"Required";

@implementation TradeShowInfoViewController

@synthesize menuArray;
@synthesize textFieldNormal;
@synthesize addressText;
@synthesize dateBegin,dateEnd;
//@synthesize datePickerView;
//@synthesize	dateFormatter;


//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//	UIDatePicker *datePicker = (UIDatePicker *)[actionSheet viewWithTag:101];
//	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
//	
////			formatter.dateFormat = @"h:mm a";
//		
//	//		formatter.dateFormat = @"dd MMMM yyyy";
//		
//		//case 3:
//	//		formatter.dateFormat = @"HH:mm";
////			break;
////		default:
////			break;
//	
//	
//	NSString *timestamp = [formatter stringFromDate:datePicker.date];
//	[(UILabel *)[self.view viewWithTag:103] setText:timestamp];
//	[actionSheet release];
//}

- (NSString *)dataFilePath { 
	NSArray *paths = NSSearchPathForDirectoriesInDomains(
		NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *documentsDirectory = [paths objectAtIndex:0]; 
	return [documentsDirectory stringByAppendingPathComponent:kFilename];
} 

- (void)applicationWillTerminate:(NSNotification *)notification {
	NSMutableArray *array = [[NSMutableArray alloc] init]; 
	[array addObject:textFieldNormal.text]; 
	[array addObject:dateBegin.text]; 
	[array addObject:dateEnd.text];
	[array writeToFile:[self dataFilePath] atomically:YES]; 
	[array release];
}

- (void)saveTradeshow{
	[tradShowDao updateAt:1 Name:textFieldNormal.text 
					Begin:[self converStrToDBDateFomart:dateBegin.text]
					  End:[self converStrToDBDateFomart:dateEnd.text]];
}

- (void)saveDataToPlist{
	NSMutableArray *array = [[NSMutableArray alloc] init]; 
	[array addObject:textFieldNormal.text]; 
	[array addObject:dateBegin.text]; 
	[array addObject:dateEnd.text];
	[array writeToFile:[self dataFilePath] atomically:YES]; 
	[array release];
}

-(IBAction)homeButtonClicked:(id)sender{
/*	HotelInfoController *hotel=[[HotelInfoController alloc] 
								initWithNibName:@"HotelInfoController"
								bundle:nil];*/
	
	IconNav *home=[[IconNav alloc] 
								initWithNibName:@"IconNav"
								bundle:nil];
	
/*	AddNewCompany *home=[[AddNewCompany alloc] 
				   initWithNibName:@"AddNewCompany"
				   bundle:nil];*/
	
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
	
	home.title=textFieldNormal.text;
	[[self navigationController] pushViewController:home animated:YES];
	
	/*
	MyView *myTest=[[MyView alloc] initWithFrame:CGRectMake(10, 240, 200, 200)];
	[myTest setBackgroundColor:[UIColor whiteColor]];
	
	[self.view insertSubview:myTest atIndex:0];// must be view, and .h IBoutlet must to Nib 
*/
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
		
	self.tableView.backgroundColor=[Constants backgroundColor];	

//	NSString *filePath = [self dataFilePath]; 
//
//	if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {	
//		NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath]; 
//		//NSLog([array objectAtIndex:0]);
//		TSName=[array objectAtIndex:0];
//		TSBeginDate = [array objectAtIndex:1]; 
//		TSEndDate = [array objectAtIndex:2];
//		//[array release];
//		
//		
//		
//	}
//	else {
//		NSMutableArray *array = [[NSMutableArray alloc] init]; 
//		[array addObject:@"1"]; 
//		[array addObject:@"2"]; 
//		[array addObject:@"3"];
//		[array writeToFile:[self dataFilePath] atomically:YES]; 
//		[array release];
//	}
	
	tradShowDao = [[TradeShowDao alloc] init];
	TradeShow* ts = [[tradShowDao getTradeShowById:1] autorelease];
	
		
	TSName = ts.name;
	if ([super converStrToShowDateFomart:ts.begin] != nil) {
		TSBeginDate =[super converStrToShowDateFomart:ts.begin];
	}
	if ([super converStrToShowDateFomart:ts.end] != nil) {
		TSEndDate = [super converStrToShowDateFomart:ts.end];
	}
	
	//TSEndDate = @"Dec 09, 1995";	
	NSLog(@"end date: %@", TSEndDate);
	UIApplication *app = [UIApplication sharedApplication];
		
	[[NSNotificationCenter defaultCenter] addObserver:self
										selector:@selector(applicationWillTerminate:)
										name:UIApplicationWillTerminateNotification 
										object:app];
																									 	

	
	
	self.menuArray = [NSMutableArray array];
	[self.menuArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
							   @"Trade Show Name", kTitleKey,
							   @"Requered", defaultKey,
							   //@"Get ready to be extremely productive at your next Trade Show!\n
							   @"To start enter the name of the Trade Show.",kSectionTitleKey,
							   self.textFieldNormal, kViewKey,
							   nil]];
	//NSMutableArray *dateTitle = [NSMutableArray array];
//	[dateTitle addObject:self.dateBegin];
//	[dateTitle addObject:self.dateEnd];
	[self.menuArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
							   @"Beginning Date", kTitleKey,
							   self.dateBegin, defaultKey,
							   self.dateEnd, kViewKey,
							   @"",kSectionTitleKey,
							   nil]];
	//[dateTitle release];
//	[self.menuArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
//							   @"Address", kTitleKey,
//							   @"", defaultKey,
//							   self.addressText, kViewKey,
//							   @"",kSectionTitleKey,
//							   nil]];
	

}

-(void)viewWillAppear:(BOOL)animated{
	[self checkRequired];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self.menuArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [[self.menuArray objectAtIndex: section] valueForKey:kSectionTitleKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section==1) {
		return 2;
	}
	return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return ([indexPath section] == 0) ? 90.0 : 50.0;
}

// to determine which UITableViewCell to be used on a given row.
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (aCell == nil)
	{
		aCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		// Make the Display Picker and Create New Contact rows look like buttons
		//if (indexPath.section < 2)
//		{
//			aCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//			aCell.textLabel.textAlignment = UITextAlignmentCenter;
//		}
//		else
//		{
//			aCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
//			aCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//			aCell.detailTextLabel.numberOfLines = 0;
//			// Display descriptions for the Edit Unknown Contact and Display and Edit Contact rows 
//			aCell.detailTextLabel.text = [[menuArray objectAtIndex:indexPath.section] valueForKey:@"description"];
//		}
	
	//aCell.selectionStyle = UITableViewCellSelectionStyleBlue;
	CGRect frame = CGRectMake(2.0, 10.0, 130.0, 30.0);
	UILabel *lname = [[UILabel alloc] initWithFrame:frame];
	lname.text = [[menuArray objectAtIndex:indexPath.section] valueForKey:@"kTitleKey"];
	if (indexPath.section == 1 && indexPath.row ==1) {
		lname.text = @"Ending Date";
	}
	lname.textColor = [UIColor orangeColor];
	lname.textAlignment = UITextAlignmentRight;
	lname.font = [UIFont systemFontOfSize:14.0];
	[aCell.contentView addSubview:lname];
	[lname release];
	if (indexPath.section==0) {
		UITextField *textField = [[self.menuArray objectAtIndex: indexPath.section] valueForKey:kViewKey];
		[aCell.contentView addSubview:textField];
		aCell.selectionStyle = UITableViewCellSelectionStyleNone;
		[textField release];
	
	}else if(indexPath.section==1){
		UILabel *dateLabel;//=[[self.menuArray objectAtIndex: indexPath.section] valueForKey:kViewKey];
		if (indexPath.row == 0) {
			dateLabel = [[self.menuArray objectAtIndex: indexPath.section] valueForKey:defaultKey];
		}else if(indexPath.row ==1){
			dateLabel = [[self.menuArray objectAtIndex: indexPath.section] valueForKey:kViewKey];
		}
		[aCell.contentView addSubview:dateLabel];
		[dateLabel release];
	}else if (indexPath.section==2) {
		UITextField *textField = [[self.menuArray objectAtIndex: indexPath.section] valueForKey:kViewKey];
		[aCell.contentView addSubview:textField];
		[textField release];
	}
	}
	return aCell;
}
- (UITextField *)textFieldNormal
{
	if (textFieldNormal == nil)
	{
		CGRect frame = CGRectMake(12.0, 50.0, 275.0, 30.0);
		textFieldNormal = [[UITextField alloc] initWithFrame:frame];
		
		textFieldNormal.borderStyle = UITextBorderStyleNone;
		textFieldNormal.textColor = [UIColor blackColor];
		textFieldNormal.font = [UIFont systemFontOfSize:17.0];
		textFieldNormal.placeholder = @"Required";
		if (TSName!=@"Required") {
			textFieldNormal.text = TSName;
		}
		
		textFieldNormal.backgroundColor = [UIColor whiteColor];
		textFieldNormal.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		
		textFieldNormal.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
		textFieldNormal.returnKeyType = UIReturnKeyDone;
		
		textFieldNormal.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
		//t//extFieldNormal.
		textFieldNormal.tag = 1;		// tag this control so we can remove it later for recycled cells
		
		textFieldNormal.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed
		
		[textFieldNormal addTarget:self 
						action:@selector(textFieldDone:)
			  forControlEvents:UIControlEventEditingDidEndOnExit];
		
		// Add an accessibility label that describes what the text field is for.
		[textFieldNormal setAccessibilityLabel:NSLocalizedString(@"NormalTextField", @"")];
	}	
	return textFieldNormal;
}
- (UITextField *)addressText
{
	if (addressText == nil)
	{
		CGRect frame = CGRectMake(150.0, 15.0, 150.0, 30.0);
		addressText = [[UITextField alloc] initWithFrame:frame];
		
		addressText.borderStyle = UITextBorderStyleNone;
		addressText.textColor = [UIColor blackColor];
		addressText.font = [UIFont systemFontOfSize:17.0];
		addressText.placeholder = @"";
		//if (TSName!=@"Required") {
			addressText.text = @"";
//		}
		
		addressText.backgroundColor = [UIColor whiteColor];
		addressText.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		
		addressText.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
		addressText.returnKeyType = UIReturnKeyDone;
		
		addressText.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
		
		//textFieldNormal.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed
		
		[addressText addTarget:self 
							action:@selector(textFieldDone:)
				  forControlEvents:UIControlEventEditingDidEndOnExit];
		
		// Add an accessibility label that describes what the text field is for.
		[addressText setAccessibilityLabel:NSLocalizedString(@"addressText", @"")];
	}	
	return addressText;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	if (range.location >= 100)
		return NO; // return NO to not change text
	return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
	self.navigationItem.leftBarButtonItem.enabled=NO;
	return YES;
}


// textFieldNormal.delegate = self;
- (void)textFieldDone:(id)sender{
	[sender resignFirstResponder];
	//[self datePickerDisAppear];
	[self checkRequired];
	[self saveTradeshow];
	
}
-(void)datePickerDisAppear{
	self.view.frame = CGRectMake(0.0, 0.0, 320.0, 416.0);
	datePickerView.hidden = YES;
}


-(BOOL)checkRequired{

	if ([textFieldNormal.text length]>0 && dateBegin.text!=@"Required" && dateEnd.text!=@"Required") 
	{
		self.navigationItem.leftBarButtonItem.enabled=YES;
		return YES;
	}
	else {
		self.navigationItem.leftBarButtonItem.enabled=NO;
		return NO;
	}

}

- (UILabel *)dateBegin
{
	if (dateBegin == nil)
	{
		CGRect frame = CGRectMake(150.0, 8.0, 140.0, 30.0);
		dateBegin = [[UILabel alloc] initWithFrame:frame];
		
		if (TSBeginDate==@"Required") {
			dateBegin.textColor = [UIColor lightGrayColor];
		}else {
			dateBegin.textColor = [UIColor blackColor];
		}
		dateBegin.text = TSBeginDate;

		dateBegin.textAlignment = UITextAlignmentLeft;
		[dateBegin setAccessibilityLabel:NSLocalizedString(@"dateBegin", @"")];
	}	
	return dateBegin;
}
- (UILabel *)dateEnd
{
	if (dateEnd == nil)
	{
		CGRect frame = CGRectMake(150.0, 8.0, 140.0, 30.0);
		dateEnd = [[UILabel alloc] initWithFrame:frame];
		if (TSEndDate==@"Required") {
			dateEnd.textColor = [UIColor lightGrayColor];
		}else {
			dateEnd.textColor = [UIColor blackColor];
		}
		dateEnd.text =TSEndDate;
		dateEnd.textAlignment = UITextAlignmentLeft;

		[dateEnd setAccessibilityLabel:NSLocalizedString(@"dateEnd", @"")];
	}	
	return dateEnd;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[textFieldNormal resignFirstResponder];
	[addressText resignFirstResponder];
	//[self datePickerDisAppear];
	if (indexPath.section == 1) {

		//TbNoteDao *tbNoteDao = [[TbNoteDao alloc] init];
		//[tbNoteDao insertWithTitle:@"TEST TITLE" Body:@"TEST BODY"];
		
		[self showDataPicker:indexPath];
						
	}

}


-(void) showDataPicker:(NSIndexPath *)indexPath{
	
	NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n\n" ;
	
	actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
	[actionSheet showInView:self.view];
	
	
	datePickerView = [[[UIDatePicker alloc] initWithFrame:CGRectMake(0.0, 44.0, 0.0, 0.0)] autorelease];
	datePickerView.tag = 101;
	datePickerView.datePickerMode = UIDatePickerModeDate;//[(UISegmentedControl *)self.navigationItem.titleView selectedSegmentIndex];
	
	
	UIToolbar *pickerDateToolbar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
	pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
	[pickerDateToolbar sizeToFit];			
	NSMutableArray *barItems = [[NSMutableArray alloc] init];			
	
	
	UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(DatePickerCancelClick)];
	[barItems addObject:cancelBtn];
	
	UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	[barItems addObject:flexSpace];
	
	UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
	
	if(indexPath.row==0){
		
		NSDate *time = (dateBegin.text != @"Required")?[showDateFormatter dateFromString:dateBegin.text]:[NSDate date];
		datePickerView.date = time;
		doneBtn.action = @selector(beginDateDoneClick);
	}else{
		NSDate *time = (dateEnd.text != @"Required")?[showDateFormatter dateFromString:dateEnd.text]:[NSDate date];
		datePickerView.date = time;
		doneBtn.action = @selector(endDateDoneClick);

	}	
	[barItems addObject:doneBtn];
	[pickerDateToolbar setItems:barItems animated:YES];
	
	[actionSheet showInView:self.view];
	[actionSheet addSubview:pickerDateToolbar];
	
	[actionSheet addSubview:datePickerView];
	
	[self viewToUp:-150];
}

-(void) beginDateDoneClick{
	NSLog(@"datapicker done");
	dateBegin.text = [showDateFormatter stringFromDate:[datePickerView date] ];
	dateBegin.textColor = [UIColor blackColor];
	[actionSheet dismissWithClickedButtonIndex:0 animated:TRUE];
	[self checkRequired];
	[self ViewToDown];
	[self saveTradeshow];
}

-(void) endDateDoneClick{
	dateEnd.text = [showDateFormatter stringFromDate:[datePickerView date]];
	dateEnd.textColor = [UIColor blackColor];
	[actionSheet dismissWithClickedButtonIndex:0 animated:TRUE];
	[self checkRequired];
	[self ViewToDown];
	[self saveTradeshow];
}


-(void) DatePickerDoneClick{
	NSLog(@"datapicker done");
	dateBegin.text= [showDateFormatter stringFromDate:[datePickerView date] ];
	[actionSheet dismissWithClickedButtonIndex:0 animated:TRUE];
	[self checkRequired];
	[self ViewToDown];
}

-(void)DatePickerCancelClick{
	[actionSheet dismissWithClickedButtonIndex:0 animated:TRUE];
	[self ViewToDown];
}

- (void)beginDatePickerChanged:(id)sender{ 
	UIDatePicker *datePicker = sender; 
	
	if(datePickerView == datePicker){
		dateEnd.textColor = [UIColor blackColor];
		dateBegin.text= [showDateFormatter stringFromDate:[datePickerView date] ];
		[self saveDataToPlist];
	}
}

- (void)endDatePickerChanged:(id)sender{ 
	UIDatePicker *datePicker = sender; 
	if(datePickerView == datePicker){
		dateEnd.textColor = [UIColor blackColor];
		dateEnd.text= [showDateFormatter stringFromDate:[datePickerView date] ];
		[self saveDataToPlist];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	self.datePickerView = nil;
	self.dateFormatter=nil;
	self.menuArray = nil;
	self.datePickerView = nil;
	self.dateBegin = nil;
	self.dateEnd = nil;
	self.tradShowDao = nil;
}


- (void)dealloc {	
	[dateBegin release];
	[dateEnd release];
	[datePickerView release];
	[textFieldNormal release];
	[addressText release];
	[menuArray release];
    [super dealloc];
}

@end
