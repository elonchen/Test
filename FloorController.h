//
//  FloorController.h
//  TradeShowInfo
//
//  Created by Bright Creek on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FloorController : UIViewController {
	NSMutableArray *companiesArray;
	NSMutableArray *sortedArray;
}

@property (nonatomic, retain) NSMutableArray *companiesArray;
@property (nonatomic, retain) NSMutableArray *sortedArray;

-(IBAction)compOnSort:(id)sender;
@end
