//
//  LoginDelegate.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginDelegate.h"

@implementation LoginDelegate

@synthesize mailBoxViewController;
//@synthesize quizViewController;
@synthesize searchViewController;
@synthesize profileViewController;
@synthesize userTabController;

- (void)setUpUserTabController
{
    if(self.userTabController == nil)
    {
        self.userTabController = [[UITabBarController alloc] init];
        
        
        if(mailBoxViewController == nil)
        {
            MailBoxViewController *inboxView = [[MailBoxViewController alloc] initWithNibName:@"MailBoxViewController" bundle:nil];
            
            self.mailBoxViewController = inboxView;
        }
        
        /*if(quizViewController == nil)
         {            
         QuizViewController *quizView = [[QuizViewController alloc] initWithNibName:@"QuizViewController" bundle:nil];
         
         self.quizViewController = quizView;                                   
         }*/
        
        if(searchViewController == nil)
        {
            SearchViewController *searchView = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
            
            self.searchViewController = searchView;
        }
        
        if(profileViewController == nil)
        {
            ProfileViewController *profileView = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
            
            self.profileViewController = profileView;
        }
        
        self.userTabController.viewControllers = [NSArray arrayWithObjects: self.mailBoxViewController.navigationController, self.searchViewController.navigationController, self.profileViewController, nil];
        self.userTabController.selectedViewController = [self.userTabController.viewControllers objectAtIndex:0];
    }
}


@end
