//
//  ProfileInfo.m
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileInfoViewController.h"
#import "EditInfoViewController.h"
#import "SBJson.h"

@implementation ProfileInfoViewController

@synthesize editInfo;

@synthesize lbluserName, lblGender, lblSeeking,lblAge, lblRType, lblEthnicity, lblBCountry, lblFaculty, lblDepartment;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Info", @"Info");
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
   
    self.navigationItem.title = @"Profile Info";
    
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
        [profile setGender:[dict objectForKey:@"gender"]];
        [profile setSeekGender:[dict objectForKey:@"seeking"]];
        [profile setSeekStartAge:[dict objectForKey:@"minagepref"]];
        [profile setSeekEndAge:[dict objectForKey:@"maxagepref"]];
        [profile setAge:[dict objectForKey:@"age"]];
        [profile setRStatus:[dict objectForKey:@"rtype"]];
        [profile setEthnicity:[dict objectForKey:@"ethnicity"]];
        [profile setBCountry:[dict objectForKey:@"bCountry"]];
        [profile setFaculty:[dict objectForKey:@"faculty"]];
        [profile setDepartment:[dict objectForKey:@"department"]];
    
        [profiles addObject:profile];
    }
    
    //set labels to show profile info
    lbluserName.text = [[profiles objectAtIndex:0] name];
    lblGender.text = [[profiles objectAtIndex:0] gender];
    lblSeeking.text = [NSString stringWithFormat:@"%@ (%@ - %@)", [[profiles objectAtIndex:0] seekGender],[[profiles objectAtIndex:0] seekStartAge],[[profiles objectAtIndex:0] seekEndAge]];
    lblAge.text = [NSString stringWithFormat:@"%@", [[profiles objectAtIndex:0] age]];
    lblRType.text = [[profiles objectAtIndex:0] rStatus];
    lblEthnicity.text = [[profiles objectAtIndex:0] ethnicity];
    lblBCountry.text = [[profiles objectAtIndex:0] bCountry];
    lblFaculty.text = [[profiles objectAtIndex:0] faculty];
    lblDepartment.text = [[profiles objectAtIndex:0] department];
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
