//
//  DateViewController.h
//  Campus Chemistry
//
//  Created by David Harms on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Date.h"
#import "CustomCell.h"
#import "AppDelegate.h"


@interface DateViewController : UITableViewController
{
    NSMutableArray *responseData;
    NSMutableArray *dates;
    AppDelegate *appDelegate;
}

@end
