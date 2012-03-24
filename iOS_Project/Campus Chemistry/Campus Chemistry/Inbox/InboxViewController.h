//
//  InboxViewController.h
//  tabbedapp
//
//  Created by Inderjeet Singh on 12-03-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface InboxViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewInbox;
@property (strong, nonatomic) NSArray *dataArray;

@end
