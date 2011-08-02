//
//  TextFieldCell.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TextFieldCell: UITableViewCell<UITextViewDelegate> {
	IBOutlet UILabel *labelName;
	IBOutlet UITextField *textField;
}

@property (nonatomic,retain) UILabel *labelName;
@property (nonatomic,retain) UITextField *textField;


@end
