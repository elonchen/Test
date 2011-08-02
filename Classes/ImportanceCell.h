//
//  ImportanceCell.h
//  TradeShowInfo
//
//  Created by Elon on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ImportanceCellClickedDelegate;

@interface ImportanceCell : UITableViewCell {
	IBOutlet UILabel *labelImportance;
	IBOutlet UILabel *labelLine;
	IBOutlet UILabel *labelNumber;
}
@property (nonatomic,retain) UILabel *labelImportance;
@property (nonatomic,retain) UILabel *labelLine;
@property (nonatomic,retain) UILabel *labelNumber;

@property (nonatomic, assign) id <ImportanceCellClickedDelegate> delegate;

@end

@protocol ImportanceCellClickedDelegate <NSObject>
@optional
-(void)importanceCell:(ImportanceCell*)importanceCell numberClicked:(NSString *)number;
@end