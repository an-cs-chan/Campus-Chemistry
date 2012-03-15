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
@synthesize passwordText;
@synthesize username;
@synthesize password;


-(IBAction)loginButtonPressed:(id)sender
{     
    //NSString *username = usernameText.text;
    //NSString *password = passwordText.text;
    
}

-(IBAction)registerButtonPressed:(id)sender
{
    //registerView = [[RegisterView alloc] initWithNibName:@"ReigsterView" bundle:nil];
    //[self.view addSubview:registerView.view];
}

-(void) touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event
{
    
    [usernameText resignFirstResponder];
    [passwordText resignFirstResponder];
    
    [super touchesBegan:touches withEvent:event];
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
