//
//  Constants.h
//  TradeShowInfo
//
//  Created by Elon on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define backgroundColorR		245.0
#define backgroundColorG		221.0
#define backgroundColorB		102.0
#define backgroundColorAlpha	1.0

#define textOrangeColorR			183.0
#define textOrangeColorG			79.0
#define textOrangeColorB			16.0
#define textOrangeColorAlpha		1.0

#define textBrownColorR			104.0
#define textBrownColorG			57.0
#define textBrownColorB			2.0
#define textBrownColorAlpha		1.0

#define labelLineColorR			158.0
#define labelLineColorG			158.0
#define labelLineColorB			154.0
#define labelLineColorAlpha		1.0

#define searchBarColorR			169.0
#define searchBarColorG			80.0
#define searchBarColorB			33.0
#define searchBarColorAlpha		1.0

#define headerViewTopColorR		130.0
#define headerViewTopColorG		81.0
#define headerViewTopColorB		5.0
#define headerViewTopColorAlpha	1.0

#define headerViewDownColorR		104.0
#define headerViewDownColorG		57.0
#define headerViewDownColorB		2.0
#define headerViewDownColorAlpha	1.0

#define tableLineColorR 185.0
#define tableLineColorG 167.0
#define tableLineColorB 112.0
#define tableLineColorAlpha 1.0

#define placeholderColorR			185.0
#define placeholderColorG			185.0
#define placeholderColorB			185.0
#define placeholderColorAlpha		1.0

#define labelTextFontSize		12.0

@interface Constants : NSObject {

}
+(UIColor *)backgroundColor;
+(UIColor *)labelTextColor;
+(UIColor *)labelLineColor;
+(UIColor *)tableLineColor;
+(UIColor *)editLabelTextColor;
+(UIColor *)placeholderColor;
@end
