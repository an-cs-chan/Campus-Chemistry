//
//  ProfilePhoto.h
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditPhotoViewController;

@interface ProfilePhotoViewController : UIViewController

@property (strong, nonatomic) EditPhotoViewController *editphoto;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
