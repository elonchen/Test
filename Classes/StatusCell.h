//
//  StatusCell.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StatusCell : UITableViewCell {
	IBOutlet UILabel *labelName;
	IBOutlet UISwitch *switchName;
}

@property (nonatomic,retain) UILabel *labelName;
@property (nonatomic,retain) UISwitch *switchName;

@end
