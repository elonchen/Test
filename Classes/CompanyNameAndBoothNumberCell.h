//
//  CompanyNameAndBoothNumberCell.h
//  TradeShowInfo
//
//  Created by Elon on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CompanyNameAndBoothNumberCell : UITableViewCell {
	IBOutlet UILabel *labelLine;
	IBOutlet UITextField *inputCompanyName;
	
	IBOutlet UILabel *labelBooth;
	IBOutlet UILabel *labelLineV;
	IBOutlet UITextField *inputBoothNumber;
}
@property (nonatomic,retain) UILabel *labelLine;
@property (nonatomic,retain) UITextField *inputCompanyName;
@property (nonatomic,retain) UILabel *labelBooth;
@property (nonatomic,retain) UILabel *labelLineV;
@property (nonatomic,retain) UITextField *inputBoothNumber;
-(IBAction)doneKeyClicked:(id)sender;
@end
