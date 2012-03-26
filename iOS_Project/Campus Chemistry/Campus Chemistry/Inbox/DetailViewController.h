//
//  DetailViewController.h
//  Showing the complete message
//
//  Created by Inderjeet Singh on 12-03-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ComposeViewController;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong,nonatomic) ComposeViewController *composeform;

@property (unsafe_unretained, nonatomic) IBOutlet UITextView *detailDescriptionLabel;

@property (retain, nonatomic) NSString *emaildetail;
@property (strong, nonatomic) NSString *messagedetail;

- (IBAction)replymessagebutton:(id)sender;

@end
