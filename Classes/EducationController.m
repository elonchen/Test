//
//  EducationController.m
//  TradeShowInfo
//
//  Created by Elon on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EducationController.h"
#import "Constants.h"
#import "EducationDao.h"
#import "EditEducation.h"

@implementation EducationController
@synthesize educationsArray;
@synthesize educationView;
@synthesize orderBy;
@synthesize sortIndex;

- (IBAction)educationOnSort:(id) sender{
	UISegmentedControl *sg = sender;
	self.sortIndex = sg.selectedSegmentIndex;
	
	[self refreshEducationView];
}

- (IBAction)addEducationClicked:(id) sender{
	EditEducation *newEducation = [[EditEducation alloc] initWithNibName:@"EditEducation" bundle:nil];

	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Education";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
	
	newEducation.title=@"New Education";
	newEducation.edit = FALSE;
	newEducation.status = 0;
	[[self navigationController] pushViewController:newEducation animated:YES];
}

- (void) refreshEducationView{
	self.educationsArray = [NSMutableArray array];
	educationDao = [[EducationDao alloc] init];
	self.educationsArray = [educationDao select:self.sortIndex];	
	[educationView reloadData];
}

- (void) viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
	[self refreshEducationView];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	self.sortIndex = 1;
	
	self.educationView.backgroundColor = [Constants backgroundColor];
	self.educationView.separatorColor = [Constants tableLineColor];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.educationsArray count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *) tableView{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"SeminarCell";
	UITableViewCell *educationCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (educationCell == nil)
	{
		educationCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
	}else {
		UIView *viewToRemove1 = nil;
		viewToRemove1 = [educationCell.contentView viewWithTag:1];
		if (viewToRemove1)
			[viewToRemove1 removeFromSuperview];
		UIView *viewToRemove2 = nil;
		viewToRemove2 = [educationCell.contentView viewWithTag:2];
		if (viewToRemove2)
			[viewToRemove2 removeFromSuperview];
		UIView *viewToRemove3 = nil;
		viewToRemove3 = [educationCell.contentView viewWithTag:3];
		if (viewToRemove3)
			[viewToRemove3 removeFromSuperview];
		UIView *viewToRemove4 = nil;
		viewToRemove4 = [educationCell.contentView viewWithTag:4];
		if (viewToRemove4)
			[viewToRemove4 removeFromSuperview];
	}
	
	educationCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

		
		Education *s = [educationsArray objectAtIndex:indexPath.row];
		
		CGRect titleFrame = CGRectMake(20.0, 2.0, 260.0, 30.0);
		UILabel *titleLabel = [[[UILabel alloc] initWithFrame:titleFrame] autorelease];
		titleLabel.backgroundColor = [UIColor clearColor];
		titleLabel.textColor = [UIColor blackColor];
		titleLabel.textAlignment = UITextAlignmentLeft;
		titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
		titleLabel.tag = 1;
		titleLabel.text = s.title;
		[educationCell.contentView addSubview:titleLabel];
		
		CGRect datetimeFrame = CGRectMake(20.0, 30.0, 140.0, 20.0);
		UILabel *dateTimeLabel = [[[UILabel alloc] initWithFrame:datetimeFrame] autorelease];
		dateTimeLabel.backgroundColor = [UIColor clearColor];
		dateTimeLabel.textColor = [Constants labelTextColor];
		dateTimeLabel.textAlignment = UITextAlignmentLeft;
		dateTimeLabel.font = [UIFont systemFontOfSize:12.0];
		dateTimeLabel.tag = 2;
		dateTimeLabel.text = [self converStrToShowTimeFomart:s.time];
		[educationCell.contentView addSubview:dateTimeLabel];
		
		CGRect locationFrame = CGRectMake(20.0, 50.0, 140.0, 20.0);
		UILabel *locationLabel = [[[UILabel alloc] initWithFrame:locationFrame] autorelease];
		locationLabel.backgroundColor = [UIColor clearColor];
		locationLabel.textColor = [Constants labelTextColor];
		locationLabel.textAlignment = UITextAlignmentLeft;
		locationLabel.font = [UIFont systemFontOfSize:12.0];
		locationLabel.tag = 3;
		locationLabel.text = [NSString stringWithFormat:@"%@%@", @"Location:", s.location];
		[educationCell.contentView addSubview:locationLabel];
		
		CGRect importanceFrame = CGRectMake(180.0, 50.0, 100.0, 20.0);
		UILabel *importanceLabel = [[[UILabel alloc] initWithFrame:importanceFrame] autorelease];
		importanceLabel.backgroundColor = [UIColor clearColor];
		importanceLabel.textColor = [Constants labelTextColor];
		importanceLabel.textAlignment = UITextAlignmentLeft;
		importanceLabel.font = [UIFont systemFontOfSize:12.0];
		importanceLabel.tag = 4;
		importanceLabel.text = [NSString stringWithFormat:@"%@%d", @"Importance:", [s getImportance]];
		[educationCell.contentView addSubview:importanceLabel];
	
	return educationCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 72.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath{
	Education *education = [educationsArray objectAtIndex:indexPath.row];
	
	EditEducation *detailViewController = [[EditEducation alloc] initWithNibName:@"EditEducation" bundle:nil];
	detailViewController.title = @"Your Seminars/Workshops";
	detailViewController.edit = TRUE;
	detailViewController.status = 1;
	[detailViewController setIndex:[education getIndex]];
	[self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	[educationDao release];
	self.educationsArray = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
