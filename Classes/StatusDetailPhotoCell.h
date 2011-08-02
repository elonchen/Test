//
//  StatusDetailPhotoCell.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteLabelCell.h"
#import "StatusCell.h"
#import "Constants.h"

@interface StatusDetailPhotoCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource> {
    IBOutlet UITableView *myTaleView; 
	StatusCell *statusCell;
	NoteLabelCell *detailCell;
}

@property (nonatomic,retain)  UITableView *myTaleView;
@property (nonatomic,retain)  StatusCell *statusCell;
@property (nonatomic,retain)  NoteLabelCell *detailCell;

@end
