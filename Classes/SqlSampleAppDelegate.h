//SqlSampleAppDelegate.h
#import <UIKit/UIKit.h>

@class FMDatabase;

@interface SqlSampleAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	FMDatabase *db;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) FMDatabase *db;

- (BOOL)initDatabase;
- (void)closeDatabase;

@end
