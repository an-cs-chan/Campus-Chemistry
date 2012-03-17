//
//  LoginViewController.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    IBOutlet UITextField *usernameText;
    IBOutlet UITextField *passwordText;
}

@property (nonatomic, retain) IBOutlet UITextField *usernameText;
@property (nonatomic, retain) IBOutlet UITextField *passwordText;

-(IBAction)loginButtonPressed:(id)sender;

@end
