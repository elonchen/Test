//
//  NotesFieldCell.h
//  TradeShowInfo
//
//  Created by Elon on 3/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NotesFieldCell : UITableViewCell<UITextViewDelegate>{
	IBOutlet UILabel *labelName;
	IBOutlet UITextView *textView;
}
@property (nonatomic,retain) UILabel *labelName;
@property (nonatomic,retain) UITextView *textView;
@end
