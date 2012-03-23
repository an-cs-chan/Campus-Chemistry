//
//  LoginViewController.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Register/RegisterViewController.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>
{
    AppDelegate *appDelegate;
    
    InboxViewController *inboxViewController;
    RegisterViewController *registerViewController;
    //QuizViewController *quizViewController;
    SearchViewController *searchViewController;
    ProfileViewController *profileViewController;
    
    UITabBarController *userTabController;
    
    UITextField *activeTextField;
    BOOL keyboardShown;
    BOOL viewMoved;
}

@property (nonatomic, retain) IBOutlet UITextField *usernameText;
@property (nonatomic, retain) IBOutlet UITextField *passwordText;

@property (nonatomic, retain) RegisterViewController *registerViewController;
@property (nonatomic, retain) InboxViewController *inboxViewController;
//@property (nonatomic, retain) QuizViewController *quizViewController;
@property (nonatomic, retain) SearchViewController *searchViewController;
@property (nonatomic, retain) ProfileViewController *profileViewController;

@property (strong, nonatomic) UITabBarController *userTabController;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;



- (IBAction)loginButtonPressed:(id)sender;
- (IBAction)registerButtonPressed:(id)sender;

- (IBAction)userDoneEditing:(id)sender;


@end


