//
//  NotePhotoHomePageCell.h
//  TradeShowInfo
//
//  Created by Elon on 3/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteLabelCell.h"
#import "HomePageCell.h"
#import "Constants.h"

@interface NotePhotoHomePageCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UITableView *myTaleView; 
	NoteLabelCell *notesCell;
	HomePageCell *homePageCell;
}
@property (nonatomic,retain)  UITableView *myTaleView;
@property (nonatomic,retain)  NoteLabelCell *notesCell;
@property (nonatomic,retain)  HomePageCell *homePageCell;
@property (nonatomic,assign)  NSInteger deleteNoteCell;
@property (nonatomic,assign)  NSInteger deletePhotoCell;
@property (nonatomic,assign)  NSInteger deleteURLCell;

@end
