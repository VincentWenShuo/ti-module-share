/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"

@interface StringProvider : UIActivityItemProvider
{
}
@property       NSString *_facebookString;
@property       NSString *_twitterString;
@property       NSString *_smsString;
@property       NSString *_mailString;
@end

@interface MaCarTiModuleShareModule : TiModule 
{
}

@end