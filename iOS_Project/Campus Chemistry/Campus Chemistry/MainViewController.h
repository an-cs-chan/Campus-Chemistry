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
    IBOutlet UITextField *usernameText;
    IBOutlet UITextField *logPasswordText;
    
    //NSString *username;
    //NSString *logPassword;
    //NSString *email;
    //NSString *regPassword;
    //NSString *confirm;
}

@property (nonatomic, retain) IBOutlet UITextField *usernameText;
@property (nonatomic, retain) IBOutlet UITextField *logPasswordText;
@property (nonatomic, retain) IBOutlet UITextField *emailText;
@property (nonatomic, retain) IBOutlet UITextField *regPasswordText;
@property (nonatomic, retain) IBOutlet UITextField *confirmText;

//@property (nonatomic, copy) NSString *username;
//@property (nonatomic, copy) NSString *logPassword;
//@property (nonatomic, copy) NSString *email;
//@property (nonatomic, copy) NSString *regPassword;
//@property (nonatomic, copy) NSString *confirm;

-(IBAction)loginButtonPressed:(id)sender;
-(IBAction)registerButtonPressed:(id)sender;
-(IBAction)logoutButtonPressed:(id)sender;
-(IBAction)userDoneEnteringText:(id)sender;

@end
