//
//  EditNotesField.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Baseview.h"
#import "SectionHeaderView.h"
#import "NoteCell.h"

@interface EditNotesField :  Baseview<SectionHeaderViewDelegate>  {
	NoteCell *noteCell;
	UIToolbar *keyboardToolbar;
	BOOL keyboardToolbarShouldHide;
}

@property (nonatomic, retain) NoteCell *noteCell;
@property (nonatomic, retain) UIToolbar *keyboardToolbar;

@end
