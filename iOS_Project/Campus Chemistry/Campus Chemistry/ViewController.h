//
//  ViewController.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
//#import "UserAreaViewController.h"
#import "Quiz/QuizViewController.h"

@class RegisterViewController;
@class UserAreaViewController;


@interface ViewController : UIViewController <UITextFieldDelegate>
{
    RegisterViewController *registerViewController;
    UserAreaViewController *userAreaViewController;
    QuizViewController *quizViewController;
}

@property (nonatomic, retain) IBOutlet UITextField *usernameText;
@property (nonatomic, retain) IBOutlet UITextField *passwordText;

@property (nonatomic, retain) RegisterViewController *registerViewController;
@property (nonatomic, retain) UserAreaViewController *userAreaViewController;
@property (nonatomic, retain) QuizViewController *quizViewController;

- (IBAction)loginButtonPressed:(id)sender;
- (IBAction)registerButtonPressed:(id)sender;

- (IBAction)userDoneEnteringText:(id)sender;
- (IBAction)userEnteringText:(id)sender;

@end
