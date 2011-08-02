//
//  Baseview.h
//  TradeShowInfo
//
//  Created by brightcreek on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Baseview : UITableViewController<UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
	UIDatePicker *datePickerView;
	NSDateFormatter *showDateFormatter;
	NSDateFormatter *dbDateFormatter;
	NSDateFormatter *dbTimeFormatter;
	NSDateFormatter *showTimeFormatter;	
	UIActionSheet *actionSheet;
	NSDate *converDate;
	NSString *converResult;
	NSMutableArray *arrayImportance;
	int index;
}

@property (nonatomic, retain) UIDatePicker *datePickerView;
@property (nonatomic, retain) NSDateFormatter *showDateFormatter;
@property (nonatomic, retain) NSDateFormatter *dbDateFormatter;
@property (nonatomic, retain) NSDateFormatter *showTimeFormatter;
@property (nonatomic, retain) NSDateFormatter *dbTimeFormatter;
@property (nonatomic, retain) UIActionSheet *actionSheet;
@property (nonatomic, retain) NSDate *converDate;
@property (nonatomic, retain) NSString *converResult;
@property(nonatomic,retain) NSMutableArray *arrayImportance;
@property (nonatomic,assign) BOOL edit;
@property (nonatomic, retain) NSString *editNote;

@property (nonatomic,assign) NSInteger status;

- (int)getIndex;
- (void)setIndex : (int) newIndex;
-(NSString *)converStrToShowDateFomart:(NSString *)dateStr; 
-(NSString *)converStrToDBDateFomart:(NSString *)dateStr;
-(NSString *)converStrToShowTimeFomart:(NSString *)dateStr;
-(NSString *)converStrToDBTimeFomart:(NSString *)dateStr;

- (void)showImportancePicker: (NSString *)importanceText;

-(void)viewToUp:(CGFloat)VIEW_UP;
-(void)ViewToDown;
@end

