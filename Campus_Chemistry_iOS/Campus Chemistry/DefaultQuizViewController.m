//
//  DefaultQuizViewController.m
//  Campus_Chemistry_iOS
//
//  Created by Trevor Sweetland on 12-03-21.
//  Copyright 2012 University of Manitoba. All rights reserved.
//

#import "DefaultQuizViewController.h"
#import "QuizViewController.h"
#import "BlindDateViewController.h"
#import "QuizQuestion.h"
#import "AppDelegate.h"
#import "SBJson.h"


@implementation DefaultQuizViewController

@synthesize aboutQuizText;
@synthesize quizCompletedText;
@synthesize beginButton;
@synthesize loader;

bool quizCompleted = NO;


- (IBAction) touchedBeginQuiz {
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    QuizViewController *quizView = [[QuizViewController alloc] initWithNibName:@"QuizView" bundle:nil];
    
    [quizView setCurrSubject:[(QuizQuestion *)[delegate.quizQuestions objectAtIndex:0] subject]];
    [delegate.quizNavController pushViewController:quizView animated:YES];
}

- (void) touchedBlindDate {
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    if (!quizCompleted) {
        UIAlertView *alert = [[UIAlertView alloc] init];
        [alert setTitle:@"Alert"];
        [alert setDelegate:self];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessage:@"You must complete the compatibility quiz to user the Blind Date feature."];
        [alert show];
    }
    else {
        BlindDateViewController *blindDateView = [[BlindDateViewController alloc] initWithNibName:nil bundle:nil];
        [delegate.quizNavController pushViewController:blindDateView animated:YES];
    }
}

- (void) loadQuiz {

    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    if (delegate.quizQuestions == nil) {
        NSURL *url = [NSURL URLWithString:@"http://ec2-107-22-123-18.compute-1.amazonaws.com/python/getQuiz.wsgi"];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        
        NSError *error = nil;
        NSURLResponse *response;
        
        NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSString *resultString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObjects = [jsonParser objectWithString:resultString error:&error];
        
        QuizQuestion *question;
        [delegate setQuizQuestions:[[NSMutableArray alloc] init]];
        
        for (NSDictionary *jsonObject in jsonObjects) {
            question = [[QuizQuestion alloc] init];
            [question setQuestionText:[jsonObject objectForKey:@"text"]];
            [question setSubject:[jsonObject objectForKey:@"subject"]];
            [question setAnswers:[[NSMutableArray alloc] initWithArray:[jsonObject objectForKey:@"answers"]]];
            [question setUserAnswer:-1];
            [delegate.quizQuestions addObject:question];
            //[question release];
        }
    }
    
    [self loadAnswers];
    
    [loader stopAnimating];
    [beginButton setHidden:NO];

}

- (void) loadAnswers {
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    if (delegate.quizQuestions != nil) {
        NSString *content = [NSString stringWithFormat:@"userID=%@", [delegate getUserEmail]];
        NSData *postData = [content dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        NSURL *url = [NSURL URLWithString:@"http://ec2-107-22-123-18.compute-1.amazonaws.com/python/getAnswers.wsgi"];
        
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
        
        if (![resultString isEqualToString:@"null"]) {
            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
            NSArray *jsonObjects = [jsonParser objectWithString:resultString error:&error];
            
            for (int i = 0; i < [delegate.quizQuestions count]; i++) {
                [(QuizQuestion *)[delegate.quizQuestions objectAtIndex:i] setUserAnswer:[[jsonObjects objectAtIndex:i] intValue]];
            }
            
            [quizCompletedText setHidden:NO];
            quizCompleted = YES;
        }
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelectorInBackground:@selector(loadQuiz) withObject:nil];
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    UIBarButtonItem *blindDateButton = [[UIBarButtonItem alloc] initWithTitle:@"Blind Date" style:UIBarButtonItemStylePlain target:self action:@selector(touchedBlindDate)];  
    [[[delegate.quizNavController navigationBar] topItem] setRightBarButtonItem:blindDateButton];
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
