//
//  SentMessagesController.m
//  
//
//  Created by Inderjeet Singh on 12-03-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SentViewContoller.h"
#import "DetailViewSentController.h"
#import "SBJson.h"
#import "AppDelegate.h"

@implementation SentViewContoller

@synthesize detailViewSent;
@synthesize sentmessages;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Sent Messages", @"Sent Messages");
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [sentmessages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell.
    if (indexPath.row < [sentmessages count]){
    cell.textLabel.text = [[sentmessages objectAtIndex:indexPath.row] email];
    cell.detailTextLabel.text =[[sentmessages objectAtIndex:indexPath.row] message];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    returnUser = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.detailViewSent = [[DetailViewSentController alloc] initWithNibName:@"DetailViewSentController" bundle:nil];
    
    self.detailViewSent.messagedetail = [[sentmessages objectAtIndex:indexPath.row] message];
    NSLog(@"Show: %@, another:  %@", self.detailViewSent.messagedetail, [[sentmessages objectAtIndex:indexPath.row] message]);
    
    //NSLog(@"didSelectRowAtIndexPath: row=%d", indexPath.row);
    [returnUser.mailBoxNavController pushViewController:self.detailViewSent animated:YES];}

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
    returnUser = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    sentmessages = [[NSMutableArray alloc] init];
    
    NSString *email = [returnUser getUserEmail];  
    
    NSString *args = [NSString stringWithFormat:@"userid=%@", email];    
    
    NSString *msgLength = [NSString stringWithFormat:@"@d", [args length]];
    
    NSURL *url = [NSURL URLWithString:@"http://ec2-107-22-123-18.compute-1.amazonaws.com/python/sent_messages.wsgi"];
    
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
    
   //NSString *resultString = @"[{\"toUserID\": \"makendall@shaw.ca\", \"date\": \"Feb 24, 12:46 PM\", \"message\": \"sdfsd\", \"readStatus\": \"1\", \"messageid\": 7}, {\"toUserID\": \"makendall@shaw.ca\", \"date\": \"Feb 24, 12:54 PM\", \"message\": \"empty\", \"readStatus\": \"1\", \"messageid\": 8}, {\"toUserID\": \"makendall@shaw.ca\", \"date\": \"Feb 26, 1:00 AM\", \"message\": \"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravid\", \"readStatus\": \"1\", \"messageid\": 15}, {\"toUserID\": \"makendall@shaw.ca\", \"date\": \"Feb 26, 1:00 AM\", \"message\": \"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravid\", \"readStatus\": \"1\", \"messageid\": 16}]";
    
    NSLog(@"Output: %@", resultString);
    
    //Parse json into dict
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    NSArray *jsonObjets = [jsonParser objectWithString:resultString error:&error];
    
    
    for (NSDictionary *dict in jsonObjets)
    {
        Message *sent = [[Message alloc] init];
        [sent setEmail:[dict objectForKey:@"toUserID"]];
        [sent setMessage:[dict objectForKey:@"message"]];
        
        [sentmessages addObject:sent];       
    }
    
}

#pragma mark - Table view delegate



- (void)viewDidUnload
{
    [super viewDidUnload];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
