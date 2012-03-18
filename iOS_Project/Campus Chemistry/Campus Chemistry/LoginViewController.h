//
//  LoginViewController.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UIView *loginView;
//@property (strong, nonatomic) IBOutlet UINavigationController *loginNavigationController;
@property (nonatomic, retain) IBOutlet UITextField *usernameText;
@property (nonatomic, retain) IBOutlet UITextField *passwordText;

-(IBAction)loginButtonPressed:(id)sender;
- (IBAction)registerButtonPressed:(id)sender;

-(IBAction)userDoneEnteringText:(id)sender;

@end
