//
//  ComposeViewController.m
//  tabbedapp
//
//  Created by Inderjeet Singh on 12-03-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ComposeViewController.h"
#import "AppDelegate.h"


@implementation ComposeViewController

@synthesize emailid;
@synthesize messagefull;
@synthesize emailinfo;

- (void) assignEmail:(NSString *)tempStr
{
    self.emailid.text = tempStr;
}

/*- (id) init {
    if (self = [super init]) {
        // define the area and location for the UITextView
        CGRect tfFrame = CGRectMake(10, 10, 300, 100);
        messagefull = [[UITextView alloc] initWithFrame:tfFrame];
        // make sure that it is editable
        messagefull.editable = YES;
        
        // add the controller as the delegate
        messagefull.delegate = self;
    }*/
    
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Compose Message", @"Compose Message");   
        //CGRect tfFrame = CGRectMake(10, 10, 300, 100);
        //messagefull = [[UITextView alloc] initWithFrame:tfFrame];
        // make sure that it is editable
        //messagefull.editable = YES;
        
       // messagefull.delegate = self;
        
    }
    return self;
    
}

    
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range 
replacementText:(NSString *)text
    {
        NSLog(@"Text: %@", text);
        // Any new character added is passed in as the "text" parameter
        
        if ([text isEqualToString:@"\n"]) 
        {
            NSLog(@"IN");
            // Be sure to test for equality using the "isEqualToString" message
            [textView resignFirstResponder];
            
            // Return FALSE so that the final '\n' character doesn't get added
            return FALSE;
        }
        // For any other character return TRUE so that the text gets added to the view
        return TRUE;
}

    
- (IBAction)userDoneEditing:(id)sender
{
    [sender resignFirstResponder];
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
    
    
    self.emailid.text=self.emailinfo;
    
    NSLog(@"Show to Email: %@", self.emailinfo);

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMessagefull:nil];
    [self setEmailid:nil];
    //[self setMessage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    
    return [emailTest evaluateWithObject:candidate];
}

- (IBAction)sendmessagebutton:(id)sender {
    
    returnUser = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSString *name = emailid.text;  // To User Email
    NSString *message = messagefull.text;//Message
    NSString *userid = [returnUser getUserEmail];  // From User email
    
    NSLog(@"Name: %@, Message: %@", name , message);
    
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setTitle:@"Status"];
    [alert setDelegate:self];
    [alert addButtonWithTitle:@"OK"]; 
    
    if([name isEqualToString:@""] || [message isEqualToString:@""] )
    {        
        [alert setMessage:@"Enter Email ID and Message"];
        [alert show];
        //if (validateEmail: ) {
          
        //<#statements#>
        //}
    }
    
    else
    {
        NSLog(@"%@", name);
        NSLog(@"%@", message);
        
        if([self sendmessage:name: userid: message])
        {                  
            [alert setMessage:@"Message Sent"];
            [alert show];   
        
        }       
        else
        {
            [alert setMessage:@"Message Failed"];
            [alert show];
        }
    }   
}

- (BOOL)sendmessage:(NSString *)toemail:(NSString *)fromemail:(NSString *)message 
{
    
    NSString *args = [NSString stringWithFormat:@"message=%@&name=%@&userid=%@", message, toemail,fromemail];    

    NSString *msgLength = [NSString stringWithFormat:@"@d", [args length]];

    NSURL *url = [NSURL URLWithString:@"http://ec2-107-22-123-18.compute-1.amazonaws.com/python/send.wsgi"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request addValue:msgLength forHTTPHeaderField:@"Content-Length" ];
    [request setHTTPMethod:@"POST"];   
    [request setHTTPBody:[args dataUsingEncoding:NSUTF8StringEncoding]];

    NSURLResponse *response;
    
    NSError* error = nil;

    //Capturing server response
    NSData* result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];   

    NSString *resultString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];    

    NSLog(@"Output: %@", resultString);

    //Parse json into dict
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    NSArray *jsonObjets = [jsonParser objectWithString:resultString error:&error];
    
    NSString *status;

    for (NSDictionary *dict in jsonObjets)
    {
        status = [dict objectForKey:@"status"];        
    }
    
    if([status isEqualToString:@"Message Failed"])
    {
        return FALSE;
    }
        
    return TRUE;
    //NSLog(@"%@", message);
}



@end
