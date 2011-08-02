//
//  Baseview.m
//  TradeShowInfo
//
//  Created by brightcreek on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Baseview.h"


@implementation Baseview

@synthesize datePickerView;
@synthesize actionSheet;
@synthesize showDateFormatter;
@synthesize dbDateFormatter;
@synthesize converDate;
@synthesize converResult;
@synthesize arrayImportance;
@synthesize showTimeFormatter;
@synthesize dbTimeFormatter;


- (int)getIndex{
	return index;
}

- (void)setIndex : (int) newIndex{
	index = newIndex;
}

- (void)viewDidLoad{
	[super viewDidLoad];
	
	showDateFormatter=[[NSDateFormatter alloc] init];
	[showDateFormatter setDateFormat:@"MMM dd, yyyy"];
	
	dbDateFormatter=[[NSDateFormatter alloc] init];
	[dbDateFormatter setDateFormat:@"yyyy-MM-dd"];
	//NSLog(@"test base view");
	
	dbTimeFormatter=[[NSDateFormatter alloc] init];
	[dbTimeFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	
	showTimeFormatter=[[NSDateFormatter alloc] init];
	[showTimeFormatter setDateFormat:@"ccc, MMM dd hh:mm a"];
	
	arrayImportance=[[NSMutableArray alloc] init];
	for (int i=1;i<=10 ; i++) {
		[arrayImportance addObject:[NSString stringWithFormat:@"%d",i]];
	}
}

-(NSString *)converStrToShowDateFomart:(NSString *)dateStr{

	converDate = [dbDateFormatter dateFromString:dateStr];
	converResult = [showDateFormatter stringFromDate:converDate];
	
	return converResult;
}

-(NSString *)converStrToDBDateFomart:(NSString *)dateStr{
	
	converDate = [showDateFormatter dateFromString:dateStr];
	converResult = [dbDateFormatter stringFromDate:converDate];
	
	return converResult;
}

-(NSString *)converStrToShowTimeFomart:(NSString *)dateStr{
	
	converDate = [dbTimeFormatter dateFromString:dateStr];
	converResult = [showTimeFormatter stringFromDate:converDate];
	return converResult;
}

-(NSString *)converStrToDBTimeFomart:(NSString *)dateStr{
	
	converDate = [showTimeFormatter dateFromString:dateStr];
	converResult = [dbTimeFormatter stringFromDate:converDate];

	return converResult;
}

-(void)viewToUp:(CGFloat)VIEW_UP{
	NSTimeInterval animationDuration = 0.30f;
	[UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
	[UIView setAnimationDuration:animationDuration];
	float width = self.view.frame.size.width;
	float height = self.view.frame.size.height;
	CGRect rect = CGRectMake(0.0f,VIEW_UP,width,height);
	self.view.frame = rect;	
	[UIView commitAnimations];
}

-(void)ViewToDown{
	NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);	
    self.view.frame = rect;	
    [UIView commitAnimations];
}

- (void)showImportancePicker: (NSString *)importanceText{
	NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n\n" ;
	actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil 
								destructiveButtonTitle:nil otherButtonTitles:nil,  nil];
	
	
	UIPickerView *pickerB=[[[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 44.0, 0.0, 0.0)] autorelease];
	pickerB.autoresizingMask=UIViewAutoresizingFlexibleWidth;
	pickerB.showsSelectionIndicator = YES;
	pickerB.delegate=self;
	pickerB.dataSource=self;
	pickerB.tag = 101;
	[pickerB selectRow:[arrayImportance indexOfObject:importanceText] inComponent:0 animated:TRUE];
	
	UIToolbar *pickerDateToolbar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
	pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
	//[pickerDateToolbar sizeToFit];
	
	NSMutableArray *barItems = [[NSMutableArray alloc] init];
	

	UITextView *titleTextView = [[[UITextView alloc] initWithFrame:CGRectMake(50, 0, 250, 30)] autorelease];
    titleTextView.textColor = [UIColor whiteColor];
    titleTextView.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
	titleTextView.backgroundColor = [UIColor clearColor]; 
    titleTextView.text = @"                        1 is the most important";
	titleTextView.editable = FALSE;
	UIBarButtonItem *lableItem = [[UIBarButtonItem alloc] initWithCustomView:titleTextView];
	[barItems addObject:lableItem];

	
	UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	[barItems addObject:flexSpace];
	
	UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(PickerDoneClick:)];
	[barItems addObject:doneBtn];
	
	[pickerDateToolbar setItems:barItems animated:YES];
	
	
	[actionSheet showInView:self.view];
	[actionSheet addSubview:pickerDateToolbar];
	[actionSheet addSubview:pickerB];	
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [arrayImportance count];
}

-(void) PickerDoneClick:(id)sender{
	[actionSheet dismissWithClickedButtonIndex:0 animated:TRUE];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {	
    //NOT REACHED
    return 120;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [arrayImportance objectAtIndex:row];
}


- (void)dealloc {
	[datePickerView release];
	[showDateFormatter release];
	[dbDateFormatter release];
	[showTimeFormatter release];
	[dbTimeFormatter release];
	[actionSheet release];
	[converDate release];
	[converResult release];
	[arrayImportance release];
	//[sortIndex release];
	[super dealloc];
}

@end