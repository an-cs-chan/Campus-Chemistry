//
//  ProfileInfo.m
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileInfoViewController.h"
#import "EditInfoViewController.h"

@implementation ProfileInfoViewController

@synthesize editInfo;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Info", @"Info");
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)uiView:(UIView *)uiView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.editInfo) 
    {
        self.editInfo = [[EditInfoViewController alloc] initWithNibName:@"EditInfoViewController" bundle:nil];
        
        
    }
    NSLog(@"didSelectRowAtIndexPath: row=%d", indexPath.row);
    
    [self.navigationController pushViewController:self.editInfo animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
