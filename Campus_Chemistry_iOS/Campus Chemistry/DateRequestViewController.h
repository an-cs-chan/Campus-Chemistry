//
//  DateRequestViewController.h
//  Campus Chemistry
//
//  Created by David Harms on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DateRequest2ViewController;
@class Match;

@interface DateRequestViewController : UIViewController

@property (nonatomic, retain) DateRequest2ViewController *dateRequest2ViewController;
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UIButton *nextBtn;
@property (nonatomic, retain) IBOutlet UIDatePicker *datePick;
@property (nonatomic, retain) Match *user;

- (IBAction)nextButtonPressed:(id)sender;

@end
