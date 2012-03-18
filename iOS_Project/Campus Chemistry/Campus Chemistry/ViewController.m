//
//  ViewController.m
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize usernameText;
@synthesize passwordText;
@synthesize registerViewController;
@synthesize userAreaViewController;
@synthesize quizViewController;

- (IBAction)loginButtonPressed:(id)sender
{
    NSString *username = usernameText.text;
    NSString *password = passwordText.text;
    
    NSLog(@"%@", username);
    NSLog(@"%@", password);
        
    /*if(self.userAreaViewController == nil)
    {
        UserAreaViewController *userAreaView = [[UserAreaViewController alloc] initWithNibName:@"UserAreaViewController" bundle:nil];
        [self presentModalViewController:userAreaView animated:YES];
        self.userAreaViewController = userAreaView;
             
    }*/
            
    if(quizViewController == nil)
     {
         QuizViewController *quizView = [[QuizViewController alloc] initWithNibName:@"QuizViewController" bundle:nil];
         [self presentModalViewController:quizView animated:YES];
         self.quizViewController = quizView;
     
     }
    
    //UIViewController *quizViewController = userAreaViewController.quizViewController;    
        
    //[self.view removeFromSuperview];
    [self.view addSubview:quizViewController.view];
}

- (IBAction)registerButtonPressed:(id)sender 
{
    /*self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    registerView = [[RegisterViewController alloc]
                                            initWithNibName:@"RegisterViewController" bundle:nil];
    registerView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [registerView presentModalViewController:registerView animated:YES];
    
    self.window.rootViewController = self.registerView;
    [self.window makeKeyAndVisible];
     */
    
    //registerView initWithNibName:<#(NSString *)#> bundle:<#(NSBundle *)#>
    
    //RegisterViewController *registerView = [[RegisterViewController initialize];
    

    
    if(self.registerViewController == nil)
    {
        RegisterViewController *registerView = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
        [self presentModalViewController:registerView animated:YES];
        self.registerViewController = registerView;

    }
    
    [self.view removeFromSuperview];
    [self.view addSubview:registerViewController.view];

}






- (IBAction)userDoneEnteringText:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)userEnteringText:(id)sender 
{
    [sender becomeFirstResponder];
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

- (void)viewDidUnload
{
    //[self setLoginViewController:loginViewController];
    //[self setLoginViewController:nil];
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
    [usernameText becomeFirstResponder];
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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
