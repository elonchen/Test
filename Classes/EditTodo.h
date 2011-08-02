//
//  EditTodo.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Baseview.h"
#import "ToDoDao.h"
#import "SectionHeaderView.h"
#import "TwoTableViewCell.h"
#import "StatusDetailPhotoCell.h"
#import "StarsAndEndsCell.h"

#import "EditNotesField.h"

#import	"/usr/include/sqlite3.h"
#define databaseFileName @"data.sqlite3"

@interface EditTodo : Baseview<SectionHeaderViewDelegate> {
	TwoTableViewCell *TAIC;
	StatusDetailPhotoCell *SDPCell;
	StarsAndEndsCell *DTCell;
	
	SectionHeaderView *headerViewOfContacts;
	sqlite3 *database;
	UIToolbar *keyboardToolbar;
	BOOL keyboardToolbarShouldHide;
	ToDoDao *todoDao;
	
	EditNotesField *newEditNotesField;
}

@property (nonatomic, retain) TwoTableViewCell *TAIC;
@property (nonatomic, retain) StatusDetailPhotoCell *SDPCell;
@property (nonatomic, retain) StarsAndEndsCell *DTCell;

@property (nonatomic,retain) SectionHeaderView *headerViewOfContacts;
@property (nonatomic,assign) BOOL openFlagOfContacts;
@property (nonatomic, retain) UIToolbar *keyboardToolbar;

@property (nonatomic,retain) ToDoDao *todoDao;

@property (nonatomic,retain)  EditNotesField *newEditNotesField;

@end
