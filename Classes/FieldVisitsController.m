
#import "FieldVisitsController.h"



@implementation FieldVisitsController

@synthesize fieldArray;
@synthesize fieldView;
@synthesize orderBy;
@synthesize fieldDao;
@synthesize sortIndex;
@synthesize dateFormatter;

-(IBAction)addFieldClicked:(id)sender{
	/*
	 AddNewCompany *newCom=[[AddNewCompany alloc] 
	 initWithNibName:@"AddNewCompany"
	 bundle:nil];
	 */
	EditField *newfield=[[EditField alloc] initWithNibName:@"EditField" bundle:nil];
	
	
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Field Visits";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
	
	newfield.title=@"New Field";
	newfield.edit = FALSE;
	newfield.status = 0;
	[[self navigationController] pushViewController:newfield animated:YES];
	
}



- (void) viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
	[self refreshFieldView];
}

-(void)refreshFieldView{
	self.fieldArray = [NSMutableArray array];
	fieldDao = [[FieldDao alloc] init];
	self.fieldArray = [fieldDao select:self.sortIndex];	
	[fieldView reloadData];
	
}

- (void)viewDidLoad {
	self.sortIndex=0;
	[super viewDidLoad];
	
	self.fieldView.backgroundColor=[Constants backgroundColor];	
	self.fieldView.separatorColor = [Constants tableLineColor];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self.fieldArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"";
}

#pragma mark Section header delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 58.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (aCell == nil)
	{
		aCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		aCell.tag = 5;
	}else {
		UIView *viewToRemove1 = nil;
		viewToRemove1 = [aCell.contentView viewWithTag:100+(aCell.tag)*10+indexPath.row];
		if (viewToRemove1)
			[viewToRemove1 removeFromSuperview];
		UIView *viewToRemove2 = nil;
		viewToRemove2 = [aCell.contentView viewWithTag:200+(aCell.tag)*10+indexPath.row];
		if (viewToRemove2)
			[viewToRemove2 removeFromSuperview];
		UIView *viewToRemove3 = nil;
		viewToRemove3 = [aCell.contentView viewWithTag:300+(aCell.tag)*10+indexPath.row];
		if (viewToRemove3)
			[viewToRemove3 removeFromSuperview];
	}
	aCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	Field *c = [fieldArray objectAtIndex:indexPath.section];
	CGRect nameFrame = CGRectMake(20.0, 2.0, 260.0, 30.0);
	UILabel *nameLabel = [[[UILabel alloc] initWithFrame:nameFrame] autorelease];
	nameLabel.backgroundColor = [Constants backgroundColor];
	nameLabel.textColor = [UIColor blackColor];
	nameLabel.textAlignment = UITextAlignmentLeft;
	nameLabel.font = [UIFont boldSystemFontOfSize:14.0];
	nameLabel.tag = 100+(aCell.tag)*10+indexPath.row;
	nameLabel.text = c.name;
	[aCell.contentView addSubview:nameLabel];
	
	CGRect numFrame = CGRectMake(20.0, 30.0, 120.0, 20.0);
	UILabel *numLabel = [[[UILabel alloc] initWithFrame:numFrame] autorelease];
	numLabel.backgroundColor = [Constants backgroundColor];		
	numLabel.textColor = [Constants labelTextColor];
	numLabel.textAlignment = UITextAlignmentLeft;
	numLabel.font = [UIFont systemFontOfSize:12.0];
	numLabel.tag = 200+(aCell.tag)*10+indexPath.row;
	numLabel.text = [NSString stringWithFormat:@"%@%d",@"Importance:",[c getImportance]];
	[aCell.contentView addSubview:numLabel];
	
	CGRect impFrame = CGRectMake(140.0, 30.0, 140.0, 20.0);
	UILabel *impLabel = [[[UILabel alloc] initWithFrame:impFrame] autorelease];
	impLabel.backgroundColor = [Constants backgroundColor];
	impLabel.textColor = [Constants labelTextColor];
	impLabel.textAlignment = UITextAlignmentRight;
	impLabel.font = [UIFont systemFontOfSize:12.0];
	impLabel.tag = 300+(aCell.tag)*10+indexPath.row;
	impLabel.text = [self converStrToShowTimeFomart:c.time];
	
//	NSDateFormatter *dbDateFormatter=[[NSDateFormatter alloc] init];
//	[dbDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
//	NSDateFormatter *showDateFormatter=[[NSDateFormatter alloc] init];
//	[showDateFormatter setDateFormat:@"MMM dd yyyy"];
//	if ([c.time length]>0) {
//		NSDate *time = [dbDateFormatter dateFromString:c.time];
//		impLabel.text = [NSString stringWithFormat:@"%@", [showDateFormatter stringFromDate:time]];
////		[time release];
//	}else {
//		impLabel.text = @"";
//	}
	[aCell.contentView addSubview:impLabel];
//	[dbDateFormatter release];
//	[showDateFormatter release];
	
	//aCell.text = [[companiesArray objectAtIndex:indexPath.section] valueForKey:kCPnameKey];
	return aCell;
}

//selectRowAtIndexPath didSelectRowAtIndexPath
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	Field *c = [fieldArray objectAtIndex:indexPath.section];
    
	EditField *detailViewController = [[EditField alloc] initWithNibName:@"EditField" bundle:nil];
	detailViewController.edit=TRUE; 
	detailViewController.status = 1;
	[detailViewController setIndex:[c getIndex]];
	[self.navigationController pushViewController:detailViewController animated:YES];
	
}

- (IBAction)fieldOnSort:(id)sender{
	
	UISegmentedControl *sg = sender;
	self.sortIndex = sg.selectedSegmentIndex;
	
	[self refreshFieldView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	fieldArray = nil;
	[fieldView release];
}


- (void)dealloc {
    [super dealloc];
}


@end
