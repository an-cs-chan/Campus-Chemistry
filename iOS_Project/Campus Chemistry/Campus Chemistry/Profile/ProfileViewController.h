//
//  ProfileViewController.h
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProfileInfoViewController;
@class ProfileInterestsViewController;
@class ProfilePhotoViewController;

@interface ProfileViewController : UITableViewController

@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) ProfileInfoViewController *info;
@property (strong, nonatomic) ProfilePhotoViewController *photo;
@property (strong, nonatomic) ProfileInterestsViewController *interests;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
