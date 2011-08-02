//
//  EditMeeting.h
//  TradeShowInfo
//
//  Created by Elon on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Baseview.h"
#import "MeetingDao.h"
#import "SectionHeaderView.h"
#import "TwoTableViewCell.h"
#import "NotePhotoCell.h"
#import "StarsAndEndsCell.h"

#import "EditNotesField.h"

#import	"/usr/include/sqlite3.h"
#define databaseFileName @"data.sqlite3"

@interface EditMeeting : Baseview<SectionHeaderViewDelegate>  {
	TwoTableViewCell *TAIC;
	NotePhotoCell *NPCell;
	StarsAndEndsCell *DTCell;
	
	SectionHeaderView *headerViewOfMeetingAttendees;
	SectionHeaderView *headerViewOfFollowUpToDoItems;
	sqlite3 *database;
	//UIToolbar *keyboardToolbar;
	BOOL keyboardToolbarShouldHide;
	MeetingDao *meetingDao;
	
	EditNotesField *newEditNotesField;
}

@property (nonatomic, retain) TwoTableViewCell *TAIC;
@property (nonatomic, retain) NotePhotoCell *NPCell;
@property (nonatomic, retain) StarsAndEndsCell *DTCell;

@property (nonatomic,retain) SectionHeaderView *headerViewOfMeetingAttendees;
@property (nonatomic,assign) BOOL openFlagOfMeetingAttendees;
@property (nonatomic,retain) SectionHeaderView *headerViewOfFollowUpToDoItems;
//@property (nonatomic, retain) UIToolbar *keyboardToolbar;

@property (nonatomic,retain) MeetingDao *meetingDao;

@property (nonatomic,retain)  EditNotesField *newEditNotesField;

@end
