//
//  MainViewController.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"

@implementation MainViewController

@synthesize usernameText;
@synthesize logPasswordText;
@synthesize emailText;
@synthesize regPasswordText;
@synthesize confirmText;

@synthesize username;
@synthesize logPassword;
@synthesize email;
@synthesize regPassword;
@synthesize confirm;


-(IBAction)loginButtonPressed:(id)sender
{     
    username = [[NSString alloc] initWithFormat:(usernameText.text)];
    logPassword = [[NSString alloc] initWithFormat:(logPasswordText.text)];
    
    username = usernameText.text;
    logPassword = logPasswordText.text;

    
}

-(IBAction)registerButtonPressed:(id)sender
{

    
}

-(IBAction)logoutButtonPressed:(id)sender
{
    
    
}

-(IBAction)userDoneEnteringText:(id)sender
{
    [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
