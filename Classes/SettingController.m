//
//  SettingController.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingController.h"
#import "EditSetting.h"
#import "Constants.h"

@implementation SettingController
@synthesize settingView;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.settingView.backgroundColor = [Constants backgroundColor];
	//self.settingView.separatorColor = [Constants tableLineColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *) tableView{
	return 1;
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *CellIdentifier = @"EditSettingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"EditSetting" // not StarsEndsCell
													 owner:self
												   options:nil];
		cell=[array objectAtIndex:0];
		cell=(EditSetting *)cell;
		//cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath{
	return 72.0;
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
