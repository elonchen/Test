//
//  EditCalendar.h
//  TradeShowInfo
//
//  Created by Elon on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionHeaderView.h"
#import "TitleAndImportanceCell.h"
#import "Baseview.h"
#import "StarsAndEndsCell.h"
#import "CalendarDao.h"
#import "NotePhotoHomePageCell.h"

#import "EditNotesField.h"

@interface EditCalendar : Baseview <SectionHeaderViewDelegate,ImportanceCellClickedDelegate>{
	TitleAndImportanceCell *TTVC;
//	UIActionSheet *actionSheet;
//	NSMutableArray *arrayImportance;
	SectionHeaderView *headerViewOfContacts;
	SectionHeaderView *headerViewOfToDos;
	StarsAndEndsCell *SEDate;
	CalendarDao *calendarDao;
	NotePhotoHomePageCell *NPHPcell;
	
	EditNotesField *newEditNotesField;
}
- (void)dispearAllTextfield;
@property(nonatomic,retain) TitleAndImportanceCell *TTVC;
@property(nonatomic,retain) StarsAndEndsCell *SEDate;
@property(nonatomic,retain) NotePhotoHomePageCell *NPHPcell;
//@property(nonatomic,retain) UIActionSheet *actionSheet;
//@property(nonatomic,retain) NSMutableArray *arrayImportance;
@property(nonatomic,retain) SectionHeaderView *headerViewOfContacts;
@property(nonatomic,retain) SectionHeaderView *headerViewOfToDos;
@property(nonatomic,retain) CalendarDao *calendarDao;

@property (nonatomic,retain)  EditNotesField *newEditNotesField;

@end
