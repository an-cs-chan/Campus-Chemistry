//
//  LoginViewController.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize usernameText;
@synthesize passwordText;

-(IBAction)loginButtonPressed:(id)sender
{     
    NSString *username = [[NSString alloc] initWithFormat:(usernameText.text)];
    NSString *password = [[NSString alloc] initWithFormat:(passwordText.text)];
    
    username = self.usernameText.text;
    password = self.passwordText.text;
    
    NSLog(@"%@", username);
    NSLog(@"%@", password);
    
    // Create the request.
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost/python/login.wsgi/"]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    // create the connection with the request
    // and start loading the data
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if(theConnection) 
    {
        
        // Create the NSMutableData to hold the received data.
        // receivedData is an instance variable declared elsewhere.
        //receivedData = [[NSMutableData data] retain];
        
    } 
    
    else 
    {
        NSLog(@"%@", "Connection failed.");
    }
    
    /*//prepar request
     NSString *urlString = [NSString stringWithFormat:@"http://ctruman.info/post.php"];
     NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
     [request setURL:[NSURL URLWithString:urlString]];
     [request setHTTPMethod:@"POST"];
     
     //set headers
     NSString *contentType = [NSString stringWithFormat:@"text/xml"];
     [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
     
     //create the body
     NSString *formData = [[NSString alloc] initWithFormat:@"%@  %@", username.text, password.text];
     
     NSData *postData = [[NSString stringWithString:formData] dataUsingEncoding:NSUTF8StringEncoding];
     
     //post
     [request setHTTPBody:postData];
     
     //get response
     NSHTTPURLResponse* urlResponse = nil;  
     NSError *error = [[NSError alloc] init];  
     NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];  
     NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
     NSLog(@"Response Code: %d", [urlResponse statusCode]);
     if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
     NSLog(@"Response: %@", result);
     }  */
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
