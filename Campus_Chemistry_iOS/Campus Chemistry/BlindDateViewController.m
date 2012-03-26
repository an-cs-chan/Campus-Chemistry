//
//  BlindDateViewController.m
//  Campus Chemistry
//
//  Created by David Harms on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BlindDateViewController.h"
#import "MatchViewController.h"
#import "DateViewController.h"

@implementation BlindDateViewController

@synthesize dataArray = _dataArray;
@synthesize matchView;
@synthesize dateView;


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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _dataArray = [[NSArray alloc] initWithObjects:@"Matches", @"Dates", nil];
    self.title = NSLocalizedString(@"Blind Date", @"Blind Date");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    if (indexPath.row == 0)
    {
        self.matchView = [[MatchViewController alloc] initWithNibName:@"MatchViewController" bundle:nil];
        [delegate.quizNavController pushViewController:self.matchView animated:YES];
    }
    else
    {
        self.dateView = [[DateViewController alloc] initWithNibName:@"DateViewController" bundle:nil];
        [delegate.quizNavController pushViewController:self.dateView animated:YES];
    }
    
    NSLog(@"didSelectRowAtIndexPath: row=%d", indexPath.row);
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
