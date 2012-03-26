//
//  FinishQuizViewController.m
//  Campus_Chemistry_iOS
//
//  Created by Trevor Sweetland on 12-03-23.
//  Copyright 2012 University of Manitoba. All rights reserved.
//

#import "FinishQuizViewController.h"
#import "DefaultQuizViewController.h"
#import "QuizQuestion.h"
#import "AppDelegate.h"
#import "SBJson.h"


@implementation FinishQuizViewController

@synthesize loader;
@synthesize logoPic;
@synthesize quizCompleteText;
@synthesize errorText;


- (void) saveAnswers {
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    NSString *content = [NSString stringWithFormat:@"userID=%@&userAnswers=", [delegate getUserEmail]];
    for (QuizQuestion *question in delegate.quizQuestions) {
        content = [content stringByAppendingString:[NSString stringWithFormat:@"%d", question.userAnswer]];
    }
    
    NSData *postData = [content dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSURL *url = [NSURL URLWithString:@"http://ec2-107-22-123-18.compute-1.amazonaws.com/python/saveAnswers.wsgi"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error = nil;
    NSURLResponse *response;
    
    NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *resultString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    NSArray *jsonObjects = [jsonParser objectWithString:resultString error:&error];
    
    [loader stopAnimating];
    
    if (![[(NSDictionary *)[jsonObjects objectAtIndex:0] objectForKey:@"status"] isEqualToString:@"Answers saved"]) {
        [errorText setHidden:NO];
    }
    else {
        [logoPic setHidden:NO];
        [quizCompleteText setHidden:NO];
        
        [[(DefaultQuizViewController *)[[delegate.quizNavController viewControllers] objectAtIndex:0] quizCompletedText] setHidden:NO];
    }

}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelectorInBackground:@selector(saveAnswers) withObject:nil];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



@end
