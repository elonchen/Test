//
//  EditPlanning.m
//  TradeShowInfo
//
//  Created by Bright Creek on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditPlanning.h"
#import "Constants.h"


@implementation EditPlanning
@synthesize headerViewOfYourBiggestGoals,headerViewOfCompaniesToVisit,headerViewOfFieldVisits,headerViewOfSeminarsAndWorkshop,headerViewOfStrategicMeetings,headerViewOfDayPlanner;


-(void)viewDidLoad{
	[super viewDidLoad];
	
	self.view.backgroundColor = [Constants backgroundColor];
	headerViewOfYourBiggestGoals= [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Your Biggest Goals" section:0 delegate:self];
	headerViewOfCompaniesToVisit = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Companies to Visit" section:1 delegate:self];
	headerViewOfFieldVisits= [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Field Visits" section:2 delegate:self];
	headerViewOfSeminarsAndWorkshop = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Seminars & Workshop" section:3 delegate:self];
	headerViewOfStrategicMeetings= [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Strategic Meetings" section:4 delegate:self];
	headerViewOfDayPlanner = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 40) title:@"Day Planner" section:5 delegate:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 6;
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
	
	if (section==0) {
		return headerViewOfYourBiggestGoals;
	}
	else if(section==1){	
		return headerViewOfCompaniesToVisit;
	}
	else if (section==2) {
		return headerViewOfFieldVisits;			
	}
	else if(section==3){
		return headerViewOfSeminarsAndWorkshop;			
	}
	else if(section==4){	
		return headerViewOfStrategicMeetings;
	}
	else if(section==5){	
		return headerViewOfDayPlanner;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"PlanningCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//	CGFloat height=0.0;
//	
//	if (indexPath.section==0) {
//		height=114.0;
//	}
//	if (indexPath.section==1) {
//		height=72.0;
//	}
//	if (indexPath.section==2){
//		height=80.0;
//	}
//	if (indexPath.section==3){
//		height=20.0;
//	}
//	if (indexPath.section==4){
//		height=140.0;
//	}
//	
//	return height;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 44.0;
}

#pragma mark Section header delegate
//-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened{
//	NSLog(@"%d opened",sectionOpened);
////	switch (sectionOpened) {
////		case 0:
////			[self insertOrDeleteYourBiggestGoals];
////			break;
////		default:
////			break;
////	}	
//	[self insertOrDeleteYourBiggestGoals:sectionOpened];
//}
//-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed{
//	NSLog(@"%d closed",sectionClosed);
//	//[self insertOrDeleteContacts:sectionClosed];
//}
//-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionPlus:(NSInteger)section{
//	NSLog(@"%d plus clicked",section);
//}

-(void)insertOrDeleteYourBiggestGoals:(NSInteger)sectionNumber{
	if (sectionNumber==0) {
		//if (openFlagOfContacts==NO) {
			/*
			 Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
			 */
			//NSInteger countOfRowsToInsert = 2;
			NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
			for (NSInteger i = 0; i < 2; i++) {
				[indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:0]];
			}
			
			//openFlagOfContacts=YES;
			[self.tableView beginUpdates];
			[self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:UITableViewRowAnimationTop];
			[self.tableView endUpdates];
			
			[indexPathsToInsert release];
			NSLog(@"table view height %f",self.view.frame.size.height);
//		}
//		else {
//			openFlagOfContacts=NO;
//			//NSInteger countOfRowsToDelete = [contactsAndToDos numberOfRowsInSection:sectionClosed];
//			
//			//if (countOfRowsToDelete > 0)
//			{
//				NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
//				for (NSInteger i = 0; i < countOfContacts; i++) {
//					[indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionNumber]];
//				}
//				[self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
//				[indexPathsToDelete release];
//			}
//			NSLog(@"table view height %f",self.view.frame.size.height);
//		}
	}
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Return the number of rows in the section.
//	if(section==0)
////		if (openFlagOfContacts) {
////			return 4;
////		}
//		return 4;
//		else {
//			return 0;
//		}
//	if(section==2)
//		return 0;
//    return 1;
//}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
