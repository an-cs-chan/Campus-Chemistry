//
//  DateRequestViewController.m
//  Campus Chemistry
//
//  Created by David Harms on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DateRequestViewController.h"
#import "DateRequest2ViewController.h"
#import "AppDelegate.h"
#import "Match.h"

@implementation DateRequestViewController

@synthesize dateRequest2ViewController;
@synthesize label;
@synthesize nextBtn;
@synthesize user;
@synthesize datePick;

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

- (IBAction)nextButtonPressed:(id)sender
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    self.dateRequest2ViewController = [[DateRequest2ViewController alloc] initWithNibName:@"DateRequest2ViewController" bundle:nil];
    [self.dateRequest2ViewController setUser:self.user];
    [self.dateRequest2ViewController setDate:[format stringFromDate:[datePick date]]];
    [delegate.quizNavController pushViewController:self.dateRequest2ViewController animated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{  
    [label setText: user.firstName];
    
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
