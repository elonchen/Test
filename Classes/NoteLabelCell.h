//
//  NoteLabelCell.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NoteLabelClickedDelegate;

@interface NoteLabelCell : UITableViewCell {
	IBOutlet UILabel *labelName;
	IBOutlet UILabel *labelValue;
}

@property (nonatomic,retain) UILabel *labelName;
@property (nonatomic,retain) UILabel *labelValue;

@property (nonatomic, assign) id <NoteLabelClickedDelegate> delegate;

@end

@protocol NoteLabelClickedDelegate <NSObject>
@optional
-(void)noteLabelCell:(NoteLabelCell *)noteLabelCell labelClicked:(NSString *)labelText;

@end
