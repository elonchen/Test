//
//  HomePageCell.h
//  TradeShowInfo
//
//  Created by Elon on 3/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HomePageCell : UITableViewCell {
	IBOutlet UILabel *labelName;
	IBOutlet UITextField *textField;
}
@property (nonatomic,retain) UILabel *labelName;
@property (nonatomic,retain) UITextField *textField;
-(void)doneClicked:(id)sender;
@end
