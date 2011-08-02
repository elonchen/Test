//
//  EditSeminar.h
//  TradeShowInfo
//
//  Created by Elon on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Baseview.h"
#import "EducationDao.h"
#import "SectionHeaderView.h"
#import "TwoTableViewCell.h"
#import "NotePhotoCell.h"
#import "StarsAndEndsCell.h"
#import "SpeakerCell.h"

#import "EditNotesField.h"

#import	"/usr/include/sqlite3.h"
#define databaseFileName @"data.sqlite3"

@interface EditEducation : Baseview<SectionHeaderViewDelegate> {
	TwoTableViewCell *TAIC;
	NotePhotoCell *NPCell;
	StarsAndEndsCell *datetimeCell;
	SpeakerCell *speakerCell;
	
	SectionHeaderView *headerViewOfContacts;
	SectionHeaderView *headerViewOfBiggestIdeas;
	sqlite3 *database;
	UIToolbar *keyboardToolbar;
	BOOL keyboardToolbarShouldHide;
	EducationDao *educationDao;
	
	EditNotesField *newEditNotesField;
}

@property (nonatomic, retain) TwoTableViewCell *TAIC;
@property (nonatomic, retain) NotePhotoCell *NPCell;
@property (nonatomic, retain) StarsAndEndsCell *datetimeCell;
@property (nonatomic, retain) SpeakerCell *speakerCell;

@property (nonatomic,retain) SectionHeaderView *headerViewOfContacts;
@property (nonatomic,assign) BOOL openFlagOfContacts;
@property (nonatomic,retain) SectionHeaderView *headerViewOfBiggestIdeas;
@property (nonatomic, retain) UIToolbar *keyboardToolbar;

@property (nonatomic,retain) EducationDao *educationDao;

@property (nonatomic,retain)  EditNotesField *newEditNotesField;

@end
