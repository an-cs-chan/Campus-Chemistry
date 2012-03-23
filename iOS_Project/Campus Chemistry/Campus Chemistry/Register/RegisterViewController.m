//
//  RegisterViewController.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RegisterViewController.h"
#import "SBJson.h"

@implementation RegisterViewController
@synthesize emailText;
@synthesize passwordText;
@synthesize confirmText;
@synthesize userTabController;

@synthesize inboxViewController;
//@synthesize quizViewController;
@synthesize searchViewController;
@synthesize profileViewController;

- (BOOL)openRegisterURL:(NSString *)username:(NSString *)password
{
    NSString *message;
    NSString *args = [NSString stringWithFormat:@"loginInput=%@&passwordInput=%@", username, password];
    
    NSString *msgLength = [NSString stringWithFormat:@"@d", [args length]];
    
    NSURL *url = [NSURL URLWithString:@"http://ec2-107-22-123-18.compute-1.amazonaws.com/python/register.wsgi"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPMethod:@"POST"];   
    [request setHTTPBody:[args dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse* response;
    NSError* error = nil;
    
    //Capturing server response
    NSData* result = [NSURLConnection sendSynchronousRequest:request  returningResponse:&response error:&error];
    
    NSString *resultString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];    
    NSLog(@"%@", resultString);
    NSArray *lines = [resultString componentsSeparatedByString:@"["];
    
    for(NSString *str in lines)
    {
        //Parse json into dict
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObjets = [jsonParser objectWithString:resultString error:&error];
                
        for (NSDictionary *dict in jsonObjets)
        {
            message = [dict objectForKey:@"status"];
            NSLog(@"%@", message);
        }
    }
    
    if([message isEqualToString:@"User already exists"])
    {
        return FALSE;
    }
  
    return TRUE;
}


- (void)setUpUserTabController
{
    if(self.userTabController == nil)
    {
        self.userTabController = [[UITabBarController alloc] init];
 
        
        if(inboxViewController == nil)
        {
            InboxViewController *inboxView = [[InboxViewController alloc] initWithNibName:@"InboxViewController" bundle:nil];
            
            self.inboxViewController = inboxView;
        }
        
        /*if(quizViewController == nil)
        {            
            QuizViewController *quizView = [[QuizViewController alloc] initWithNibName:@"QuizViewController" bundle:nil];
            
            self.quizViewController = quizView;                                   
        }*/
        
        if(searchViewController == nil)
        {
            SearchViewController *searchView = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
            
            self.searchViewController = searchView;
        }
        
        if(profileViewController == nil)
        {
            ProfileViewController *profileView = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
            
            self.profileViewController = profileView;
        }
        
        self.userTabController.viewControllers = [NSArray arrayWithObjects: self.inboxViewController, self.searchViewController, self.profileViewController, nil];
        self.userTabController.selectedViewController = [self.userTabController.viewControllers objectAtIndex:0];
    }
}

-(IBAction)registerButtonPressed:(id)sender
{    
    NSString *email = emailText.text;
    NSString *password = passwordText.text;
    NSString *confirm = confirmText.text;
    
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setTitle:@"Error"];
    [alert setDelegate:self];
    [alert addButtonWithTitle:@"OK"];    
          
   if([email isEqualToString:@""] || [password isEqualToString:@""] || [confirm isEqualToString:@""])
    {  
        [alert setMessage:@"Missing entry field."];
        [alert show];
    }
    
    else
    {
    
        if([password isEqualToString:confirm])
        {
            if([self openRegisterURL: email: password] == TRUE)
            {
                [self setUpUserTabController];
        
                AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
                [appDelegate.navigationController pushViewController:self.userTabController animated:YES];
            }
            else
            {
                [alert setMessage:@"User email exists."];
                [alert show];                
            }
        }
    
        else
        {
            if([alert isVisible] == FALSE)
            {
                [alert setMessage:@"Password and Confirm mismatch."];
                [alert show];
            }        
        }
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        //AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        //[appDelegate.navigationController setNavigationBarHidden:NO];
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

- (void)viewWillDisappear:(BOOL)animated
{    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController setNavigationBarHidden:YES];  

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setEmailText:nil];
    [self setPasswordText:nil];
    [self setConfirmText:nil];
    [self setUserTabController:nil];
    //[self setQuizViewController:nil];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
