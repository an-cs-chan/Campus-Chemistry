//
//  RegisterViewController.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

@interface RegisterViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>
{
    AppDelegate *appDelegate;
}
@property (nonatomic, retain) IBOutlet UITextField *emailText;
@property (nonatomic, retain) IBOutlet UITextField *passwordText;
@property (nonatomic, retain) IBOutlet UITextField *confirmText;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UITextField *activeTextField;

- (IBAction)registerButtonPressed:(id)sender;

@end
