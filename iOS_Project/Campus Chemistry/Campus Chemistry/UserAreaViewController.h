//
//  UserAreaViewController.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "Quiz/QuizViewController.h"

@interface UserAreaViewController : UITabBarController
{
    UIViewController *profileViewController;
    //QuizViewController *quizViewController;
    UIViewController *searhViewController;
}
@property (retain, nonatomic) IBOutlet UIViewController *profileViewController;
//@property (retain, nonatomic) IBOutlet QuizViewController *quizViewController;


-(IBAction)logoutButtonPressed:(id)sender;


@end
