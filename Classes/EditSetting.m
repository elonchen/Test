//
//  EditSetting.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditSetting.h"
#import "Constants.h"

@implementation EditSetting
@synthesize settingDao;
@synthesize setting;
//@synthesize  settingView;
@synthesize  SHCell,SCTDCell;

- (void)viewDidLoad {
	[super viewDidLoad];
	
//	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
//	temporaryBarButtonItem.title = @"Meetings";
//	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
//	[temporaryBarButtonItem release];
	
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(doneButtonClicked:)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	self.view.backgroundColor = [Constants backgroundColor];
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
	settingDao = [[SettingDao alloc] init];
	setting = [settingDao selectTypeValueWithTypeName:@"showCompletedToDos"];
	
	SCTDCell.labelName.font = [UIFont systemFontOfSize:16.0];
	SCTDCell.labelName.text = @"Show Completed To Dos";
	[SCTDCell.switchName setOn:[@"1" isEqualToString:setting.typeValue]];
	
	//[SCTDCell.switchName setOn:YES];
}

-(IBAction)doneButtonClicked:(id)sender{	
	settingDao = [[SettingDao alloc] init];
	[settingDao updateWithTypeName:@"showCompletedToDos" TypeValue:SCTDCell.switchName.on?@"1":@"0"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"SettingCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (indexPath.section == 0) {
		if (SHCell == nil) {
			NSArray *array =[[NSBundle mainBundle] loadNibNamed:@"ShowHintsCell" 
														  owner:self
														options:nil];
			
			cell=[array objectAtIndex:0]; 
			SHCell=(ShowHintsCell *)cell;
			
			[SHCell retain];//So it will not be dealloced
		}
		else {
			cell=SHCell;
		}			
	}
	else if(indexPath.section == 1){
		if (SCTDCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"StatusCell" // not StarsEndsCell
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			SCTDCell = (StatusCell *)cell;
			[SCTDCell retain];
		}else {
			cell = SCTDCell;
		}		
		return cell;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 44.0;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
