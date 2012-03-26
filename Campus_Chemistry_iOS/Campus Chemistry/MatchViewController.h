//
//  MatchViewController.h
//  Campus Chemistry
//
//  Created by David Harms on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Match.h"
#import "CustomCell.h"
#import "AppDelegate.h"

@class DateRequestViewController;

@interface MatchViewController : UITableViewController
{
    NSMutableData *responseData;
    NSMutableArray *matches;
    AppDelegate *appDelegate;
}

@property (strong, nonatomic) DateRequestViewController *requestView;

@end
