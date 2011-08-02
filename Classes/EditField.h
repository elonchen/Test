//
//  EditField.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionHeaderView.h"
#import "TitleAndImportanceCell.h"
#import "Baseview.h"
#import "StarsAndEndsCell.h"
#import "FieldDao.h"
#import "NotePhotoHomePageCell.h"
//#import	"AddressCell.h"

#import "EditNotesField.h"

@interface EditField : Baseview <SectionHeaderViewDelegate,ImportanceCellClickedDelegate>{
	TitleAndImportanceCell *TTVC;
	SectionHeaderView *headerViewOfContacts;
	SectionHeaderView *headerViewOfToDos;
	StarsAndEndsCell *SEDate;
	FieldDao *fieldDao;
	NotePhotoHomePageCell *NPHPcell;
	//AddressCell *addressCell;
	
	EditNotesField *newEditNotesField;
}
- (void)dispearAllTextfield;
@property(nonatomic,retain) TitleAndImportanceCell *TTVC;
@property(nonatomic,retain) StarsAndEndsCell *SEDate;
@property(nonatomic,retain) NotePhotoHomePageCell *NPHPcell;
@property(nonatomic,retain) SectionHeaderView *headerViewOfContacts;
@property(nonatomic,retain) SectionHeaderView *headerViewOfToDos;
@property(nonatomic,retain) FieldDao *fieldDao;
//@property(nonatomic,retain) AddressCell *addressCell;

@property (nonatomic,retain)  EditNotesField *newEditNotesField;

@end
