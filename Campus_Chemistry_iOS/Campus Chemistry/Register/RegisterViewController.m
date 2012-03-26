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

@synthesize scrollView;
@synthesize activeTextField;

- (BOOL)openRegisterURL:(NSString *)username:(NSString *)password
{
    NSString *message;
    NSString *args = [NSString stringWithFormat:@"emailInput=%@&passwordInput=%@", username, password];
    
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
    
    if([message isEqualToString:@"User already exists"])
    {
        return FALSE;
    }
    
    return TRUE;
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
                [alert setTitle:@"Sucess"];
                [alert setMessage:@"User account created."];
                [alert show];
        
                appDelegate.window.rootViewController = appDelegate.userViewTabController;
                [appDelegate.window makeKeyAndVisible];
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


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
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
}

- (void)viewDidLoad
{
   
    [self registerForKeyboardNotifications];
    
    [passwordText setSecureTextEntry:YES];
    [confirmText setSecureTextEntry:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[appDelegate.loginNavController navigationBar] setHidden:NO];
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setEmailText:nil];
    [self setPasswordText:nil];
    [self setConfirmText:nil];
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
