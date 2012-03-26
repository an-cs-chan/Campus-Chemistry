//
//  ProfileInfo.h
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"
#import "AppDelegate.h"

@class EditInfoViewController;

@interface ProfileInfoViewController : UIViewController{
    IBOutlet UIView *profileInfo;
    UILabel *lbluserName;
    UILabel *lblGender;
    UILabel *lblSeeking;
    UILabel *lblAge;
    UILabel *lblRType;
    UILabel *lblEthnicity;
    UILabel *lblBCountry;
    UILabel *lblFaculty;
    UILabel *lblDepartment;
    NSMutableArray *profiles;
    AppDelegate *returnUser;
}

@property (strong, nonatomic) EditInfoViewController *editInfo;

@property (nonatomic,retain) IBOutlet UILabel *lbluserName, *lblGender, *lblSeeking, *lblAge, *lblRType,*lblEthnicity, *lblBCountry, *lblFaculty, *lblDepartment;


@end
