//
//  EditSeminar.h
//  TradeShowInfo
//
//  Created by Elon on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Baseview.h"
#import "SeminarDao.h"
#import "SectionHeaderView.h"
#import "TwoTableViewCell.h"
#import "StarsEndsCell.h"
#import "NotesFieldCell.h"
#import "NotePhotoCell.h"
#import "SpeakerDatetimeCell.h"

#import	"/usr/include/sqlite3.h"
#define databaseFileName @"data.sqlite3"

@interface EditSeminar : Baseview<SectionHeaderViewDelegate> {
	TwoTableViewCell *TAIC;
	NotePhotoCell *NPCell;
	SpeakerDatetimeCell *SDCell;
	
	SectionHeaderView *headerViewOfContacts;
	SectionHeaderView *headerViewOfToDos;
	sqlite3 *database;
	UIToolbar *keyboardToolbar;
	BOOL keyboardToolbarShouldHide;
	SeminarDao *seminarDao;
}

@property (nonatomic, retain) TwoTableViewCell *TAIC;
@property (nonatomic, retain) NotePhotoCell *NPCell;
@property (nonatomic, retain) SpeakerDatetimeCell *SDCell;

@property (nonatomic,retain) SectionHeaderView *headerViewOfContacts;
@property (nonatomic,assign) BOOL openFlagOfContacts;
@property (nonatomic,retain) SectionHeaderView *headerViewOfToDos;
@property (nonatomic, retain) UIToolbar *keyboardToolbar;

@property (nonatomic,retain) NSString *seminarName;
@property (nonatomic,retain) NSString *location;
@property (nonatomic,retain) NSString *importance;
@property (nonatomic,retain) NSString *datetime;
@property (nonatomic,retain) SeminarDao *seminarDao;

@end
