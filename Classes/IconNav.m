//
//  IconNav.m
//  Navigation
//
//  Created by Bright Creek on 2/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "Constants.h"
#import "IconNav.h"
#import "AddNewCompany.h"
#import "EditPlanning.h"
#import "FloorController.h"
#import "CalendarController.h"
#import "EducationController.h"
#import "TodoController.h"
#import	"FieldVisitsController.h"
#import "MeetingController.h"
#import "EditSetting.h"
#import "copyrightController.h"
#import "HintsDao.h"

@implementation IconNav
@synthesize infoView;

-(void)showNextNibAtIndex:(NSInteger)index{
	if (index ==1) {
//		PlanningController *floor=[[PlanningController alloc] 
//								initWithNibName:@"PlanningController"
//								bundle:nil];
//		
//		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
//		temporaryBarButtonItem.title = @"Home";
//		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
//		[temporaryBarButtonItem release];
//		
//		floor.title=@"Planning";
//		[[self navigationController] pushViewController:floor animated:YES];
		EditPlanning *floor=[[EditPlanning alloc] 
								   initWithNibName:@"EditPlanning"
								   bundle:nil];
		
		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title = @"Home";
		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
		[temporaryBarButtonItem release];
		
		floor.title=@"Planning";
		[[self navigationController] pushViewController:floor animated:YES];
		
		
	}else if (index ==2) {
		FloorController *floor=[[FloorController alloc] 
								initWithNibName:@"FloorController"
								bundle:nil];
		
		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title = @"Home";
		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
		[temporaryBarButtonItem release];
		
		floor.title=@"Floor";
		[[self navigationController] pushViewController:floor animated:YES];
		
	}else if (index ==3) {
		CalendarController *canlendar=[[CalendarController alloc] 
									   initWithNibName:@"CalendarController"
									   bundle:nil];
		
		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title = @"Home";
		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
		[temporaryBarButtonItem release];
		
		canlendar.title=@"Calendar";
		[[self navigationController] pushViewController:canlendar animated:YES];
	}else if (index == 4) {
		EducationController *education=[[EducationController alloc] 
										initWithNibName:@"EducationController"
										bundle:nil];
		
		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title = @"Home";
		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
		[temporaryBarButtonItem release];
		
		education.title=@"Education";
		[[self navigationController] pushViewController:education animated:YES];
	}else if (index == 5) {
		MeetingController *meetings=[[MeetingController alloc] 
									 initWithNibName:@"MeetingController"
									 bundle:nil];
		
		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title = @"Home";
		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
		[temporaryBarButtonItem release];
		
		meetings.title=@"Meetings";
		[[self navigationController] pushViewController:meetings animated:YES];
	}
	else if (index ==6) {
		FieldVisitsController *canlendar=[[FieldVisitsController alloc] 
										  initWithNibName:@"FieldVisitsController"
										  bundle:nil];
		
		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title = @"Home";
		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
		[temporaryBarButtonItem release];
		
		canlendar.title=@"Field Visits";
		[[self navigationController] pushViewController:canlendar animated:YES];
	}else if (index ==7) {
		TodoController *todo=[[TodoController alloc] 
							  initWithNibName:@"TodoController"
							  bundle:nil];
		
		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title = @"Home";
		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
		[temporaryBarButtonItem release];
		
		todo.title=@"To Do";
		[[self navigationController] pushViewController:todo animated:YES];
	}
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
	if (buttonIndex == 0){
		HintsDao *h = [[HintsDao alloc] init];
		[h closeHintAtIndex:iconIndex];
		[h release];
	}else if (buttonIndex == 1){
		NSLog(@"show again");
	}
	
	[self showNextNibAtIndex:iconIndex];
	
}	
	
//}

- (void)showActionSheet:(NSString *)imageName Title:(NSString *)hTitle Content:(NSString *)content{
	
	NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ;
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:@"Close Hint" destructiveButtonTitle:nil otherButtonTitles:@"Don't Show Again", nil];
	
	UIImageView* imageView  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName] ];
	imageView.frame = CGRectMake(5, 5, 100, 100);
	
	UITextView *titleTextView = [[[UITextView alloc] initWithFrame:CGRectMake(110, 35, 150, 150)] autorelease];
    titleTextView.textColor = [UIColor whiteColor];
    titleTextView.font = [UIFont fontWithName:@"Helvetica-Bold" size:23];
	titleTextView.backgroundColor = [UIColor clearColor]; 
    titleTextView.text = hTitle;
	titleTextView.editable = FALSE;
	
	UITextView *contentTextView = [[[UITextView alloc] initWithFrame:CGRectMake(10, 110, 300, 200)] autorelease];
    contentTextView.textColor = [UIColor whiteColor];
    contentTextView.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.8];
	contentTextView.backgroundColor = [UIColor clearColor];
    contentTextView.text = content;
	
	contentTextView.editable = FALSE;
	
	[actionSheet showInView:self.view];
	[actionSheet addSubview:imageView];
	[actionSheet addSubview:titleTextView];
	[actionSheet addSubview:contentTextView];
	
}

