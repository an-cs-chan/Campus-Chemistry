//
//  UserAreaViewController.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserAreaViewController.h"

@implementation UserAreaViewController
@synthesize profileViewController;
//@synthesize quizViewController;


- (IBAction)logoutButtonPressed:(id)sender
{
    [self.view removeFromSuperview];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        /*if(self.quizViewController == nil)
        {
            QuizViewController *quizView = [[QuizViewController alloc] initWithNibName:@"Quiz/QuizViewController" bundle:nil];
            [self presentModalViewController:quizViewController animated:YES];
            self.quizViewController = quizView;
            
            self.selectedViewController = quizView;
            
        }*/
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setProfileViewController:nil];
    //[self setQuizViewController:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
