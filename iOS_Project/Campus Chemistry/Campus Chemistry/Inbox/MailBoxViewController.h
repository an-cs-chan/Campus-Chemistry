//
//  tFirstViewController.h
//  tabbedapp
//
//  Created by Inderjeet Singh on 12-03-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InboxViewController;
@class SentViewContoller;
@class ComposeViewController;


@interface MailBoxViewController : UITableViewController

@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) InboxViewController *tableInbox;
@property (strong, nonatomic) SentViewContoller *tableSentMessages;
@property (strong, nonatomic) ComposeViewController *composeform;

// CHANGE BY JMAN
@property (strong, nonatomic) UINavigationController *navigationController;

@end
