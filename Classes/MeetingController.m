//
//  MeetingsController.m
//  TradeShowInfo
//
//  Created by Elon on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MeetingController.h"
#import "EditMeeting.h"
#import "Constants.h"

@implementation MeetingController
@synthesize meetingsArray;
@synthesize meetingView;
@synthesize orderBy;
@synthesize sortIndex;

- (IBAction)meetingOnSort:(id) sender{
	UISegmentedControl *sg = sender;
	self.sortIndex = sg.selectedSegmentIndex;
	
	[self refreshMeetingView];
}

- (IBAction)addMeetingClicked:(id) sender{
	EditMeeting *newMeeting = [[EditMeeting alloc] initWithNibName:@"EditMeeting" bundle:nil];
	
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Meetings";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
	
	newMeeting.title=@"New Meeting";
	newMeeting.edit = FALSE;
	newMeeting.status = 0;
	[[self navigationController] pushViewController:newMeeting animated:YES];
}

- (void) refreshMeetingView{
	self.meetingsArray = [NSMutableArray array];
	meetingDao = [[MeetingDao alloc] init];
	self.meetingsArray = [meetingDao select:self.sortIndex];	
	[meetingView reloadData];
}

- (void) viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
	[self refreshMeetingView];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.sortIndex = 1;
	
	self.meetingView.backgroundColor = [Constants backgroundColor];
	self.meetingView.separatorColor = [Constants tableLineColor];
}

#pragma mark Section header delegate
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
	
	NSLog(@"open");
}


-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
    
    NSLog(@"closed");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
		return [self.meetingsArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *) tableView{
		return 1;
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"MeetingCell";
	UITableViewCell *meetingCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (meetingCell == nil)
	{
		meetingCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
	}else {
		UIView *viewToRemove1 = nil;
		viewToRemove1 = [meetingCell.contentView viewWithTag:1];
		if (viewToRemove1)
			[viewToRemove1 removeFromSuperview];
		UIView *viewToRemove2 = nil;
		viewToRemove2 = [meetingCell.contentView viewWithTag:2];
		if (viewToRemove2)
			[viewToRemove2 removeFromSuperview];
		UIView *viewToRemove3 = nil;
		viewToRemove3 = [meetingCell.contentView viewWithTag:3];
		if (viewToRemove3)
			[viewToRemove3 removeFromSuperview];
		UIView *viewToRemove4 = nil;
		viewToRemove4 = [meetingCell.contentView viewWithTag:4];
		if (viewToRemove4)
			[viewToRemove4 removeFromSuperview];
	}
	meetingCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	Meeting *m = [meetingsArray objectAtIndex:indexPath.row];
	
	CGRect titleFrame = CGRectMake(20.0, 2.0, 260.0, 30.0);
	UILabel *titleLabel = [[[UILabel alloc] initWithFrame:titleFrame] autorelease];
	titleLabel.backgroundColor = [Constants backgroundColor];
	titleLabel.textColor = [UIColor blackColor];
	titleLabel.textAlignment = UITextAlignmentLeft;
	titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
	titleLabel.tag = 1;
	titleLabel.text = m.title;
	[meetingCell.contentView addSubview:titleLabel];
	
	CGRect datetimeFrame = CGRectMake(20.0, 30.0, 140.0, 20.0);
	UILabel *dateTimeLabel = [[[UILabel alloc] initWithFrame:datetimeFrame] autorelease];
	dateTimeLabel.backgroundColor = [Constants backgroundColor];
	dateTimeLabel.textColor = [Constants labelTextColor];
	dateTimeLabel.textAlignment = UITextAlignmentLeft;
	dateTimeLabel.font = [UIFont systemFontOfSize:12.0];
	dateTimeLabel.tag = 2;
	dateTimeLabel.text = [self converStrToShowTimeFomart:m.time];
	[meetingCell.contentView addSubview:dateTimeLabel];
	
	CGRect locationFrame = CGRectMake(20.0, 50.0, 140.0, 20.0);
	UILabel *locationLabel = [[[UILabel alloc] initWithFrame:locationFrame] autorelease];
	locationLabel.backgroundColor = [Constants backgroundColor];
	locationLabel.textColor = [Constants labelTextColor];
	locationLabel.textAlignment = UITextAlignmentLeft;
	locationLabel.font = [UIFont systemFontOfSize:12.0];
	locationLabel.tag = 3;
	locationLabel.text = [NSString stringWithFormat:@"%@%@", @"Location:", m.location];
	[meetingCell.contentView addSubview:locationLabel];
	
	CGRect importanceFrame = CGRectMake(180.0, 50.0, 100.0, 20.0);
	UILabel *importanceLabel = [[[UILabel alloc] initWithFrame:importanceFrame] autorelease];
	importanceLabel.backgroundColor = [Constants backgroundColor];
	importanceLabel.textColor = [Constants labelTextColor];
	importanceLabel.textAlignment = UITextAlignmentLeft;
	importanceLabel.font = [UIFont systemFontOfSize:12.0];
	importanceLabel.tag = 4;
	importanceLabel.text = [NSString stringWithFormat:@"%@%d", @"Importance:", [m getImportance]];
	[meetingCell.contentView addSubview:importanceLabel];	
	
	return meetingCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath{
	return 72.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath{
	Meeting *metting = [meetingsArray objectAtIndex:indexPath.row];
	
	EditMeeting *detailViewController = [[EditMeeting alloc] initWithNibName:@"EditMeeting" bundle:nil];
	detailViewController.title = @"Strategic Meetings";
	detailViewController.edit = TRUE;
	detailViewController.status = 1;
	[detailViewController setIndex:[metting getIndex]];
	[self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	[meetingDao release];
	self.meetingsArray = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
