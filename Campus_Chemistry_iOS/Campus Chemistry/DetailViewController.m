//
//  DetailViewController.m
//  
//
//  Created by Inderjeet Singh on 12-03-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "ComposeViewController.h"

@interface DetailViewController ()
-(void) configureView;
@end

@implementation DetailViewController

@synthesize detailItem;
@synthesize detailDescriptionLabel;
@synthesize emaildetail;
@synthesize messagedetail;
@synthesize composeform;



#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem; 
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
         
        
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");       
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
    self.detailDescriptionLabel.text = self.messagedetail;
    NSLog(@"Show Email: %@, Show Message: %@", self.emaildetail, self.messagedetail);
    // Do any additional setup after loading the view from its nib.
    [self configureView];
}

- (void)viewDidUnload
{
    //[self detailDescriptionLabel:nil];
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (IBAction)replymessagebutton:(id)sender {
    
    if(self.composeform == nil)
    {
    
        self.composeform = [[ComposeViewController alloc] initWithNibName:@"ComposeViewController" bundle:nil];
        composeform.emailinfo = self.emaildetail;

    }
    //pushing the compose view finally with email ID :)
    [self.navigationController pushViewController:self.composeform animated:YES];
}

@end
