//
//  Login.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Login.h"

@implementation Login

@synthesize usernameText;
@synthesize passwordText;

@synthesize username;
@synthesize password;

@synthesize loginViewController;

-(IBAction)login:(id)sender
{
    Login *login = [[Login alloc] initWithNibName:@"Login" bundle:[NSBundle mainBundle]];
    //[login setDelegate:self];
    [self setLoginViewController:login];
    
    [self presentModalViewController:loginViewController animated:YES];
}

-(IBAction)loginButtonPressed:(id)sender
{     
    username = [[NSString alloc] initWithFormat:(usernameText.text)];
    password = [[NSString alloc] initWithFormat:(passwordText.text)];
    
    username = usernameText.text;
    password = passwordText.text;

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
