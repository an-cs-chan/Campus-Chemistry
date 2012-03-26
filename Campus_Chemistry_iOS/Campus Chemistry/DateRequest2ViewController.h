//
//  DateRequest2ViewController.h
//  Campus Chemistry
//
//  Created by David Harms on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class Match;

@interface DateRequest2ViewController : UIViewController

@property (nonatomic, retain) Match *user;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) IBOutlet UITextView *msg;
@property (nonatomic, retain) IBOutlet UIButton *sendBtn;
@property (nonatomic, retain) IBOutlet UITextField *time;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) AppDelegate *appDelegate;

- (IBAction)sendClicked:(id)sender;
- (IBAction)userDoneEditing:(id)sender;

@end
