//
//  ShowHintsCell.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HintsDao.h"

@interface ShowHintsCell : UITableViewCell {
	IBOutlet UILabel *labelName;
	IBOutlet UIButton *button;
	HintsDao *hintsDao;
}

@property (nonatomic,retain) HintsDao *hintsDao;
@property (nonatomic,retain) UILabel *labelName;
@property (nonatomic,retain) UIButton *button;

-(IBAction)hintsShowClicked:(id)sender;

@end
