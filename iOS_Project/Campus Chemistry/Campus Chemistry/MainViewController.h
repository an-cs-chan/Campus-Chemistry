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
    IBOutlet UIViewController *loginView;
    
    IBOutlet UITextField *usernameText;
    IBOutlet UITextField *passwordText;
    
    NSString *username;
    NSString *password;
}

@property (nonatomic, retain) IBOutlet UITextField *usernameText;
@property (nonatomic, retain) IBOutlet UITextField *passwordText;

@property (nonatomic, copy) IBOutlet NSString *username;
@property (nonatomic, copy) IBOutlet NSString *password;


-(IBAction)loginButtonPressed:(id)sender;
-(IBAction)registerButtonPressed:(id)sender;
-(void) touchesBegan:(UIEvent *)event;


@end
