//
//  TodoController.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import	"/usr/include/sqlite3.h"
#import "ToDoDao.h"
//#import "SectionHeaderView.h"
#import "BaseController.h"

@interface TodoController : BaseController {
	NSMutableArray *todoItemArray;
	ToDoDao *todoDao;
	//sqlite3 *database;
	UITableView *todoItemView;
	UISegmentedControl *orderBy;
	int sortIndex;
}
@property (nonatomic, retain) NSMutableArray *todoItemArray;
@property (nonatomic,retain) ToDoDao *todoDao;
@property (nonatomic, retain) IBOutlet UITableView *todoItemView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *orderBy;
@property (nonatomic, assign) int sortIndex;


-(IBAction)todoOnSort:(id)sender;
-(IBAction)addTodoClicked:(id)sender;

-(void) refreshTodoView;

@end
