//
//  LoginDelegate.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../Inbox/MailBoxViewController.h"
//#import "../Quiz/QuizViewController.h"
#import "../Search/SearchViewController.h"
#import "../Profile/ProfileViewController.h"

@interface LoginDelegate : NSObject
{
    /*MailBoxViewController *mailBoxViewController;
    //QuizViewController *quizViewController;
    SearchViewController *searchViewController;
    ProfileViewController *profileViewController;
    UITabBarController *userTabController;
    
    UITextField *activeTextField;
    BOOL keyboardShown;
    BOOL viewMoved;*/
}

@property (nonatomic, retain) MailBoxViewController *mailBoxViewController;
//@property (nonatomic, retain) QuizViewController *quizViewController;
@property (nonatomic, retain) SearchViewController *searchViewController;
@property (nonatomic, retain) ProfileViewController *profileViewController;

@property (strong, nonatomic) UITabBarController *userTabController;

- (void)setUpUserTabController:(UIViewController *)rootViewController;

@end
