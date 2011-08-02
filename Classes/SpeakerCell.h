//
//  SpeakerCell.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "HomePageCell.h"

@interface SpeakerCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource> {
    IBOutlet UITableView *myTaleView; 
	HomePageCell *speakerCell;
}

@property (nonatomic,retain)  UITableView *myTaleView;
@property (nonatomic,retain)  HomePageCell *speakerCell;

@end
