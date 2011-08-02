//
//  CalendarController.m
//  TradeShowInfo
//
//  Created by Bright Creek on 3/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarController.h"

static NSString *kCPnameKey = @"kCPnameKey";
static NSString *kCPBoothNumKey = @"kCPBoothNumKey";
static NSString *kCPImportanceKey = @"kCPImportanceKey";

@implementation CalendarController
@synthesize itineraryArray;

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.itineraryArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
									@"aGoogle", kCPnameKey,
									@"", kCPBoothNumKey,
									@"4",kCPImportanceKey,
									nil]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.itineraryArray = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
