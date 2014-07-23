/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "MaCarTiModuleShareModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation MaCarTiModuleShareModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"10bab674-eff3-4471-a6c6-bd2eec441fc8";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ma.car.ti.module.share";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

-(id)share:(id)args
{
    KrollCallback* callback = [[args objectAtIndex:0] valueForKey:@"callback"];
    NSString* shareContent = [NSString stringWithFormat:@"%@", [[args objectAtIndex:0] valueForKey:@"text"]];
    //Create an activity view controller with the url container as its activity item. APLCustomURLContainer conforms to the UIActivityItemSource protocol.
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[shareContent] applicationActivities:nil];
    
    [activityViewController setCompletionHandler:^(NSString *activityType, BOOL completed) {
        NSLog(@"completed dialog - activity: %@ - finished flag: %d", activityType, completed);
        NSString* shareType = @"";
        if ([activityType isEqualToString:UIActivityTypePostToFacebook]) {
            shareType = @"facebook";
        }
        else if ([activityType isEqualToString:UIActivityTypePostToTwitter]) {
            shareType = @"twitter";
        }
        else if ([activityType isEqualToString:UIActivityTypeMail]) {
            shareType = @"mail";
        }
        else if ([activityType isEqualToString:UIActivityTypeMessage]) {
            shareType = @"message";
        }
        else {
            //return nil;
        }
        
        if(callback){
            NSDictionary* dict = [[[NSDictionary alloc] initWithObjectsAndKeys:@"SUCCESS", @"state", shareType, @"shareType", [NSNumber numberWithBool:completed], @"completed", nil] autorelease];
            NSArray* array = [NSArray arrayWithObjects: dict, nil];
            [callback call:array thisObject:nil];
        }
    }];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [[TiApp app].controller presentViewController:activityViewController animated:YES completion:nil];
    }
    
    return nil;
}

-(void)onCompletion:(id)args
{
    
}

@end
