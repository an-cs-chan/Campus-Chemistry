//
//  InboxViewController.m
//  
//
//  Created by Inderjeet Singh on 12-03-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InboxViewController.h"
#import "DetailViewController.h"
#import "SBJson.h"
#import "AppDelegate.h"

@implementation InboxViewController

@synthesize detailViewInbox;
@synthesize inboxmessage;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   
    if (self) {
        self.title = NSLocalizedString(@"Inbox", @"Inbox");
               }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [inboxmessage count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell.
    if (indexPath.row < [inboxmessage count]){
    cell.textLabel.text = [[inboxmessage objectAtIndex:indexPath.row] email];
    cell.detailTextLabel.text =[[inboxmessage objectAtIndex:indexPath.row] message];
    } 
    return cell;
}


//to call the Detail View
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    returnUser = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.detailViewInbox = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
        
    detailViewInbox.emaildetail = [[inboxmessage objectAtIndex:indexPath.row] email];
    detailViewInbox.messagedetail = [[inboxmessage objectAtIndex:indexPath.row] message];
    
    NSLog(@"Email: %@, Show: %@, another:  %@", self.detailViewInbox.emaildetail, self.detailViewInbox.messagedetail, [[inboxmessage objectAtIndex:indexPath.row] message]);
    
    //NSLog(@"didSelectRowAtIndexPath: row=%d", indexPath.row);
    [returnUser.mailBoxNavController pushViewController:self.detailViewInbox animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    returnUser = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    inboxmessage = [[NSMutableArray alloc] init];
       
    NSLog(@"User:%@", [returnUser getUserEmail]);    
    
    NSString *email = [returnUser getUserEmail];  
        
    NSString *args = [NSString stringWithFormat:@"userid=%@", email];    
     
    NSString *msgLength = [NSString stringWithFormat:@"@d", [args length]];
    
    NSURL *url = [NSURL URLWithString:@"http://ec2-107-22-123-18.compute-1.amazonaws.com/python/inbox.wsgi"];
     
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
      
    //NSString *resultString = @"[{\"fromUserID\": \"makendall@shaw.ca\", \"date\": \"Feb 24, 12:46 PM\", \"message\": \"sdfsd\", \"readStatus\": \"1\", \"messageid\": 7}, {\"fromUserID\": \"makendall@shaw.ca\", \"date\": \"Feb 24, 12:54 PM\", \"message\": \"empty\", \"readStatus\": \"1\", \"messageid\": 8}, {\"fromUserID\": \"makendall@shaw.ca\", \"date\": \"Feb 26, 1:00 AM\", \"message\": \"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravid\", \"readStatus\": \"1\", \"messageid\": 15}, {\"fromUserID\": \"makendall@shaw.ca\", \"date\": \"Feb 26, 1:00 AM\", \"message\": \"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravid\", \"readStatus\": \"1\", \"messageid\": 16}]";
    
    NSLog(@"Output: %@", resultString);
    
    //Parse json into dict
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    NSArray *jsonObjets = [jsonParser objectWithString:resultString error:&error];
    
      
    for (NSDictionary *dict in jsonObjets)
    {
        Message *inbox = [[Message alloc] init];
        [inbox setEmail:[dict objectForKey:@"fromUserID"]];
        [inbox setMessage:[dict objectForKey:@"message"]];
        
        [inboxmessage addObject:inbox];
    }
    //NSLog(@"%@", message);
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
