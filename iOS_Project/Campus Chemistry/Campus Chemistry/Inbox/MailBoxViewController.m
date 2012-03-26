//
//  MailBoxViewController.m
//  
//
//  Created by Inderjeet Singh on 12-03-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MailBoxViewController.h"

#import "InboxViewController.h"

#import "SentViewContoller.h"

#import "ComposeViewController.h"

@implementation MailBoxViewController


@synthesize dataArray = _dataArray;
@synthesize tableInbox;
@synthesize tableSentMessages;
@synthesize composeform;
@synthesize navigationController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self) {
        self.title = NSLocalizedString(@"MailBox", @"MailBox");
        _dataArray = [[NSArray alloc] initWithObjects:@"Inbox",@"Sent Messages",@"Compose", nil];
               
        UINavigationController *tempNavi = [[UINavigationController alloc] initWithRootViewController:self];
        [tempNavi setNavigationBarHidden:NO];
        
        navigationController = tempNavi;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell.
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        self.tableInbox = [[InboxViewController alloc] initWithNibName:@"InboxViewController" bundle:nil];
        [self.navigationController pushViewController:self.tableInbox animated:YES];
    }
    
    else if (indexPath.row == 1) {
        self.tableSentMessages = [[SentViewContoller alloc] initWithNibName:@"SentViewContoller" bundle:nil];
        [self.navigationController pushViewController:self.tableSentMessages animated:YES];
    }
    
    else {
        self.composeform = [[ComposeViewController alloc] initWithNibName:@"ComposeViewController" bundle:nil];
        [self.navigationController pushViewController:self.composeform animated:YES];
    }
    
    NSLog(@"didSelectRowAtIndexPath: row=%d", indexPath.row);
    
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
