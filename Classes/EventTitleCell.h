//
//  EventTitleCell.h
//  TradeShowInfo
//
//  Created by Elon on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EventTitleCell : UITableViewCell < UITextViewDelegate > {
	IBOutlet UITextView *title;
}
@property (nonatomic,retain) UITextView *title;
@end
