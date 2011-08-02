//
//  copyrightController.m
//  TradeShowInfo
//
//  Created by brightcreek on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "copyrightController.h"
#import "Constants.h"
@implementation copyrightController

-(void)viewDidLoad{
	self.view.backgroundColor = [Constants backgroundColor];
	NSString *copyright = @"Copyright(c) 2010 PSK Operating LLC. All Rights Reserved.\n\nNo part of this product or program may be reproduced in any form, or by any means whatsoever, without the written permission of PSK Operating LLC. Patent Pending.\n\n\n\n\n\n\n\n\n\n\n\n\n";
	textLabel.text = copyright;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
	[textLabel release];
}


@end
