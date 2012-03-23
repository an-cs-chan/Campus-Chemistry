//
//  LoginViewController.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "SBJson.h"

@implementation LoginViewController

@synthesize userTabController;
@synthesize scrollView;
@synthesize registerViewController;
@synthesize inboxViewController;
//@synthesize quizViewController;
@synthesize searchViewController;
@synthesize profileViewController;

@synthesize usernameText;
@synthesize passwordText;

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

- (BOOL)openLoginURL:(NSString *)username:(NSString *)password
{
    NSString *message = @"";
    NSString *args = [NSString stringWithFormat:@"loginEmail=%@&loginPassword=%@", username, password];
    
    NSString *msgLength = [NSString stringWithFormat:@"@d", [args length]];
    
    NSURL *url = [NSURL URLWithString:@"http://ec2-107-22-123-18.compute-1.amazonaws.com/python/login.wsgi"];
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
    
    NSArray *lines = [resultString componentsSeparatedByString:@"["];
    
    for(NSString *str in lines)
    {
        //Parse json into dict
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObjets = [jsonParser objectWithString:resultString error:&error];
         
        for (NSDictionary *dict in jsonObjets)
        {
            message = [dict objectForKey:@"status"];
            
        }
    }
    
    if([message isEqualToString:@"Incorrect credentials"])
    {
        return FALSE;
    }
    
    return TRUE;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeTextField = nil;
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    CGPoint origin = activeTextField.frame.origin;
    origin.y -= scrollView.contentOffset.y;
    if (!CGRectContainsPoint(aRect, origin)) 
    {
        CGPoint scrollPoint = CGPointMake(0.0, activeTextField.frame.origin.y - (aRect.size.height)); 
        [scrollView setContentOffset:scrollPoint animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}

- (IBAction)loginButtonPressed:(id)sender
{       
    NSString *username = usernameText.text;
    NSString *password = passwordText.text;
    
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setTitle:@"Error"];
    [alert setDelegate:self];
    [alert addButtonWithTitle:@"OK"]; 
    
    if([username isEqualToString:@""] || [password isEqualToString:@""])
    {        
        [alert setMessage:@"Enter your username and password."];
        [alert show];
    }
    
    else
    {
        NSLog(@"%@", username);
        NSLog(@"%@", password);
        
        if([self openLoginURL:username :password])
        {
            [self setUpUserTabController];        
            [appDelegate.navigationController pushViewController:self.userTabController animated:YES];
        }
        
        else
        {
            [alert setMessage:@"Incorrect Credentials."];
            [alert show];
        }
    }   
}

- (IBAction)registerButtonPressed:(id)sender 
{
    if(self.registerViewController == nil)
    {
        RegisterViewController *registerView = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
        //[self presentModalViewController:registerView animated:YES];
        self.registerViewController = registerView;
    }
    
    [appDelegate.navigationController setNavigationBarHidden:NO];
    [appDelegate.navigationController pushViewController:self.registerViewController animated:YES];
    
}
- (IBAction)userDoneEditing:(id)sender 
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
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [self registerForKeyboardNotifications];
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
        // Release any retained subviews of the main view.
        // e.g. self.myOutlet = nil;
        [self setScrollView:nil];
        [self setUserTabController:nil];
        
        // unregister for keyboard notifications while not visible.
        [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                        name:UIKeyboardWillShowNotification 
                                                      object:nil]; 
        // unregister for keyboard notifications while not visible.
        [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                        name:UIKeyboardWillHideNotification 
                                                      object:nil];  
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [usernameText becomeFirstResponder];
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [usernameText setText:@""];
    [passwordText setText:@""];
    
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
