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

@synthesize registerViewController;
@synthesize scrollView;
@synthesize usernameText;
@synthesize passwordText;
@synthesize activeTextField;

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

- (void)keyboardWasShown:(NSNotification *)notification
{
    
    // Step 1: Get the size of the keyboard.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // Step 2: Adjust the bottom content inset of your scroll view by the keyboard height.
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // Step 3: Scroll the target text field into view.
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, activeTextField.frame.origin)) 
    {
        CGPoint scrollPoint = CGPointMake(0.0, activeTextField.frame.origin.y - (keyboardSize.height-5));
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
        if([self openLoginURL:username :password])
        {
            [appDelegate assignUser:username];
            
            appDelegate.window.rootViewController = appDelegate.userViewTabController;
            [appDelegate.window makeKeyAndVisible];
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
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    if(self.registerViewController == nil)
    {
        RegisterViewController *registerView = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
        self.registerViewController = registerView;
        [self.registerViewController setTitle:@"Register"];
    }
    
    [delegate.loginNavController pushViewController:self.registerViewController animated:YES];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeTextField = textField;
    NSLog(@"%@", textField.text);
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeTextField = nil;
    NSLog(@"%@", textField.text);
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
    [passwordText setSecureTextEntry:YES];

    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    passwordText = nil;
    usernameText = nil;
        
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self setScrollView:nil];
    [self setActiveTextField:nil];
        
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
    [[appDelegate.loginNavController navigationBar] setHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
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
