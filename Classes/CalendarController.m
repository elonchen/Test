#import "CalendarController.h"
#import "EditCalendar.h"
#import "Constants.h"

@implementation CalendarController

@synthesize calendarArray;
@synthesize calendarView;
@synthesize orderBy;
@synthesize addBar;
@synthesize sortBar;
@synthesize dateFormatter;
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

-(IBAction)addCalendarClicked:(id)sender{
	
	EditCalendar *newCal=[[EditCalendar alloc] 
						   initWithNibName:@"EditCalendar"
						   bundle:nil];
	
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Calendar";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
	
	newCal.title=@"Event";
	newCal.edit = FALSE;
	newCal.status = 0;
	[[self navigationController] pushViewController:newCal animated:YES];
	
}


//- (NSString *)dataFilePath { 
//	NSArray *paths = NSSearchPathForDirectoriesInDomains(
//														 NSDocumentDirectory, NSUserDomainMask, YES); 
//	NSString *documentsDirectory = [paths objectAtIndex:0]; 
//	return [documentsDirectory stringByAppendingPathComponent:databaseFileName];
//}
//
//-(void)databaseInit{
//	if (sqlite3_open([[self dataFilePath] UTF8String], &database)
//        != SQLITE_OK) {
//        sqlite3_close(database);
//        NSAssert(0, @"Failed to open database");
//    }
//    
//    char *errorMsg;
//    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS company (row INTEGER PRIMARY KEY AUTOINCREMENT,\
//	company_name TEXT,\
//	company_importance TEXT,\
//	company_boothNumber TEXT,\
//	company_note TEXT,\
//	company_url TEXT);";
//    if (sqlite3_exec (database, [createSQL  UTF8String],
//                      NULL, NULL, &errorMsg) != SQLITE_OK) {
//        sqlite3_close(database);
//        NSAssert1(0, @"Error creating table: %s", errorMsg);
//    }
//}

