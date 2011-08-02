//
//  StarsEndsCell.h
//  TradeShowInfo
//
//  Created by Elon on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StarsEndsCell : UITableViewCell {
//	IBOutlet UILabel *startLeftLabel;
//	IBOutlet UILabel *startRightLabel;
//	IBOutlet UILabel *endLeftLabel;
//	IBOutlet UILabel *endRightLabel;
	IBOutlet UILabel *leftLabel;
	IBOutlet UITextField *rightLabel;
}
//@property (nonatomic,retain) UILabel *startLeftLabel;
//@property (nonatomic,retain) UILabel *startRightLabel;
//@property (nonatomic,retain) UILabel *endLeftLabel;
//@property (nonatomic,retain) UILabel *endRightLabel;
@property (nonatomic,retain) UILabel *leftLabel;
@property (nonatomic,retain) UITextField *rightLabel;
@end
