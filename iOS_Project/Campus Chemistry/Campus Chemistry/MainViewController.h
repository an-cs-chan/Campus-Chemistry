//
//  MainViewController.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{

    IBOutlet UITextField *emailText;
    IBOutlet UITextField *regPasswordText;
    IBOutlet UITextField *confirmText;
    
    NSString *username;
    NSString *logPassword;
    NSString *email;
    NSString *regPassword;
    NSString *confirm;
}

@property (nonatomic, retain) IBOutlet UITextField *usernameText;
@property (nonatomic, retain) IBOutlet UITextField *logPasswordText;
@property (nonatomic, retain) IBOutlet UITextField *emailText;
@property (nonatomic, retain) IBOutlet UITextField *regPasswordText;
@property (nonatomic, retain) IBOutlet UITextField *confirmText;

@property (nonatomic, copy) IBOutlet NSString *username;
@property (nonatomic, copy) IBOutlet NSString *logPassword;
@property (nonatomic, copy) IBOutlet NSString *email;
@property (nonatomic, copy) IBOutlet NSString *regPassword;
@property (nonatomic, copy) IBOutlet NSString *confirm;

-(IBAction)loginButtonPressed:(id)sender;
-(IBAction)registerButtonPressed:(id)sender;
-(IBAction)logoutButtonPressed:(id)sender;
-(IBAction)userDoneEnteringText:(id)sender;

@end
