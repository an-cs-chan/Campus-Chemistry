//
//  SentViewController.h
//  View for showing sent messages
//
//  Created by Inderjeet Singh on 12-03-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "AppDelegate.h"

@class DetailViewSentController;


@interface SentViewContoller : UITableViewController
{
     AppDelegate *returnUser;
    
}
@property (strong, nonatomic) DetailViewSentController *detailViewSent;
@property (strong, nonatomic) NSMutableArray *sentmessages;

@end
