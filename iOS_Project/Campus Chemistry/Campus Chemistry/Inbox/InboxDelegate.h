//
//  InboxDelegate.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>

@class InboxViewController;

@interface InboxDelegate : UIResponder <UINavigationControllerDelegate>
{
    UINavigationController *navigationController;
    InboxViewController *inboxViewController;
}

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIWindow *window;

- (void)CreateInboxNavControl;

@end
