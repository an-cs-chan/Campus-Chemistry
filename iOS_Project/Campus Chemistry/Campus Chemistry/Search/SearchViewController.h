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
#import "AppDelegate.h"

@interface SearchViewController : UITableViewController {
    
    IBOutlet UIView *search;
    NSMutableData *responseData;
    NSMutableArray *people;
    AppDelegate *appDelegate;
    
}

// CHANGED BY JMAN
@property (nonatomic, strong) UINavigationItem *naviItem;
@property (nonatomic, strong) UINavigationController *navigationController;

@property (nonatomic, retain) SearchOptionViewController *searchOptionViewController;

@end


