//
//  ProfilePhoto.m
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfilePhotoViewController.h"
#import "EditPhotoViewController.h"
#import "SBJson.h"

@implementation ProfilePhotoViewController
@synthesize editPhoto;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Photo", @"Photo");
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
    self.navigationItem.title = @"Profile Photo";
    
    //get the user id
    returnUser = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSString *email = [returnUser getUserEmail];
    //NSString *email=@"an.cs.chan@gmail.com";
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
        
        [profile setPhoto:[dict objectForKey:@"photo"]];
        //NSLog(@"photo:%@", [dict objectForKey:@"photo"]);
        [profiles addObject:profile];
    }
    
    //IT WONT TAKE AN EXTERNAL IMAGE :((((
    //lbluserName.text = [[profiles objectAtIndex:0] photo];
    //NSImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:MyURL]]];
    //NSLog([[profiles objectAtIndex:0] photo]]); 
    //UIImage * img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://example.com/image.png"]]];
    //UIImage *img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[profiles objectAtIndex:0] photo]]]];
    //profilePhoto.image = img;
    /*NSURL *imageURL = [NSURL URLWithString: [[profiles objectAtIndex:0] photo]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData]; 
    profilePhoto.image = image;*/
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
