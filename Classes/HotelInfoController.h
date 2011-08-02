//
//  HotelInfoController.h
//  TradeShowInfo
//
//  Created by Bright Creek on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HotelInfoController : UIViewController <UITableViewDelegate,UITableViewDataSource>{
	
	UITextField		*hotelName;
	UITextField		*hotelAddress;
	UITextField		*hotelMobile;
	UITextField		*hotelNotes;
	UITextField		*hotelHomePage;

	NSMutableArray *menuArray;
	
}
@property (nonatomic, retain, readonly) UITextField	*hotelName;
@property (nonatomic, retain, readonly) UITextField	*hotelAddress;
@property (nonatomic, retain, readonly) UITextField	*hotelMobile;
@property (nonatomic, retain, readonly) UITextField	*hotelNotes;
@property (nonatomic, retain, readonly) UITextField	*hotelHomePage;

@property (nonatomic, retain) NSMutableArray *menuArray;

@end
