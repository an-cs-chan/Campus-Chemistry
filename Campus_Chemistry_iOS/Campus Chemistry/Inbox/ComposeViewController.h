//
//  Compose.h
//  tabbedapp
//
//  Created by Inderjeet Singh on 12-03-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ComposeViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *emailid;

@property (retain, nonatomic) IBOutlet UITextField *message;

- (IBAction)sendmessage:(id)sender;
- (IBAction)userDoneEditing:(id)sender;

@end
