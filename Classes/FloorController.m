#import "FloorController.h"
#import "AddNewCompany.h"
#import "EditCompany.h"
#import "SectionHeaderView.h"
#import "Company.h"
#import "CompanyDao.h"

#import "DoneCompany.h"

#import "Constants.h"

@implementation FloorController

@synthesize companiesArray;
@synthesize companyView;
@synthesize orderBy;
@synthesize companyDao;
@synthesize sortIndex;


/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

-(IBAction)addCompanyClicked:(id)sender{
	/*
	 AddNewCompany *newCom=[[AddNewCompany alloc] 
	 initWithNibName:@"AddNewCompany"
	 bundle:nil];
	 */
	EditCompany *newCom=[[EditCompany alloc] initWithNibName:@"EditCompany" bundle:nil];
	
	
	 UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	 temporaryBarButtonItem.title = @"Floor";
	 self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	 [temporaryBarButtonItem release];
	 
	 newCom.title=@"New Company";
	 newCom.edit = FALSE;
	 newCom.status = 0;
	 [[self navigationController] pushViewController:newCom animated:YES];
	 
}



- (void) viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
	[self refreshCompanyView];
}

-(void)refreshCompanyView{
	self.companiesArray = [NSMutableArray array];
	companyDao = [[CompanyDao alloc] init];
	self.companiesArray = [companyDao select:self.sortIndex];	
	[companyView reloadData];
	
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.companyView.backgroundColor=[Constants backgroundColor];	
	self.companyView.separatorColor = [Constants tableLineColor];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self.companiesArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"";
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
		aCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
	Company *c = [companiesArray objectAtIndex:indexPath.section];
	CGRect nameFrame = CGRectMake(20.0, 2.0, 260.0, 30.0);
	UILabel *nameLabel = [[[UILabel alloc] initWithFrame:nameFrame] autorelease];
	nameLabel.backgroundColor = [Constants backgroundColor];
	nameLabel.textColor = [UIColor blackColor];
	nameLabel.textAlignment = UITextAlignmentLeft;
	nameLabel.font = [UIFont boldSystemFontOfSize:18.0];
	nameLabel.tag = 100+(aCell.tag)*10+indexPath.row;
	nameLabel.text = c.name;
	[aCell.contentView addSubview:nameLabel];
	
	CGRect numFrame = CGRectMake(20.0, 30.0, 150.0, 20.0);
	UILabel *numLabel = [[[UILabel alloc] initWithFrame:numFrame] autorelease];
	numLabel.backgroundColor = [Constants backgroundColor];		
	numLabel.textColor = [Constants labelTextColor];
	numLabel.textAlignment = UITextAlignmentLeft;
	numLabel.font = [UIFont systemFontOfSize:12.0];
	numLabel.tag = 200+(aCell.tag)*10+indexPath.row;
	if ([c.booth length]>0) {
		numLabel.text = [NSString stringWithFormat:@"%@%@", @"Booth Number:", c.booth];
	}else {
		numLabel.text = @"";
	}
	[aCell.contentView addSubview:numLabel];
	
	CGRect impFrame = CGRectMake(200.0, 30.0, 100.0, 20.0);
	UILabel *impLabel = [[[UILabel alloc] initWithFrame:impFrame] autorelease];
	impLabel.backgroundColor = [Constants backgroundColor];
	impLabel.textColor = [Constants labelTextColor];
	impLabel.textAlignment = UITextAlignmentLeft;
	impLabel.font = [UIFont systemFontOfSize:12.0];
	impLabel.tag = 300+(aCell.tag)*10+indexPath.row;
	impLabel.text = [NSString stringWithFormat:@"%@%d",@"Importance:",[c getImportance]];
	[aCell.contentView addSubview:impLabel];

	return aCell;
}

//selectRowAtIndexPath didSelectRowAtIndexPath
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	Company *c = [companiesArray objectAtIndex:indexPath.section];
    
	EditCompany *detailViewController = [[EditCompany alloc] initWithNibName:@"EditCompany" bundle:nil];
	detailViewController.edit=TRUE; 
	detailViewController.status = 1;
	[detailViewController setIndex:[c getIndex]];
//	DoneCompany *detailViewController = [[DoneCompany alloc] initWithNibName:@"DoneCompany" bundle:nil];
//	[detailViewController setIndex:[c getIndex]];	
	
//	detailViewController.comName=[[companiesArray objectAtIndex:indexPath.section] valueForKey:kCPnameKey];
//	detailViewController.boothNum=[[companiesArray objectAtIndex:indexPath.section] valueForKey:kCPBoothNumKey];
//	detailViewController.importance=[[companiesArray objectAtIndex:indexPath.section] valueForKey:kCPImportanceKey];
	// Pass the selected object to the new view controller.
	[self.navigationController pushViewController:detailViewController animated:YES];
	//[detailViewController release]; //if release here, only can click once????
	 
}

- (IBAction)compOnSort:(id)sender{
	
	UISegmentedControl *sg = sender;
//	NSLog(@"%d" ,sg.selectedSegmentIndex);
	self.sortIndex = sg.selectedSegmentIndex;
	
	[self refreshCompanyView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[companyDao release];
    [super viewDidUnload];
	self.companiesArray = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end