- (void) viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
	if (self.sortIndex == 0) {
		[self getCalendarByDate];
	}else {
		[self getCalendarByImportance];
	}
	[self.calendarView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	self.calendarView.backgroundColor=[Constants backgroundColor];
	self.calendarArray = [NSMutableArray array];
	
	
	
	//[self getCalendarByDate];


	
	//[self convertCalendar:[calendarDao select]];
	//NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	/*NSArray *thingsArray;
	NSArray *timesArray;
	NSArray *importanceArray;
	
	thingsArray = [NSArray arrayWithObjects:@"Check in hotel",@"Phone hotel",nil];
	timesArray = [NSArray arrayWithObjects:@"11 PM",@"15 AM",nil];	
	importanceArray = [NSArray arrayWithObjects:@"2",@"4",nil];
	
	[self.calendarArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
										@"Thu",kDateKey,
										@"Mar 21 2001",kDayKey,
										thingsArray,kThingsKey,
										timesArray, kTimeKey,
										importanceArray,kImportanceKey,
										nil]];
	
	thingsArray = [NSArray arrayWithObjects:@"Visit Brightcreek",@"Meeting with staff",@"afsd",nil];
	timesArray = [NSArray arrayWithObjects:@"0 PM",@"6 AM",@"4 PM",nil];	
	importanceArray = [NSArray arrayWithObjects:@"5",@"3",@"8",nil];
	
	[self.calendarArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
								   @"Fri",kDateKey,
								   @"Mar 22 2011",kDayKey,
								   thingsArray,kThingsKey,
								   timesArray, kTimeKey,
								   importanceArray,kImportanceKey,
								   nil]];
	thingsArray = [NSArray arrayWithObjects:@"651566",@"45654",@"45645",nil];
	timesArray = [NSArray arrayWithObjects:@"21 PM",@"25 AM",@"35 PM",nil];	
	importanceArray = [NSArray arrayWithObjects:@"2",@"1",@"4",nil];
	[self.calendarArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
								   @"Sun",kDateKey,
								   @"Mar 24 2011",kDayKey,
								   thingsArray,kThingsKey,
								   timesArray, kTimeKey,
								   importanceArray,kImportanceKey,
								   nil]];*/
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	if (self.sortIndex == 0) {
		return [self.calendarArray count];
	}else {
		return 1;
	}

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//	static NSString *CellIdentifier = @"titleCell";
	if (self.sortIndex == 0){
		CGFloat	width = self.view.frame.size.width;
		UIView *tableHeader = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 25)] autorelease];
	
		tableHeader.tag=section;
		tableHeader.backgroundColor = [UIColor colorWithRed:208.0/255.0 green:141.0/255.0 blue:64.0/255.0 alpha:1.0];
		CGRect titleFrameLeft = CGRectMake(20.0, 2.0, 100.0, 20.0);
		UILabel *titleLabelleft = [[[UILabel alloc] initWithFrame:titleFrameLeft] autorelease];
		titleLabelleft.backgroundColor = [UIColor clearColor];
		titleLabelleft.textColor = [UIColor whiteColor];
		titleLabelleft.textAlignment = UITextAlignmentLeft;
		titleLabelleft.font = [UIFont boldSystemFontOfSize:16.0];
		titleLabelleft.tag = 100+(tableHeader.tag)*10;
		[tableHeader addSubview:titleLabelleft];
		CGRect titleFrameRight = CGRectMake(200.0, 2.0, 100.0, 20.0);
		UILabel *titleLabelRight = [[[UILabel alloc] initWithFrame:titleFrameRight] autorelease];
		titleLabelRight.backgroundColor = [UIColor clearColor];
		titleLabelRight.textColor = [UIColor whiteColor];
		titleLabelRight.textAlignment = UITextAlignmentRight;
		titleLabelRight.font = [UIFont boldSystemFontOfSize:14.0];
		titleLabelRight.tag = 100+(tableHeader.tag)*10+1;
		[tableHeader addSubview:titleLabelRight];
		NSMutableArray *subArray = [calendarArray objectAtIndex:section];
		Calendar *c = [subArray objectAtIndex:0];
		UILabel *leftLabel = (UILabel *)[tableHeader viewWithTag:(100+(tableHeader.tag)*10)];
		leftLabel.text = c.weekDay;
	
		UILabel *rightLabel = (UILabel *)[tableHeader viewWithTag:(100+(tableHeader.tag)*10+1)];
		rightLabel.text = c.day;
		return tableHeader;
	}else {
		return	nil;
	}

	
	
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 return 25;
}

