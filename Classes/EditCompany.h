//
//  EditCompany.h
//  TradeShowInfo
//
//  Created by Elon on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionHeaderView.h"
#import "TwoTableViewCell.h"

#import "NotePhotoHomePageCell.h"
#import "Baseview.h"
#import "CompanyDao.h"

#import "EditNotesField.h"

#import	"/usr/include/sqlite3.h"
#define databaseFileName @"data.sqlite3"


@interface EditCompany : Baseview <SectionHeaderViewDelegate,ImportanceCellClickedDelegate>{
	TwoTableViewCell *TTVC;	
	SectionHeaderView *headerViewOfContacts;
	SectionHeaderView *headerViewOfToDos;
	NotePhotoHomePageCell *NPHPC;
	sqlite3 *database;	
	UIToolbar *keyboardToolbar;
	BOOL keyboardToolbarShouldHide;
	CompanyDao *companyDao;
	
	EditNotesField *newEditNotesField;
}
- (void)dispearAllTextfield;

@property (nonatomic,retain) TwoTableViewCell *TTVC;
@property(nonatomic,retain) SectionHeaderView *headerViewOfContacts;
@property(nonatomic,assign) BOOL openFlagOfContacts;
@property(nonatomic,retain) SectionHeaderView *headerViewOfToDos;
@property(nonatomic,retain) NotePhotoHomePageCell *NPHPC;

//for detail view
@property (nonatomic,retain) NSString *comName;
@property (nonatomic,retain) NSString *boothNum;
@property (nonatomic,retain) NSString *importance;

@property (nonatomic,retain) CompanyDao *companyDao;

@property (nonatomic,retain)  EditNotesField *newEditNotesField;

@property (nonatomic, retain) UIToolbar *keyboardToolbar;


@end
