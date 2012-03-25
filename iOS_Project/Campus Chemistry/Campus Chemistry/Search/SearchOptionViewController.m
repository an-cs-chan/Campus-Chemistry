//
//  SearchOptionViewController.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SearchOptionViewController.h"
#import "SearchViewController.h"
#import "AppDelegate.h"

@implementation SearchOptionViewController
@synthesize genderChoice;
@synthesize orientationChoice;
@synthesize minAge;
@synthesize maxAge;
@synthesize searchButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
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
    
    minAge.delegate = self;
    maxAge.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setGenderChoice:nil];
    [self setMinAge:nil];
    [self setMaxAge:nil];
    [self setSearchButton:nil];
    [self setOrientationChoice:nil];
    [self setOrientationChoice:nil];
    [self setGenderChoice:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL) textFieldShouldReturn: (UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)refineSearch:(id)sender 
{   
    NSString *min = [minAge text];
    NSString *max = [maxAge text];
    NSString *gender = @"Men/Women";
    NSString *orientation = @"Men/Women";
    NSInteger choice1 = [genderChoice selectedSegmentIndex];
    NSInteger choice2 = [orientationChoice selectedSegmentIndex];
    
    switch (choice1) {
        case 0:
            gender = @"Men";
            break;
        case 1:
            gender = @"Women";
            break;
        case 2:
            gender = @"Men/Women";
            break;
        default:
            gender = @"Men/Women";
            break;
    }

    switch (choice2) {
        case 0:
            orientation = @"Men";
            break;
        case 1:
            orientation = @"Women";
            break;
        case 2:
            orientation = @"Men/Women";
            break;
        default:
            orientation = @"Men/Women";
            break;
    }
    
    //INPUT VALIDATION
    
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    
    NSString *args = [NSString stringWithFormat:@"min=%@&max=%@&gender=%@&orientation=%@", min,max,gender,orientation];    
    
    del.searchParams = args;

    [self.navigationController popViewControllerAnimated:YES];
}

@end
