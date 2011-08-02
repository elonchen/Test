//
//  DatetimeCell.h
//  TradeShowInfo
//
//  Created by Elon on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "StarsEndsCell.h"

@interface DatetimeCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UITableView *myTaleView; 
	StarsEndsCell *datetimeCell;
}

@property (nonatomic,retain)  UITableView *myTaleView;
@property (nonatomic,retain)  StarsEndsCell *datetimeCell;

@end
