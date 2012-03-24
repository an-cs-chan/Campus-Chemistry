//
//  AppDelegate.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginViewController;
@class RegisterViewController;
@class SearchViewController;
@class ProfileViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *navigationController;
    
    NSString *userID;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) LoginViewController *loginViewController;

- (void)assignUser:(NSString *)userEmail;
- (NSString *)getUserEmail;

@end
