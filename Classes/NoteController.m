//
//  NoteController.h
//  TradeShowInfo
//
//  Created by brightcreek on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//#import "NoteController.h"
//#import "TbNoteDao.h"
//#import "TbNote.h"
//
//@implementation NoteController
//@synthesize myTableView, tbNoteDao, record;
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//		tbNoteDao = [[TbNoteDao alloc] init];
//		[tbNoteDao insertWithTitle:@"TEST TITLE" Body:@"TEST BODY"];
//		//    [tbNoteDao updateAt:1 Title:@"UPDATE TEST" Body:@"UPDATE BODY"];
//		//    [tbNoteDao deleteAt:1];
//		record = [[tbNoteDao select] retain];
//	}
//	return self;
//}
//
//- (void)viewDidLoad {
//	[super viewDidLoad];
//	myTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
//	myTableView.delegate = self;
//	myTableView.dataSource = self;
//	self.view = myTableView;
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//	return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//	return [record count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//	static NSString *CellIdentifier = @"Cell";
//	
//	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//	if (cell == nil) {
//		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
//	}
//	TbNote *tr = (TbNote *)[record objectAtIndex:indexPath.row];
//	cell.text = [NSString stringWithFormat:@"%i %@", [tr getIndex], tr.title];
//	return cell;
//}
//
//- (void)didReceiveMemoryWarning {
//	[super didReceiveMemoryWarning];
//}
//
//- (void)dealloc {
//	[super dealloc];
//}
//
//@end