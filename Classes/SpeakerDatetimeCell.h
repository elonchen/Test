//
//  SpeakerDatetimeCell.h
//  TradeShowInfo
//
//  Created by Elon on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "NotesFieldCell.h"

@interface SpeakerDatetimeCell: UITableViewCell <UITableViewDelegate,UITableViewDataSource> {
    IBOutlet UITableView *myTaleView; 
	NotesFieldCell *speakerCell;
	//StarsEndsCell *datetimeCell;
}

@property (nonatomic,retain)  UITableView *myTaleView;
@property (nonatomic,retain)  NotesFieldCell *speakerCell;
//@property (nonatomic,retain)  StarsEndsCell *datetimeCell;

@end
