//
//  InboxDelegate.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InboxDelegate.h"
#import "InboxViewController.h"

@implementation InboxDelegate

@synthesize navigationController;
@synthesize window = _window;

- (void)CreateInboxNavControl
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *tempNavi = [[UINavigationController alloc] initWithRootViewController:inboxViewController];
    [tempNavi setNavigationBarHidden:NO];
    
    navigationController = tempNavi;
    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
       
}

@end
