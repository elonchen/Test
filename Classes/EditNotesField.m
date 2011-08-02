//
//  EditNotesField.m
//  TradeShowInfo
//
//  Created by Bright Creek on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditNotesField.h"
#import "Constants.h"

@implementation EditNotesField
@synthesize noteCell;
@synthesize keyboardToolbar;
@synthesize editNote;

-(void)viewDidLoad{
	[super viewDidLoad];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(doneButtonClicked:)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	self.view.backgroundColor = [Constants backgroundColor];

	//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];	
}

- (IBAction)dismissKeyboard:(id)sender
{
	[self dispearAllTextfield];
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
		
	noteCell.notesCell.textView.text = editNote;
	noteCell.notesCell.textView.editable = NO;
}

-(IBAction)doneButtonClicked:(id)sender{
	//UIBarButtonItem *temp = (UIBarButtonItem)sender;
	
	if (noteCell.notesCell.textView.editable == FALSE) {
		self.navigationItem.rightBarButtonItem.title = @"Done";
		noteCell.notesCell.textView.editable = YES;
		[noteCell.notesCell.textView becomeFirstResponder];
	}else {
		self.navigationItem.rightBarButtonItem.title = @"Edit";
		noteCell.notesCell.textView.editable = NO;
		
		editNote = noteCell.notesCell.textView.text;
		[editNote retain];
		
		[noteCell.notesCell.textView resignFirstResponder];
	}
}

-(IBAction)backButtonClicked:(id)sender{
	//[self.];
}

- (void)dispearAllTextfield{
	[noteCell.notesCell.textView resignFirstResponder];
}

- (void)keyboardWillShow:(NSNotification *)notification
{
	UIViewAnimationCurve animationCurve	= [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];		
	
	if(nil == keyboardToolbar) {
		keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,44)];
		keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
		keyboardToolbar.tintColor = [UIColor darkGrayColor];
		
		UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissKeyboard:)];
		UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
		
		NSArray *items = [[NSArray alloc] initWithObjects:flex, barButtonItem, nil];
		[keyboardToolbar setItems:items];
		
		[barButtonItem release];
		[flex release];
		[items release];					
	}			
	
	CGFloat x=0.0;
	CGFloat y=self.view.frame.size.height - 196.0;
	keyboardToolbar.frame = CGRectMake(x, 
									   y, 
									   keyboardToolbar.frame.size.width, 
									   keyboardToolbar.frame.size.height);
	NSLog(@"%f,%f,%f,%f",x,y,keyboardToolbar.frame.size.width,keyboardToolbar.frame.size.height);
	
	[self.view.window addSubview:keyboardToolbar];		
	
	[UIView beginAnimations:@"RS_showKeyboardAnimation" context:nil];	
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	
	keyboardToolbar.alpha = 1.0;	
	
	[UIView commitAnimations];		
	
	keyboardToolbarShouldHide = YES;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
	if (nil == keyboardToolbar || !keyboardToolbarShouldHide) {
		return;
	}	
	
	CGPoint endCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterEndUserInfoKey] CGPointValue];
	CGRect keyboardBounds = [[[notification userInfo] valueForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
	UIViewAnimationCurve animationCurve	= [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];	
	
	[UIView beginAnimations:@"RS_hideKeyboardAnimation" context:nil];	
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	
	
	keyboardToolbar.alpha = 0.0;
	keyboardToolbar.frame = CGRectMake(endCentre.x - (keyboardBounds.size.width/2), 
									   endCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height,
									   keyboardToolbar.frame.size.width, 
									   keyboardToolbar.frame.size.height);
	
	[UIView commitAnimations];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"EditNotesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if(indexPath.section == 0){
		if (noteCell == nil) {
			NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"NoteCell" 
														 owner:self
													   options:nil];
			cell=[array objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			noteCell = (NoteCell *)cell;
			[noteCell retain];
		}else {
			cell = noteCell;
		}
		return cell;
	}

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 400.0;
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
