#import "FloorController.h"

static NSString *kCPnameKey = @"kCPnameKey";
static NSString *kCPBoothNumKey = @"kCPBoothNumKey";
static NSString *kCPImportanceKey = @"kCPImportanceKey";

@implementation FloorController

@synthesize companiesArray;
@synthesize sortedArray;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
	self.companiesArray = [NSMutableArray array];
	[self.companiesArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
									@"BrightCreek Software", kCPnameKey,
									@"101", kCPBoothNumKey,
									@"3",kCPImportanceKey,
									nil]];
	[self.companiesArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
									@"Google", kCPnameKey,
									@"23", kCPBoothNumKey,
									@"4",kCPImportanceKey,
									nil]];
	[self.companiesArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
									@"aGoogle", kCPnameKey,
									@"", kCPBoothNumKey,
									@"4",kCPImportanceKey,
									nil]];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"";
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
		CGRect nameFrame = CGRectMake(20.0, 2.0, 260.0, 30.0);
		UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameFrame];
		nameLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:204.0/255.0 blue:102.0/255.0 alpha:1.0];
		nameLabel.text = [[companiesArray objectAtIndex:indexPath.section] valueForKey:kCPnameKey];
		nameLabel.textColor = [UIColor blackColor];
		nameLabel.textAlignment = UITextAlignmentLeft;
		nameLabel.font = [UIFont boldSystemFontOfSize:14.0];
		[aCell.contentView addSubview:nameLabel];
		[nameLabel release];
		if ([[companiesArray objectAtIndex:indexPath.section] valueForKey:kCPBoothNumKey]!=@"") {
			CGRect numFrame = CGRectMake(20.0, 30.0, 120.0, 20.0);
			UILabel *numLabel = [[UILabel alloc] initWithFrame:numFrame];
			numLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:204.0/255.0 blue:102.0/255.0 alpha:1.0];
			numLabel.text = [NSString stringWithFormat:@"%@%@", @"BoothNumber:", [[companiesArray objectAtIndex:indexPath.section] valueForKey:kCPBoothNumKey]];
			numLabel.textColor = [UIColor colorWithRed:209/255.0 green:83/255.0 blue:0/255.0 alpha:1.0];
			numLabel.textAlignment = UITextAlignmentLeft;
			numLabel.font = [UIFont systemFontOfSize:12.0];
			[aCell.contentView addSubview:numLabel];
			[numLabel release];
		}
		CGRect impFrame = CGRectMake(180.0, 30.0, 100.0, 20.0);
		UILabel *impLabel = [[UILabel alloc] initWithFrame:impFrame];
		impLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:204.0/255.0 blue:102.0/255.0 alpha:1.0];
		impLabel.text = [NSString stringWithFormat:@"%@%@", @"Importance:", [[companiesArray objectAtIndex:indexPath.section] valueForKey:kCPImportanceKey]];
		impLabel.textColor = [UIColor colorWithRed:209/255.0 green:83/255.0 blue:0/255.0 alpha:1.0];
		impLabel.textAlignment = UITextAlignmentRight;
		impLabel.font = [UIFont systemFontOfSize:12.0];
		[aCell.contentView addSubview:impLabel];
		[impLabel release];
	}	
	return aCell;
}


- (IBAction)compOnSort:(id)sender{

	NSLog(@"123");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.companiesArray = nil;
	self.sortedArray = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end
