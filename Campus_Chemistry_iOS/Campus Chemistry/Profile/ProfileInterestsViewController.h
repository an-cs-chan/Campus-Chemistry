//
//  ProfileInterests.h
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"
#import "AppDelegate.h"

@class EditInterestsViewController;

@interface ProfileInterestsViewController : UIViewController{
    IBOutlet UIView *profileInterests;
    UILabel *lblusername;
    UILabel *lblInterest1;
    UILabel *lblInterest2;
    UILabel *lblInterest3;
    UILabel *lblInterest4;
    UILabel *lblInterest5;
    UILabel *lblInterest6;
    NSMutableArray *profiles;
    NSMutableArray *array;
    AppDelegate *returnUser;
}

@property (strong, nonatomic) EditInterestsViewController *editInterests;

@property (nonatomic,retain) IBOutlet UILabel *lblusername, *lblInterest1,*lblInterest2, *lblInterest3, *lblInterest4, *lblInterest5, *lblInterest6;


@end
