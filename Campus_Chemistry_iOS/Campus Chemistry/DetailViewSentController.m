//
//  DetailViewSentController.m
//  
//
//  Created by Inderjeet Singh on 12-03-24.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewSentController.h"


@interface DetailViewSentController ()
-(void) configureView;
@end

@implementation DetailViewSentController

@synthesize detailItem;
@synthesize detailDescriptionLabel;
@synthesize messagedetail;

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
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailDescriptionLabel.text = self.messagedetail;
    NSLog(@"Show Label: %@", self.messagedetail);
    [self configureView];
    // Do any additional setup after loading the view from its nib.
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
