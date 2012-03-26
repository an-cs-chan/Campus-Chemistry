//
//  SearchViewController.h
//  Campus Chemistry
//
//  Created by Melissa Kendall on 12-03-18.
//  Copyright (c) 2012 University of Manitoba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "Person.h"
#import "SearchOptionViewController.h"

@class AppDelegate;

@interface SearchViewController : UITableViewController {
    
    IBOutlet UIView *search;
    NSMutableData *responseData;
    NSMutableArray *people;
    AppDelegate *appDelegate;
}

@end


