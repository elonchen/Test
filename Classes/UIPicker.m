//
//  UIPicker.m
//  TradeShowInfo
//
//  Created by brightcreek on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIPicker.h"


@implementation UIPicker

+(void) showDataPicker{
	
//	NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n\n" ;
//	
//	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
//	[actionSheet showInView:self.view];
//	
//	
//	UIDatePicker *datePicker = [[[UIDatePicker alloc] initWithFrame:CGRectMake(0.0, 44.0, 0.0, 0.0)] autorelease];
//	datePicker.tag = 101;
//	datePicker.datePickerMode = UIDatePickerModeDate;//[(UISegmentedControl *)self.navigationItem.titleView selectedSegmentIndex];
//	
//	
//	UIToolbar *pickerDateToolbar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
//	pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
//	[pickerDateToolbar sizeToFit];			
//	NSMutableArray *barItems = [[NSMutableArray alloc] init];			
//	
//	
//	UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(DatePickerCancelClick)];
//	[barItems addObject:cancelBtn];
//	
//	UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
//	[barItems addObject:flexSpace];
//	
//	UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(DatePickerDoneClick)];
//	[barItems addObject:doneBtn];
//	[pickerDateToolbar setItems:barItems animated:YES];
//	
//	//	[aac addSubview:dtpicker];
//	[actionSheet showInView:self.view];
//	[actionSheet addSubview:pickerDateToolbar];
//	
//	[actionSheet addSubview:datePicker];
//	
//	//		NSDate *time = [dateFormatter dateFromString:TSEndDate];
//	//			datePicker.date = time;
//	//			[time release];
//	
//	[self viewToUp:-150];
}

@end
