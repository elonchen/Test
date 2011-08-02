//
//  TwoTableViewCell.h
//  TradeShowInfo
//
//  Created by Elon on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImportanceCell.h"
#import	"CompanyNameAndBoothNumberCell.h"

@interface TwoTableViewCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource>{
	IBOutlet UITableView *leftTableView;
	IBOutlet UITableView *rightTableView;

	CompanyNameAndBoothNumberCell *companyBoothCell;
	ImportanceCell *importanceCell;
}
@property (nonatomic,retain) UITableView *leftTableView;
@property (nonatomic,retain) UITableView *rightTableView;
@property (nonatomic,retain) CompanyNameAndBoothNumberCell *companyBoothCell;
@property (nonatomic,retain) ImportanceCell *importanceCell;
@end
