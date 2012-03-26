//
//  BlindDateViewController.h
//  Campus Chemistry
//
//  Created by David Harms on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MatchViewController;
@class DateViewController;

@interface BlindDateViewController : UITableViewController

@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) MatchViewController *matchView;
@property (strong, nonatomic) DateViewController *dateView;

@end
