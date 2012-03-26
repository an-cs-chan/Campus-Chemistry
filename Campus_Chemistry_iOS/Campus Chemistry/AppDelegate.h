//
//  AppDelegate.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    IBOutlet UIWindow *window;
    IBOutlet UIViewController *loginViewController;
    IBOutlet UITabBarController *userViewTabController;
    
    IBOutlet UINavigationController *searchNavController;
    IBOutlet UINavigationController *profileNavController;
    IBOutlet UINavigationController *quizNavController;
    IBOutlet UINavigationController *mailBoxNavController;
    IBOutlet UINavigationController *loginNavController;
    
    NSMutableArray *quizQuestions;
    NSString *searchParams;
    NSString *userID;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet UITabBarController *userViewTabController;
@property (strong, nonatomic) IBOutlet UIViewController *loginViewController;
@property (strong, nonatomic) IBOutlet UINavigationController *searchNavController;
@property (strong, nonatomic) IBOutlet UINavigationController *profileNavController;
@property (strong, nonatomic) IBOutlet UINavigationController *quizNavController;
@property (strong, nonatomic) IBOutlet UINavigationController *mailBoxNavController;
@property (strong, nonatomic) IBOutlet UINavigationController *loginNavController;

@property (nonatomic, retain) NSMutableArray *quizQuestions;
@property (nonatomic, retain) NSString *searchParams;



- (void)assignUser:(NSString *)userEmail;
- (NSString *)getUserEmail;

@end
