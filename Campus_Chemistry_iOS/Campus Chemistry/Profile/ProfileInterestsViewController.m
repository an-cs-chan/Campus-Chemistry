//
//  ProfileInterests.m
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileInterestsViewController.h"
#import "EditInterestsViewController.h"
#import "SBJson.h"

@implementation ProfileInterestsViewController

@synthesize editInterests;

@synthesize lblusername, lblInterest1, lblInterest2, lblInterest3, lblInterest4, lblInterest5, lblInterest6;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Interests", @"Interests");
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
    self.navigationItem.title = @"Profile Interests";
    
    //get the user id
    //returnUser = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //NSString *email = [returnUser getUserEmail];
    NSString *email=@"an.cs.chan@gmail.com";
    NSString *args = [NSString stringWithFormat:@"userid=%@", email];
    
    NSString *msgLength = [NSString stringWithFormat:@"@d", [args length]];
    NSURL *url = [NSURL URLWithString:@"http://ec2-107-22-123-18.compute-1.amazonaws.com/python/profile.wsgi"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request addValue:msgLength forHTTPHeaderField:@"Content-Length" ];
    [request setHTTPMethod:@"POST"];   
    [request setHTTPBody:[args dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse* response;
    NSError* error = nil;
    
    //Capturing server response
    NSData* result = [NSURLConnection sendSynchronousRequest:request  returningResponse:&response error:&error];   
    NSString *resultString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];    
    
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    NSArray *jsonObjects = [jsonParser objectWithString:resultString error:&error];
    
    profiles = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in jsonObjects)
    {
        Profile *profile = [[Profile alloc] init];
        [profile setName:[dict objectForKey:@"name"]];
        [profile setInterests:[dict objectForKey:@"about_me"]];
        
        [profiles addObject:profile];
    }
    
    //set label for user name
    lblusername.text = [NSString stringWithFormat: @"%@'s Interests", [[profiles objectAtIndex:0] name]];
    
    //parse interests and set labels for interests
    array = [[NSMutableArray alloc] init];
    array = [[[[profiles objectAtIndex:0] interests] componentsSeparatedByString:@","] mutableCopy];
    
    lblInterest1.text = [NSString stringWithFormat: @"- %@", [array objectAtIndex:0]];
    lblInterest2.text = [NSString stringWithFormat: @"- %@", [array objectAtIndex:1]];
    lblInterest3.text = [NSString stringWithFormat: @"- %@", [array objectAtIndex:2]];
    lblInterest4.text = [NSString stringWithFormat: @"- %@", [array objectAtIndex:3]];
    lblInterest5.text = [NSString stringWithFormat: @"- %@", [array objectAtIndex:4]];
    lblInterest6.text = [NSString stringWithFormat: @"- %@", [array objectAtIndex:5]];
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
