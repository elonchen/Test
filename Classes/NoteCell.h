//
//  NoteCell.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotesFieldCell.h"
#import "Constants.h"

@interface NoteCell : UITableViewCell  {
    IBOutlet UITableView *myTaleView; 
	NotesFieldCell *notesCell;
}

@property (nonatomic,retain)  UITableView *myTaleView;
@property (nonatomic,retain)  NotesFieldCell *notesCell;

@end