#pragma mark Section header delegate



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (self.sortIndex == 0) {
		NSMutableArray *ay = [calendarArray objectAtIndex:section];
		return [ay count];
	}else {
		return [self.calendarArray count];
	}

	
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
		aCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
	}else {
		UIView *viewToRemove1 = nil;
		viewToRemove1 = [aCell.contentView viewWithTag:11];
		if (viewToRemove1)
			[viewToRemove1 removeFromSuperview];
		UIView *viewToRemove2 = nil;
		viewToRemove2 = [aCell.contentView viewWithTag:12];
		if (viewToRemove2)
			[viewToRemove2 removeFromSuperview];
		UIView *viewToRemove3 = nil;
		viewToRemove3 = [aCell.contentView viewWithTag:13];
		if (viewToRemove3)
			[viewToRemove3 removeFromSuperview];
		UIView *viewToRemove4 = nil;
		viewToRemove4 = [aCell.contentView viewWithTag:14];
		if (viewToRemove4)
			[viewToRemove4 removeFromSuperview];
	}
	if (self.sortIndex == 0) {
		Calendar *c = [[calendarArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
		CGRect titleFrame = CGRectMake(100.0, 2.0, 200.0, 30.0);
		UILabel *titleLabel = [[[UILabel alloc] initWithFrame:titleFrame] autorelease];
		titleLabel.backgroundColor = [UIColor clearColor];
		titleLabel.textColor = [UIColor blackColor];
		titleLabel.textAlignment = UITextAlignmentLeft;
		titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
		titleLabel.tag = 11;
		titleLabel.text = c.title;
		[aCell.contentView addSubview:titleLabel];
		
		CGRect impFrame = CGRectMake(100.0, 32.0, 100.0, 20.0);
		UILabel *impLabel = [[[UILabel alloc] initWithFrame:impFrame] autorelease];
		impLabel.backgroundColor = [UIColor clearColor];	
		impLabel.textColor = [Constants labelTextColor];
		impLabel.textAlignment = UITextAlignmentLeft;
		impLabel.font = [UIFont systemFontOfSize:12.0];
		impLabel.tag = 12;
		impLabel.text = [NSString stringWithFormat:@"%@%d", @"Importance:", [c getImportance]];
		[aCell.contentView addSubview:impLabel];
		
		CGRect timeFrame = CGRectMake(20.0, 18.0, 60.0, 20.0);
		UILabel *timeLabel = [[[UILabel alloc] initWithFrame:timeFrame] autorelease];
		timeLabel.backgroundColor = [UIColor clearColor];
		timeLabel.textColor =  [Constants labelTextColor];
		timeLabel.textAlignment = UITextAlignmentLeft;
		timeLabel.font = [UIFont systemFontOfSize:12.0];
		timeLabel.tag = 13;
		timeLabel.text = [NSString stringWithFormat:@"%@",c.time];
		[aCell.contentView addSubview:timeLabel];
	}else {
		Calendar *c = [calendarArray objectAtIndex:indexPath.row];
		CGRect titleFrame = CGRectMake(20.0, 2.0, 200.0, 30.0);
		UILabel *titleLabel = [[[UILabel alloc] initWithFrame:titleFrame] autorelease];
		titleLabel.backgroundColor = [UIColor clearColor];
		titleLabel.textColor = [UIColor blackColor];
		titleLabel.textAlignment = UITextAlignmentLeft;
		titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
		titleLabel.tag = 11;
		titleLabel.text = c.title;
		[aCell.contentView addSubview:titleLabel];
		
		CGRect impFrame = CGRectMake(200.0, 32.0, 100.0, 20.0);
		UILabel *impLabel = [[[UILabel alloc] initWithFrame:impFrame] autorelease];
		impLabel.backgroundColor = [UIColor clearColor];	
		impLabel.textColor = [Constants labelTextColor];
		impLabel.textAlignment = UITextAlignmentLeft;
		impLabel.font = [UIFont systemFontOfSize:12.0];
		impLabel.tag = 12;
		impLabel.text = [NSString stringWithFormat:@"%@%d", @"Importance:", [c getImportance]];
		[aCell.contentView addSubview:impLabel];
		
		CGRect timeFrame = CGRectMake(100.0, 32.0, 60.0, 20.0);
		UILabel *timeLabel = [[[UILabel alloc] initWithFrame:timeFrame] autorelease];
		timeLabel.backgroundColor = [UIColor clearColor];
		timeLabel.textColor =  [Constants labelTextColor];
		timeLabel.textAlignment = UITextAlignmentLeft;
		timeLabel.font = [UIFont systemFontOfSize:12.0];
		timeLabel.tag = 13;
		timeLabel.text = [NSString stringWithFormat:@"%@",c.time];
		[aCell.contentView addSubview:timeLabel];
		
		CGRect dayFrame = CGRectMake(20.0, 32.0, 80.0, 20.0);
		UILabel *dayLabel = [[[UILabel alloc] initWithFrame:dayFrame] autorelease];
		dayLabel.backgroundColor = [UIColor clearColor];
		dayLabel.textColor =  [Constants labelTextColor];
		dayLabel.textAlignment = UITextAlignmentLeft;
		dayLabel.font = [UIFont systemFontOfSize:12.0];
		dayLabel.tag = 14;
		dayLabel.text = [NSString stringWithFormat:@"%@",c.day];
		[aCell.contentView addSubview:dayLabel];
	}

	

	//UILabel *nl = (UILabel *)[aCell viewWithTag:(300+(aCell.tag)*10+indexPath.row)];
//	NSArray *ay1 = [[calendarArray objectAtIndex:indexPath.section] valueForKey:kThingsKey];
//	nl.text = [ay1 objectAtIndex:indexPath.row];
//	
//	UILabel *il = (UILabel *)[aCell viewWithTag:(400+(aCell.tag)*10+indexPath.row)];
//	NSArray *ay2 = [[calendarArray objectAtIndex:indexPath.section] valueForKey:kImportanceKey];
//	il.text = [NSString stringWithFormat:@"%@%@", @"Importance:", [ay2 objectAtIndex:indexPath.row]];
//	
//	UILabel *ml = (UILabel *)[aCell viewWithTag:(500+(aCell.tag)*10+indexPath.row)];
//	NSArray *ay3 = [[calendarArray objectAtIndex:indexPath.section] valueForKey:kTimeKey];
//	ml.text = [NSString stringWithFormat:@"%@", [ay3 objectAtIndex:indexPath.row]];
	
	//aCell.text = [[calendarArray objectAtIndex:indexPath.section] valueForKey:kCPnameKey];
	return aCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	EditCalendar *newCal=[[EditCalendar alloc] 
						  initWithNibName:@"EditCalendar"
						  bundle:nil];
	
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Calendar";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
	
	newCal.title=@"Event";
	newCal.edit = TRUE;
	newCal.status = 1;
	Calendar *c;
	if (self.sortIndex==0) {
		c = [[self.calendarArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	}else {
		c = [self.calendarArray objectAtIndex:indexPath.row];
	}
	[newCal setIndex:[c getIndex]];
	[[self navigationController] pushViewController:newCal animated:YES];
}

- (IBAction)calendarOnSort:(id)sender{
	UISegmentedControl *sc = sender;
	if (sc.selectedSegmentIndex == 0) {
		self.sortIndex = 0;
		[self getCalendarByDate];
	}else {
		self.sortIndex = 1;
		[self getCalendarByImportance];
	}
	[self.calendarView reloadData];
}

- (void)getCalendarByDate{
	calendarDao = [[CalendarDao alloc] init];
	self.calendarArray = [calendarDao select:self.sortIndex];
	[self convertCalendar];
	NSMutableArray *data = [NSMutableArray array];
	NSString *day = @"";
	NSMutableArray *subArray = [NSMutableArray array];
	for (Calendar *c in self.calendarArray) {
		
		if (day==@""||[day isEqualToString:c.day]) {
			[subArray addObject:c];
		}else {
			[data addObject:subArray];
			subArray = [NSMutableArray array];
			[subArray addObject:c];
		}
		day = c.day;
	}
	[data addObject:subArray];
	self.calendarArray = data;
	//	[day release];
	//	[subArray release];
	//	[data release];
}
- (void)getCalendarByImportance{
	calendarDao = [[CalendarDao alloc] init];
	self.calendarArray = [calendarDao select:self.sortIndex];
	[self convertCalendar];
}


-(void)convertCalendar{
	
	NSDateFormatter *dbDateFormatter=[[NSDateFormatter alloc] init];
	[dbDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
	
	NSDateFormatter *showDateFormatter=[[NSDateFormatter alloc] init];
	[showDateFormatter setDateFormat:@"MMM dd yyyy"];

	NSDateFormatter *weekFormatter=[[NSDateFormatter alloc] init];
	[weekFormatter setDateFormat:@"ccc"];
	
	NSDateFormatter *timeFormatter=[[NSDateFormatter alloc] init];
	[timeFormatter setDateFormat:@"HH a"];
	
	for (Calendar *c in self.calendarArray) {	
	    NSDate *converDate = [dbDateFormatter dateFromString:c.begin];
	    c.day = [showDateFormatter stringFromDate:converDate];
        c.weekDay = [weekFormatter stringFromDate:converDate];
		c.time = [timeFormatter stringFromDate:converDate];
	}
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[calendarDao release];
    [super viewDidUnload];
	//self.calendarArray = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end
