//
//  InboxViewController.h
//  TableView for browsing the Received messages
//
//  Created by Inderjeet Singh on 12-03-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "AppDelegate.h"


@class DetailViewController;

@interface InboxViewController : UITableViewController{

    AppDelegate *returnUser;
}

@property (strong, nonatomic) DetailViewController *detailViewInbox;

@property (strong, nonatomic) NSMutableArray *inboxmessage;


@end
