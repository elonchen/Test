//
//  AddNewCompany.h
//  TradeShowInfo
//
//  Created by Elon on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	"/usr/include/sqlite3.h"
#import "SectionHeaderView.h"
#define databaseFileName @"data.sqlite3"

@interface AddNewCompany : UIViewController <UITextFieldDelegate,
										UITextViewDelegate,
										UIPickerViewDelegate, 
										UIPickerViewDataSource,
										UIAlertViewDelegate,
										UITableViewDelegate,
										UITableViewDataSource,SectionHeaderViewDelegate> 
{
	UITextField *inputTextFieldCompanyName;
	UITextField *inputTextFieldBoothNumber;
	UITextView *inputTextFieldNote;
	UITextField *inputTextFieldURL;
											
	UIButton *buttonCompany;
	//UIButton *buttonImportance;
	UIButton *buttonNote;
	UIButton *buttonPhoto;
	UIButton *buttonHomePage;
											
	UILabel *labelNote;
	UILabel *labelHomePage;
	UILabel *labelPhoto;

	UILabel *lineCompanyH;
	UILabel *lineCompanyV;
	UILabel *lineImportance;

	UILabel *labelImportance;
	NSMutableArray *arrayImportance;
	UIPickerView *pickerImportance;
	UIToolbar *pickerToolbar;
											
	sqlite3 *database;

											
	UITableView *notePhotoURL;
	UITableView *contactsAndToDos;

											
											UIActionSheet *actionSheet;


}
@property(nonatomic,retain) IBOutlet UITextField *inputTextFieldCompanyName;
@property(nonatomic,retain) IBOutlet UITextField *inputTextFieldBoothNumber;
@property(nonatomic,retain) IBOutlet UITextView *inputTextFieldNote;
@property(nonatomic,retain) IBOutlet UITextField *inputTextFieldURL;

@property(nonatomic,retain) IBOutlet UIButton *buttonCompany;
@property(nonatomic,retain) IBOutlet UIButton *buttonNote;
@property(nonatomic,retain) IBOutlet UIButton *buttonPhoto;
@property(nonatomic,retain) IBOutlet UIButton *buttonHomePage;

@property(nonatomic,retain) IBOutlet UILabel *labelNote;
@property(nonatomic,retain) IBOutlet UILabel *labelHomePage;
@property(nonatomic,retain) IBOutlet UILabel *labelPhoto;

@property(nonatomic,retain) IBOutlet UILabel *lineCompanyH;
@property(nonatomic,retain) IBOutlet UILabel *lineCompanyV;
@property(nonatomic,retain) IBOutlet UILabel *lineImportance;

@property(nonatomic,retain) IBOutlet UILabel *labelImportance;
@property(nonatomic,retain) IBOutlet UIPickerView *pickerImportance;
@property(nonatomic,retain) IBOutlet UIToolbar *pickerToolbar;


@property(nonatomic,retain) IBOutlet UITableView *notePhotoURL;
@property(nonatomic,retain) IBOutlet UITableView *contactsAndToDos;


@property(nonatomic,retain) UIActionSheet *actionSheet;
@property(nonatomic,assign) BOOL openFlag;
@property (nonatomic, retain) NSMutableArray *sectionInfoArray;// include all sectionHeaderView

-(void)hiddenPickerImportance:(BOOL)hidden;

-(IBAction)labelImportanceClicked:(id)sender;
-(IBAction)labelImportanceDone:(id)sender;
-(IBAction)pickerToolbarDoneClicked:(id)sender;

- (NSString *)dataFilePath;
-(void)databaseInit;

-(IBAction)editButtonClicked:(id)sender;
-(IBAction)doneButtonClicked:(id)sender;
-(IBAction)cancelButtonClicked:(id)sender;

-(void)showDoneAndCancelButton;
-(void)showBackAndEdit;

-(void)hiddenLineAndButtons:(BOOL)hidden;
-(void)textFieldDone;
-(void)saveDataToDB;

-(void)viewToUp:(CGFloat)VIEW_UP;

@end
