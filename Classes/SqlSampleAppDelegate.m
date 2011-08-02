#import "SqlSampleAppDelegate.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
//#import "NoteController.h"

@implementation SqlSampleAppDelegate

@synthesize window;
@synthesize db;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	if (![self initDatabase]){
		NSLog(@"Failed to init Database.");
	}
	//NoteController *ctrl = [[NoteController alloc] initWithNibName:nil bundle:nil];
	//[window addSubview:ctrl.view];
	//[window makeKeyAndVisible];
}

- (BOOL)initDatabase{
	BOOL success;
	NSError *error;
	NSFileManager *fm = [NSFileManager defaultManager];
	NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"data.sqlite3"];
	NSLog(@"writableDBPath %@", writableDBPath);
	success = [fm fileExistsAtPath:writableDBPath];
	
//	if ([fm removeItemAtPath:writableDBPath error:&error] != YES)
//		NSLog(@"Unable to delete file: %@", [error localizedDescription]);
//	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"data.sqlite3"];
//	success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
	
	if(!success){
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"data.sqlite3"];
		success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
		if(!success){
			NSLog([error localizedDescription]);
		}
		//success = NO;
	}
	if(success){
		db = [[FMDatabase databaseWithPath:writableDBPath] retain];
		if ([db open]) {
			[db setShouldCacheStatements:YES];
		}else{
			NSLog(@"Failed to open database.");
			success = NO;
		}
	}
	return success;
}

- (void) closeDatabase{
	[db close];
}

- (void)dealloc {
	[db release];
	[window release];
	[super dealloc];
}

@end