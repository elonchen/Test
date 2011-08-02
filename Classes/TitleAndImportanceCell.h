//
//  TitleAndImportanceCell.h
//  TradeShowInfo
//
//  Created by Elon on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventTitleCell.h"
#import "ImportanceCell.h"

@interface TitleAndImportanceCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource>{
	IBOutlet UITableView *leftTableView;
	IBOutlet UITableView *rightTableView;
	EventTitleCell *eventTitleCell;
	ImportanceCell *importanceCell;
}
@property (nonatomic,retain) UITableView *leftTableView;
@property (nonatomic,retain) UITableView *rightTableView;
@property (nonatomic,retain) EventTitleCell *eventTitleCell;
@property (nonatomic,retain) ImportanceCell *importanceCell;
@end
