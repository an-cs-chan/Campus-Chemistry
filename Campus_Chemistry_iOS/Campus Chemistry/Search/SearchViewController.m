//
//  SearchViewController.m
//  Campus Chemistry
//
//  Created by Melissa Kendall on 12-03-18.
//  Copyright (c) 2012 University of Manitoba. All rights reserved.
//

#import "SearchViewController.h"
#import "AppDelegate.h"
#import "SBJson.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

// CHANGED BY JMAN
//@synthesize naviItem;
//@synthesize navigationController;
//@synthesize searchOptionViewController;

-(void)awakeFromNib {

}

// CHANGED BY JMAN

-(void)OptionButtonPressed
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    SearchOptionViewController *searchOptionView = [[SearchOptionViewController alloc] initWithNibName:@"SearchOptionViewController" bundle:nil];
    [delegate.searchNavController pushViewController:searchOptionView animated:YES];

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        [self setTitle:@"Search"];
        
        // CHANGED BY JMAN
        //if(searchOptionViewController == nil)
        //{
        //    SearchOptionViewController *searchOptionView = [[SearchOptionViewController alloc] initWithNibName:@"SearchOptionViewController" bundle:nil];
            
        //    self.searchOptionViewController = searchOptionView;
        //}
        
        //self.naviItem = [[UINavigationItem alloc] initWithTitle:@"Option"];
        
        //UINavigationController *tempNavi = [[UINavigationController alloc] initWithRootViewController:self];
        //[tempNavi setNavigationBarHidden:NO];
        //navigationController = tempNavi;
        
       
    }
    return self;
}

- (NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [people count];
}

- (UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    } 
    
    if(indexPath.row < [people count])
    {
        cell.primaryLabel.text = [[people objectAtIndex:indexPath.row] firstName];
        cell.secondaryLabel.text = [[people objectAtIndex:indexPath.row] email];
        cell.myImageView.image = [UIImage imageNamed:@"ViewController.gif"];
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    //The below code should work for NSUrl
    responseData = [NSMutableData data];
    
    NSString *ethnicity = @"Canadian";
    NSString *nationality = @"Canada";
    NSString *city = @"Winnipeg";
    NSString *gender = @"Men";
    NSString *orientation = @"Women";
    NSString *minAge = @"18";
    NSString *maxAge = @"99";
    NSString *sort = @"DOB";
    NSString *sortOrder = @"ASC";
    
    people = [[NSMutableArray alloc] init];
    
    
    NSString *args = [NSString stringWithFormat:@"ethnicity=%@&Birth_Country=%@&city=%@&gender=%@&orientation=%@&minAge=%@&maxAge=%@&sort=%@&sortOrder", ethnicity,nationality,city,gender,orientation,minAge,maxAge,sort,sortOrder];    
    
    NSString *msgLength = [NSString stringWithFormat:@"@d", [args length]];
    NSURL *url = [NSURL URLWithString:@"http://ec2-107-22-123-18.compute-1.amazonaws.com/python/search.wsgi"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request addValue:msgLength forHTTPHeaderField:@"Content-Length" ];
    [request setHTTPMethod:@"POST"];   
    [request setHTTPBody:[args dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse* response;
    NSError* error = nil;
    
    //Capturing server response
    NSData* result = [NSURLConnection sendSynchronousRequest:request  returningResponse:&response error:&error];   
    NSString *resultString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];    
        
    //NSString *resultString = @"[{\"name\":\"melissa\", \"department\":\"computer science\", \"type\":\"Athletic\", \"about\":\"some crap\", \"picture\":\"asf\", \"email\":\"flowacat@shaw.ca\"}, {\"name\":\"samantha\", \"department\":\"computer science\", \"type\":\"Athletic\", \"about\":\"some crap\", \"picture\":\"asf\", \"email\":\"flowacat@shaw.ca\"},{\"name\":\"kayla\", \"department\":\"computer science\", \"type\":\"Athletic\", \"about\":\"some crap\", \"picture\":\"asf\", \"email\":\"flowacat@shaw.ca\"}]";
    
    //Parse json into dict
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    NSArray *jsonObjets = [jsonParser objectWithString:resultString error:&error];
    
    for (NSDictionary *dict in jsonObjets)
    {
        Person *person = [[Person alloc] init];
        
        [person setFirstName:[dict objectForKey:@"name"]];
        [person setAbout:[dict objectForKey:@"about"]];
        [person setDepartment:[dict objectForKey:@"department"]];
        [person setBodyType:[dict objectForKey:@"type"]];
        [person setPicture:[dict objectForKey:@"picture"]];
        [person setEmail:[dict objectForKey:@"email"]];
        
        [people addObject:person];
    }
    
    
    // CHANGED BY JMAN

    //self.naviItem = [[UINavigationItem alloc] initWithTitle:@"Search Results"];
    
    UIBarButtonItem *optionButton = [[UIBarButtonItem alloc] initWithTitle:@"Option" style:UIBarButtonItemStylePlain target:self action:@selector(OptionButtonPressed)];          
    //[[delegate.searchNavController setRightBarButtonItem:optionButton];
    //[[delegate.searchNavController get  ] setRightBarButtonItem:optionButton];
    [[[delegate.searchNavController navigationBar] topItem] setRightBarButtonItem:optionButton];
    //self.navigationItem.rightBarButtonItem = optionButton;    
    
    //self.navigationController.navigationItem = self.naviItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
