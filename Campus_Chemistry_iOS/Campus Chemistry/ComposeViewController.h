//
//  ComposeViewController.h
//  
//
//  Created by Inderjeet Singh on 12-03-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"
#import "AppDelegate.h"

@interface ComposeViewController : UIViewController <UITextViewDelegate> {
    UITextView *messagefull;
    NSString *emailinfo;
    AppDelegate *returnUser;
    
}

@property (retain, nonatomic) NSString *emailinfo; // fro string the value of emailid sent from DetailViewController

@property (retain, nonatomic) IBOutlet UITextField *emailid;

@property (retain, nonatomic) IBOutlet UITextView *messagefull;

- (IBAction)sendmessagebutton:(id)sender;

- (IBAction)userDoneEditing:(id)sender;

- (BOOL)sendmessage:(NSString *)toemail:(NSString *)fromemail:(NSString *)message ;

- (BOOL) validateEmail: (NSString *) candidate;

- (void) assignEmail: (NSString *) emaildetail;

@end
