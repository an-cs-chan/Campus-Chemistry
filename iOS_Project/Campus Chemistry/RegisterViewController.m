//
//  RegisterViewController.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RegisterViewController.h"

@implementation RegisterViewController
@synthesize emailText;
@synthesize passwordText;
@synthesize confirmText;
@synthesize userAreaViewController;

-(IBAction)registerButtonPressed:(id)sender
{
    if(self.userAreaViewController == nil)
    {
        UserAreaViewController *userAreaView = [[UserAreaViewController alloc] initWithNibName:@"UserAreaViewController" bundle:nil];
        [self presentModalViewController:userAreaView animated:YES];
        self.userAreaViewController = userAreaView;
        
        
    }
    
    
    
    [self.view removeFromSuperview];
    [self.view addSubview:userAreaViewController.view];

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    [self setEmailText:nil];
    [self setPasswordText:nil];
    [self setConfirmText:nil];    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self dismissModalViewControllerAnimated:YES];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end