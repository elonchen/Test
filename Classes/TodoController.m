//
//  TodoController.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TodoController.h"
#import "EditTodo.h"
#import "Constants.h"

@implementation TodoController

@synthesize todoItemArray;
@synthesize todoItemView;
@synthesize orderBy;
@synthesize sortIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.sortIndex = 1;
	
	self.todoItemView.backgroundColor = [Constants backgroundColor];
	self.todoItemView.separatorColor = [Constants tableLineColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(IBAction)todoOnSort:(id)sender{
	UISegmentedControl *sg = sender;
	self.sortIndex = sg.selectedSegmentIndex;
	
	[self refreshTodoView];
}
-(IBAction)addTodoClicked:(id)sender{
	EditTodo *newTodo = [[EditTodo alloc] initWithNibName:@"EditTodo" bundle:nil];
	
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"To Do";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
	
	newTodo.title=@"New To Do Item";
	newTodo.edit = FALSE;
	newTodo.status = 0;
	[[self navigationController] pushViewController:newTodo animated:YES];
}

- (void) refreshTodoView{
	self.todoItemArray = [NSMutableArray array];
	todoDao = [[ToDoDao alloc] init];
	self.todoItemArray = [todoDao select:self.sortIndex];	
	[todoItemView reloadData];
}

- (void) viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
	[self refreshTodoView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"TodoCell";
	UITableViewCell *todoCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (todoCell == nil)
	{
		todoCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
	}else {
		UIView *viewToRemove1 = nil;
		viewToRemove1 = [todoCell.contentView viewWithTag:1];
		if (viewToRemove1)
			[viewToRemove1 removeFromSuperview];
		UIView *viewToRemove2 = nil;
		viewToRemove2 = [todoCell.contentView viewWithTag:2];
		if (viewToRemove2)
			[viewToRemove2 removeFromSuperview];
		UIView *viewToRemove3 = nil;
		viewToRemove3 = [todoCell.contentView viewWithTag:3];
		if (viewToRemove3)
			[viewToRemove3 removeFromSuperview];
		UIView *viewToRemove4 = nil;
		viewToRemove4 = [todoCell.contentView viewWithTag:4];
		if (viewToRemove4)
			[viewToRemove4 removeFromSuperview];
	}
	todoCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	ToDo *m = [todoItemArray objectAtIndex:indexPath.row];
	
	CGRect titleFrame = CGRectMake(20.0, 2.0, 260.0, 30.0);
	UILabel *titleLabel = [[[UILabel alloc] initWithFrame:titleFrame] autorelease];
	titleLabel.backgroundColor = [Constants backgroundColor];
	titleLabel.textColor = [UIColor blackColor];
	titleLabel.textAlignment = UITextAlignmentLeft;
	titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
	titleLabel.tag = 1;
	titleLabel.text = m.title;
	[todoCell.contentView addSubview:titleLabel];
	
	CGRect datetimeFrame = CGRectMake(20.0, 30.0, 160.0, 20.0);
	UILabel *dateTimeLabel = [[[UILabel alloc] initWithFrame:datetimeFrame] autorelease];
	dateTimeLabel.backgroundColor = [Constants backgroundColor];
	dateTimeLabel.textColor = [Constants labelTextColor];
	dateTimeLabel.textAlignment = UITextAlignmentLeft;
	dateTimeLabel.font = [UIFont systemFontOfSize:12.0];
	dateTimeLabel.tag = 2;
	dateTimeLabel.text = [NSString stringWithFormat:@"%@%@", @"Due:", [self converStrToShowTimeFomart:m.time]];
	[todoCell.contentView addSubview:dateTimeLabel];
	
	CGRect importanceFrame = CGRectMake(180.0, 30.0, 100.0, 20.0);
	UILabel *importanceLabel = [[[UILabel alloc] initWithFrame:importanceFrame] autorelease];
	importanceLabel.backgroundColor = [Constants backgroundColor];
	importanceLabel.textColor = [Constants labelTextColor];
	importanceLabel.textAlignment = UITextAlignmentLeft;
	importanceLabel.font = [UIFont systemFontOfSize:12.0];
	importanceLabel.tag = 4;
	importanceLabel.text = [NSString stringWithFormat:@"%@%d", @"Importance:", [m getImportance]];
	[todoCell.contentView addSubview:importanceLabel];	
	
	return todoCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.todoItemArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *) tableView{
	return 1;
	
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath{
	ToDo *todo = [todoItemArray objectAtIndex:indexPath.row];
	
	EditTodo *detailViewController = [[EditTodo alloc] initWithNibName:@"EditTodo" bundle:nil];
	detailViewController.title = @"To Do Items";
	detailViewController.edit = TRUE;
	detailViewController.status = 1;
	[detailViewController setIndex:[todo getIndex]];
	[self.navigationController pushViewController:detailViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 58.0;
}

- (void)viewDidUnload {
    [super viewDidUnload];
	[todoDao release];
	self.todoItemArray = nil;
}
- (void)dealloc {
    [super dealloc];
}


@end