-(IBAction)planningClicked:(id)sender{	
	iconIndex = 1;
	HintsDao *h = [[HintsDao alloc]init];
	
	if ([h selectHintStatus:iconIndex]) {
		[self showActionSheet:@"Planning-Icon.png" Title:@"Planning" 
					  Content:@"Take a little time to plan out everything you would like to accomplish at the trade show."];
	}else {
		[self showNextNibAtIndex:iconIndex];
	}
	[h release];
}

-(IBAction)floorClicked:(id)sender{	
	iconIndex = 2;
	HintsDao *h = [[HintsDao alloc]init];
	
	if ([h selectHintStatus:iconIndex]) {
		[self showActionSheet:@"Floor-Icon.png" Title:@"Floor" 
				  Content:@"Walking the Convention Floor\n\nUse this area to generate \"To Do\" items and to enter contact information. This area is also your BOOTH LIST for all the companies you have entered.\n\nUse your camera to take photos that compliment your \"To Do's\"."];
	}else {
		[self showNextNibAtIndex:iconIndex];
	}
	[h release];
}
-(IBAction)calendarClicked:(id)sender{
	iconIndex = 3;
	HintsDao *h = [[HintsDao alloc] init];
	if ([h selectHintStatus:iconIndex]) {
		[self showActionSheet:@"Calandar-Icon.png" Title:@"Calendar" 
				  Content:@"Review existing appointments or enter new ones."];
	}else {
		[self showNextNibAtIndex:iconIndex];
	}
	[h release];
}
-(IBAction)todoClicked:(id)sender{
	iconIndex = 7;
	HintsDao *h = [[HintsDao alloc] init];
	if ([h selectHintStatus:iconIndex]) {
		[self showActionSheet:@"To-do-Icon.png" Title:@"To Do" 
				  Content:@"When you are finished at the convention, you can email ALL YOUR TO DO ITEMS to yourself, or you can email individual \"To Do\" items to a colleague. \n To email an individual \"To Do\" item, tap it once and then email it."];

	}else {
		[self showNextNibAtIndex:iconIndex];
	}
	[h release];
}
-(IBAction)fieldVisitsClicked:(id)sender{
	iconIndex = 6;
	HintsDao *h = [[HintsDao alloc] init];
	if ([h selectHintStatus:iconIndex]) {
		[self showActionSheet:@"Field-Visits-Icon.png" Title:@"Field Visits" 
				  Content:@"Remember that you can add \"To Do\" Items from each of your field visits.\nCapture your ideas from the companies you visit.\nDon't forget to tag your \"To do\" Items with a photo."];
	}else {
		[self showNextNibAtIndex:iconIndex];
	}
	[h release];
}

-(IBAction) educationClicked:(id)sender{
	iconIndex = 4;
	HintsDao *h = [[HintsDao alloc] init];
	if ([h selectHintStatus:iconIndex]) {
		[self showActionSheet:@"Education-Icon.png" Title:@"Education" 
				  Content:@"Here are your workshops and seminars. Remember that you can enter NOTES and \"To Do\" items during the workshops. Use your camera to take photos of slides if necessary. \n Add new seminars as needed."];
	}else {
		[self showNextNibAtIndex:iconIndex];
	}
	[h release];
}

-(IBAction) meetingsClicked:(id)sender{
	iconIndex = 5;
	HintsDao *h = [[HintsDao alloc] init];
	if ([h selectHintStatus:iconIndex]) {
		[self showActionSheet:@"Meeting-Icon.png" Title:@"Meetings" 
				  Content:@"Remember that you can add \"To Do\" items and \"Notes\" during your meetings. You may also add \"Attendees\" and add new meeting as necessary."];
	}else {
		[self showNextNibAtIndex:iconIndex];
	}
	[h release];
}

-(IBAction) settingClicked:(id)sender{
	EditSetting *newSetting = [[EditSetting alloc] initWithNibName:@"EditSetting" bundle:nil];
	
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
	
	newSetting.title = @"Settings";
	
	[[self navigationController] pushViewController:newSetting animated:YES];
}

-(IBAction)showCopyright:(id)sender{
	copyrightController *copyright=[[copyrightController alloc] 
							initWithNibName:@"copyrightController"
							bundle:nil];
	
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
	
	copyright.title=@"Copyright";
	[[self navigationController] pushViewController:copyright animated:YES];
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor=[Constants backgroundColor];	
}

-(IBAction)floorButtonPressed:(id)sender{
	//self.infoView.hidden = FALSE;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
	//[infoView release];
}

//-(void)showInfoView:(NSString title,NSString detail,UIImage image){
//	CGRect titleFrame = CGRectMake(20.0, 30.0, 120.0, 20.0);
//	UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleFrame];
//	titleLabel
//}


@end
