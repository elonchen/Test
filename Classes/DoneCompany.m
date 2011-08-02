//
//  DoneCompany.m
//  TradeShowInfo
//
//  Created by Elon on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DoneCompany.h"
#define countOfContacts 30

@implementation DoneCompany
@synthesize TTVC,NPHPC;
@synthesize headerViewOfContacts,headerViewOfToDos,openFlagOfContacts,openFlagOfToDos;
@synthesize companyDao;

- (void)viewDidLoad {
    [super viewDidLoad];
	companyDao = [[CompanyDao alloc] init];
	
	UIBarButtonItem * editButton =
	[[UIBarButtonItem alloc]
	 initWithTitle:@"Edit"
	 style:UIBarButtonItemStyleBordered
	 target:self
	 action:@selector(editButtonClicked:) 
	 ];
	self.navigationItem.rightBarButtonItem=editButton;
	[editButton release];
	
	self.view.backgroundColor=[Constants backgroundColor];

	headerViewOfContacts= [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:[NSString stringWithFormat:@"Contacts (%d)",countOfContacts] section:1 delegate:self];
	headerViewOfToDos = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"To Dos(0)" section:2 delegate:self];
	headerViewOfContacts.plusButton.alpha=0.0;
	headerViewOfToDos.plusButton.alpha=0.0;
}
#pragma mark Section header delegate
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened{
	NSLog(@"%d opened",sectionOpened);	
}
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed{
	NSLog(@"%d closed",sectionClosed);
}
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionPlus:(NSInteger)section{
	NSLog(@"%d plus clicked",section);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
		
	Company *c = [companyDao getCompanyById: [super getIndex]];
	TTVC.companyBoothCell.inputCompanyName.text=c.name;
	TTVC.companyBoothCell.inputBoothNumber.text=c.booth;
	TTVC.importanceCell.labelNumber.text=[NSString stringWithFormat:@"%d",[c getImportance]];
	if ([c.notes length]==0) {
		NSLog(@"NO NOTES");
//		NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
//		for (NSInteger i = 0; i < 1; i++) {
//			[indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:0]];
//		}
//		[NPHPC.myTaleView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
		NPHPC.deleteNoteCell=1;
		[NPHPC.myTaleView deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
	}
	else {
		NPHPC.notesCell.labelValue.text = c.notes;
	}

	NSLog(@"Home Page URL %@",c.homePage);
	if ([c.homePage length]==0) {
		NSLog(@"NO URL");
		NPHPC.deleteURLCell=1;
		[NPHPC.myTaleView deleteSections:[NSIndexSet indexSetWithIndex:2-NPHPC.deleteNoteCell-NPHPC.deletePhotoCell] withRowAnimation:UITableViewRowAnimationTop];
	}
	else {
		NPHPC.homePageCell.textField.text = c.homePage;
	}

	
	
	TTVC.importanceCell.labelLine.alpha=0.0;
}

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
			NSLog(@"TTVC is nil, create new one.");
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
			NSLog(@"NPHPC is nil, create new one.");
		
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
	[companyDao release];
	
	[TTVC release];
	[NPHPC release];
	[headerViewOfToDos release];
	[headerViewOfContacts release];

    [super dealloc];
}


@end
