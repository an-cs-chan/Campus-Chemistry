//
//  ProfilePhoto.h
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"
#import "AppDelegate.h"

@class EditPhotoViewController;

@interface ProfilePhotoViewController : UIViewController{
    IBOutlet UIImageView *profilePhoto;
    NSMutableArray *profiles;
    AppDelegate *returnUser;
}


@property (strong, nonatomic) EditPhotoViewController *editPhoto;

@end
