//
//  RegisterViewController.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserAreaViewController.h"

@interface RegisterViewController : UIViewController <UITextFieldDelegate>
{
    UserAreaViewController *userAreaViewController;
}
 
@property (nonatomic, retain) IBOutlet UITextField *emailText;
@property (nonatomic, retain) IBOutlet UITextField *passwordText;
@property (nonatomic, retain) IBOutlet UITextField *confirmText;

@property (nonatomic, retain) UserAreaViewController *userAreaViewController;

- (IBAction)registerButtonPressed:(id)sender;

@end
