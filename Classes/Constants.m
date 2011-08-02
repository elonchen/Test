//
//  Constants.m
//  TradeShowInfo
//
//  Created by Elon on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Constants.h"


@implementation Constants

+(UIColor *)backgroundColor{
	return [UIColor colorWithRed:backgroundColorR/255.0 green:backgroundColorG/255.0 blue:backgroundColorB/255.0 alpha:backgroundColorAlpha];
}

+(UIColor *)labelTextColor{
	return [UIColor colorWithRed:textBrownColorR/255.0 green:textBrownColorG/255.0 blue:textBrownColorB/255.0 alpha:textBrownColorAlpha];
}

+(UIColor *)labelLineColor{
	return [UIColor colorWithRed:labelLineColorR/255.0 green:labelLineColorG/255.0 blue:labelLineColorB/255.0 alpha:labelLineColorAlpha];
}

+(UIColor *)tableLineColor{
	return [UIColor colorWithRed:tableLineColorR/255.0 green:tableLineColorG/255.0 blue:tableLineColorB/255.0 alpha:tableLineColorAlpha];
}

+(UIColor *)editLabelTextColor{
	return [UIColor colorWithRed:textOrangeColorR/255.0 green:textOrangeColorG/255.0 blue:textOrangeColorB/255.0 alpha:textOrangeColorAlpha];
}

+(UIColor *)placeholderColor{
	return [UIColor colorWithRed:placeholderColorR/255.0 green:placeholderColorG/255.0 blue:placeholderColorB/255.0 alpha:placeholderColorAlpha];
}

@end

