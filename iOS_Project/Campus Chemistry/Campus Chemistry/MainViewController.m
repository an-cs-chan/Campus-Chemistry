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

//@synthesize username;
//@synthesize logPassword;
//@synthesize email;
//@synthesize regPassword;
//@synthesize confirm;

NSMutableData *receivedData;

-(IBAction)loginButtonPressed:(id)sender
{    
    
    NSString *username = [[NSString alloc] initWithFormat:(usernameText.text)];
    NSString *logPassword = [[NSString alloc] initWithFormat:(logPasswordText.text)];

    username = self.usernameText.text;
    logPassword = self.logPasswordText.text;
    
    NSLog(@"%@", username);
    NSLog(@"%@", logPassword);
    
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

-(IBAction)registerButtonPressed:(id)sender
{

    
}

-(IBAction)logoutButtonPressed:(id)sender
{
    
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    // receivedData is an instance variable declared elsewhere.
    [receivedData setLength:0];
    
    // Remove the old view
    /*[self.Login.view removeFromSuperView];
    // Release it's controller (just to economize on memory)
    self.LoginView.view = nil;
    if(self.profileView == nil)
    {
        // Load the new controller from it's NIB/XIB
        UIViewController* vc2 = [[ViewController2 alloc] 
                                initWithNibName:@"ViewController2" 
                                bundle:nil];
        // Assign it to property & release to keep memory management clean
        self.viewController2 = vc2;
        [vc2 release];
    }
    // Add the new view controller to the window
    [self.window addSubview:vc2];*/
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.
    [receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection 
  didFailWithError:(NSError *)error
{
    // release the connection, and the data object
    //[connection release];
    // receivedData is declared as a method instance elsewhere
    //[receivedData release];
    
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
    
    // release the connection, and the data object
    //[connection release];
    //[receivedData release];
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
