//
//  NotePhotoCell.h
//  TradeShowInfo
//
//  Created by Elon on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteLabelCell.h"
#import "Constants.h"
#import "EditNotesField.h"

@interface NotePhotoCell: UITableViewCell <UITableViewDelegate,UITableViewDataSource> {
    IBOutlet UITableView *myTaleView; 
	NoteLabelCell *notesCell;
}

@property (nonatomic,retain)  UITableView *myTaleView;
@property (nonatomic,retain)  NoteLabelCell *notesCell;

@end
