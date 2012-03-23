//
//  ProfileViewController.m
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileViewController.h"

#import "ProfileInfoViewController.h"
#import "ProfilePhotoViewController.h"
#import "ProfileInterestsViewController.h"

@implementation ProfileViewController

@synthesize dataArray = _dataArray;
@synthesize info;
@synthesize photo;
@synthesize interests;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Profile", @"Profile");
        _dataArray = [[NSArray alloc] initWithObjects:@"Info",@"Photo",@"Interests", nil];
        
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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)uiView:(UIView *)uiView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        self.info = [[ProfileInfoViewController alloc] initWithNibName:@"Info" bundle:nil];
        [self.navigationController pushViewController:self.info animated:YES];
    }
    
    else if (indexPath.row == 1) {
        self.photo = [[ProfilePhotoViewController alloc] initWithNibName:@"Photo" bundle:nil];
        [self.navigationController pushViewController:self.photo animated:YES];
    }
    
    else {
        self.interests = [[ProfileInterestsViewController alloc] initWithNibName:@"Interests" bundle:nil];
        [self.navigationController pushViewController:self.interests animated:YES];
    }
    
    NSLog(@"didSelectRowAtIndexPath: row=%d", indexPath.row);
    
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
