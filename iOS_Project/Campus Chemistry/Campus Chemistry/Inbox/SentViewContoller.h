//
//  sentmessages.h
//  tabbedapp
//
//  Created by Inderjeet Singh on 12-03-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface SentViewContoller : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewSent;
@property (strong, nonatomic) NSArray *dataArray;

@end
