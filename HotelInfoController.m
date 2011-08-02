//
//  HotelInfoController.m
//  TradeShowInfo
//
//  Created by Bright Creek on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HotelInfoController.h"


static NSString *kViewKey = @"kViewKey";
static NSString *kTitleKey = @"kTitleKey";
static NSString *defaultKey = @"defaultKey";
static NSString *kSectionTitleKey = @"kSectionTitleKey";

@implementation HotelInfoController

@synthesize menuArray;
@synthesize hotelName,hotelAddress,hotelMobile,hotelNotes,hotelHomePage;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.menuArray = [NSMutableArray array];
	[self.menuArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
							   @"Hotel Name", kTitleKey,
							   @"Requered", defaultKey,
							   @"",kSectionTitleKey,
							   self.hotelName, kViewKey,
							   nil]];
	[self.menuArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
							   @"Address", kTitleKey,
							   @"Requered", defaultKey,
							   @"",kSectionTitleKey,
							   self.hotelName, kViewKey,
							   nil]];
	[self.menuArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
							   @"mobile", kTitleKey,
							   @"Requered", defaultKey,
							   @"",kSectionTitleKey,
							   self.hotelName, kViewKey,
							   nil]];
	[self.menuArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
							   @"notes", kTitleKey,
							   @"Requered", defaultKey,
							   @"",kSectionTitleKey,
							   self.hotelName, kViewKey,
							   nil]];
	[self.menuArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
							   @"home page", kTitleKey,
							   @"Requered", defaultKey,
							   @"",kSectionTitleKey,
							   self.hotelName, kViewKey,
							   nil]];
	//[dateTitle release];
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
	return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return ([indexPath section] == 0) ? 90.0 : 50.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (aCell == nil)
	{
		aCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	CGRect frame = CGRectMake(2.0, 10.0, 100.0, 30.0);
	UILabel *lname = [[UILabel alloc] initWithFrame:frame];
	lname.text = [[menuArray objectAtIndex:indexPath.section] valueForKey:@"kTitleKey"];
	lname.textColor = [UIColor blackColor];
	lname.textAlignment = UITextAlignmentRight;
	lname.font = [UIFont systemFontOfSize:14.0];
	[aCell.contentView addSubview:lname];
	[lname release];

	UITextField *textField = [[self.menuArray objectAtIndex: indexPath.section] valueForKey:kViewKey];
	[aCell.contentView addSubview:textField];
	[textField release];
	
	return aCell;
}
- (UITextField *)hotelName
{
	if (hotelName == nil)
	{
		CGRect frame = CGRectMake(12.0, 50.0, 250.0, 30.0);
		hotelName = [[UITextField alloc] initWithFrame:frame];
		
		hotelName.borderStyle = UITextBorderStyleNone;
		hotelName.placeholder = @"Hotel";
		hotelName.backgroundColor = [UIColor whiteColor];
		hotelName.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		
		hotelName.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
		hotelName.returnKeyType = UIReturnKeyDone;
		
		hotelName.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
		
		hotelName.tag = 1;		// tag this control so we can remove it later for recycled cells
		
		hotelName.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed

		[hotelName setAccessibilityLabel:NSLocalizedString(@"hotelName", @"")];
	}	
	return hotelName;
}
- (UITextField *)hotelAddress
{
	if (hotelAddress == nil)
	{
		CGRect frame = CGRectMake(110.0, 10.0, 180.0, 30.0);
		hotelAddress = [[UITextField alloc] initWithFrame:frame];
		
		hotelAddress.borderStyle = UITextBorderStyleNone;
		hotelAddress.placeholder = @"";
		hotelAddress.backgroundColor = [UIColor whiteColor];
		hotelAddress.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		
		hotelAddress.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
		hotelAddress.returnKeyType = UIReturnKeyDone;
		
		hotelAddress.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
		
		hotelAddress.tag = 1;		// tag this control so we can remove it later for recycled cells
		
		hotelAddress.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed
		
		[hotelAddress setAccessibilityLabel:NSLocalizedString(@"hotelAddress", @"")];
	}	
	return hotelAddress;
}
- (UITextField *)hotelMobile
{
	if (hotelMobile == nil)
	{
		CGRect frame = CGRectMake(110.0, 10.0, 180.0, 30.0);
		hotelMobile = [[UITextField alloc] initWithFrame:frame];
		
		hotelMobile.borderStyle = UITextBorderStyleNone;
		hotelMobile.placeholder = @"Phone";
		hotelMobile.backgroundColor = [UIColor whiteColor];
		hotelMobile.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		
		hotelMobile.keyboardType = UIKeyboardTypeNamePhonePad;	// use the default type input method (entire keyboard)
		hotelMobile.returnKeyType = UIReturnKeyDone;
		
		hotelMobile.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
		
		hotelMobile.tag = 1;		// tag this control so we can remove it later for recycled cells
		
		hotelMobile.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed
		
		[hotelMobile setAccessibilityLabel:NSLocalizedString(@"hotelMobile", @"")];
	}	
	return hotelMobile;
}
- (UITextField *)hotelNotes
{
	if (hotelNotes == nil)
	{
		CGRect frame = CGRectMake(110.0, 10.0, 180.0, 30.0);
		hotelNotes = [[UITextField alloc] initWithFrame:frame];
		
		hotelNotes.borderStyle = UITextBorderStyleNone;
		hotelNotes.placeholder = @"Notes";
		hotelNotes.backgroundColor = [UIColor whiteColor];
		hotelNotes.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		
		hotelNotes.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
		hotelNotes.returnKeyType = UIReturnKeyDone;
		
		hotelNotes.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
		
		hotelNotes.tag = 1;		// tag this control so we can remove it later for recycled cells
		
		hotelNotes.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed
		
		[hotelNotes setAccessibilityLabel:NSLocalizedString(@"hotelNotes", @"")];
	}	
	return hotelNotes;
}
- (UITextField *)hotelHomePage
{
	if (hotelHomePage == nil)
	{
		CGRect frame = CGRectMake(110.0, 10.0, 180.0, 30.0);
		hotelHomePage = [[UITextField alloc] initWithFrame:frame];
		
		hotelHomePage.borderStyle = UITextBorderStyleNone;
		hotelHomePage.placeholder = @"Hotel";
		hotelHomePage.backgroundColor = [UIColor whiteColor];
		hotelHomePage.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		
		hotelHomePage.keyboardType = UIKeyboardTypeEmailAddress;
		hotelHomePage.returnKeyType = UIReturnKeyDone;
		
		hotelHomePage.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
		
		hotelHomePage.tag = 1;		// tag this control so we can remove it later for recycled cells
		
		hotelHomePage.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed
		
		[hotelHomePage setAccessibilityLabel:NSLocalizedString(@"hotelHomePage", @"")];
	}	
	return hotelHomePage;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	self.menuArray = nil;
}


- (void)dealloc {	
	[hotelName release];
	[hotelAddress release];
	[hotelMobile release];
	[hotelNotes release];
	[hotelName release];
	[hotelHomePage release];
    [super dealloc];
}

@end
