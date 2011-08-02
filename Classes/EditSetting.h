//
//  EditSetting.h
//  TradeShowInfo
//
//  Created by Bright Creek on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	"/usr/include/sqlite3.h"
#import "SettingDao.h"
#import "SectionHeaderView.h"
#import "ShowHintsCell.h"
#import "StatusCell.h"
#import "Setting.h"

@interface EditSetting : UIViewController<SectionHeaderViewDelegate> {
	sqlite3 *database;
	SettingDao *settingDao;
	Setting *setting;
	//UITableView *settingView;
	ShowHintsCell *SHCell;
	StatusCell *SCTDCell;
}

@property (nonatomic,retain) Setting *setting;
@property (nonatomic,retain) SettingDao *settingDao;
@property (nonatomic, retain) ShowHintsCell *SHCell;
@property (nonatomic, retain) StatusCell *SCTDCell;
//@property (nonatomic,retain) IBOutlet UITableView *settingView;

@end
