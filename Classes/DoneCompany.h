//
//  DoneCompany.h
//  TradeShowInfo
//
//  Created by Elon on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baseview.h"
#import "CompanyDao.h"

#import "SectionHeaderView.h"
#import "TwoTableViewCell.h"
#import "NotePhotoHomePageCell.h"

@interface DoneCompany : Baseview <SectionHeaderViewDelegate>{
	TwoTableViewCell *TTVC;	
	SectionHeaderView *headerViewOfContacts;
	SectionHeaderView *headerViewOfToDos;
	NotePhotoHomePageCell *NPHPC;
	
	CompanyDao *companyDao;
}
@property (nonatomic,retain) TwoTableViewCell *TTVC;
@property(nonatomic,retain) SectionHeaderView *headerViewOfContacts;
@property(nonatomic,assign) BOOL openFlagOfContacts;
@property(nonatomic,retain) SectionHeaderView *headerViewOfToDos;
@property(nonatomic,assign) BOOL openFlagOfToDos;
@property (nonatomic,retain) NotePhotoHomePageCell *NPHPC;

@property (nonatomic,retain) CompanyDao *companyDao;
@end
