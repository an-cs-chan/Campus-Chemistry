//
//  Login.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController
{
    Login *loginViewController;
    
    IBOutlet UITextField *usernameText;
    IBOutlet UITextField *passwordText;
}

@property (nonatomic, retain) IBOutlet UITextField *usernameText;
@property (nonatomic, retain) IBOutlet UITextField *passwordText;

@property (nonatomic, copy) IBOutlet NSString *username;
@property (nonatomic, copy) IBOutlet NSString *password;

@property(nonatomic, retain) Login *loginViewController;

-(IBAction)loginButtonPressed:(id)sender;
-(IBAction)login:(id)sender;

@end
