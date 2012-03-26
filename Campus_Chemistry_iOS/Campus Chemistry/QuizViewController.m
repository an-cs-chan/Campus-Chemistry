//
//  QuizViewController.m
//  Campus_Chemistry_iOS
//
//  Created by Trevor Sweetland on 12-03-21.
//  Copyright 2012 University of Manitoba. All rights reserved.
//

#import "QuizViewController.h"
#import "FinishQuizViewController.h"
#import "QuizQuestion.h"
#import "AppDelegate.h"


@implementation QuizViewController

@synthesize nextButton;
@synthesize finishButton;
@synthesize questionTable;

@synthesize questions;
@synthesize userAnswers;
@synthesize currSubject;
@synthesize nextSubject;


- (IBAction) touchedNextSubject {

    //save the user's answers for this subject
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    QuizViewController *quizView = [[QuizViewController alloc] initWithNibName:@"QuizView" bundle:nil];
    
    [self saveSubjectAnswers];
    
    [quizView setCurrSubject:nextSubject];
    [delegate.quizNavController pushViewController:quizView animated:YES];
    
}

- (IBAction) touchedFinishQuiz {
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    QuizViewController *finishView = [[FinishQuizViewController alloc] initWithNibName:@"FinishQuizView" bundle:nil];
    
    [self saveSubjectAnswers];
    
    [delegate.quizNavController popToRootViewControllerAnimated:NO];
    [delegate.quizNavController pushViewController:finishView animated:YES];

}

- (void) saveSubjectAnswers {

    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    int subjectIndex = -1;
    
    
    for (int i = 0; i < [delegate.quizQuestions count]; i++) {
        if ([[(QuizQuestion *)[delegate.quizQuestions objectAtIndex:i] subject] isEqualToString:currSubject]) {
            if (subjectIndex == -1) {
                subjectIndex = i;
            }
            
            [(QuizQuestion *)[delegate.quizQuestions objectAtIndex:i] setUserAnswer:[(NSNumber *)[userAnswers objectAtIndex:i-subjectIndex] intValue]];
            //NSLog([NSString stringWithFormat:@"%d",[[(QuizQuestion *)[delegate.quizQuestions objectAtIndex:i] userAnswer] intValue]]);
        }
    }
    
}

- (void) loadQuestions {

    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    questions = [[NSMutableArray alloc] init];
    userAnswers = [[NSMutableArray alloc] init];
    
    for (QuizQuestion *question in delegate.quizQuestions) {
        if ([[question subject] isEqualToString:currSubject]) {
            [questions addObject:question];
            [userAnswers addObject:[NSNumber numberWithInt:question.userAnswer]];
        }
        else if ([questions count] > 0 && nextSubject == nil) {
            nextSubject = [question subject];
        }
    }
    
    // this is the last subject
    if (nextSubject == nil) {
        [nextButton setHidden:YES];
        [finishButton setHidden:NO];
    }
    
}

#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTitle:currSubject];
    [self loadQuestions];
    
    NSLog([userAnswers description]);
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //if there are answers for all questions, enable the next/finish button
    if (![userAnswers containsObject:[NSNumber numberWithInt:-1]]) {
        if (nextSubject != nil) {
            [nextButton setAlpha:1.0f];
            [nextButton setEnabled:YES];
        }
        else {
            [finishButton setAlpha:1.0f];
            [finishButton setEnabled:YES];
        }
    }
    
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [questions count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[(QuizQuestion *)[questions objectAtIndex:section] answers] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    
    // Configure the cell...
    NSString *cellValue = [[(QuizQuestion *)[questions objectAtIndex:indexPath.section] answers] objectAtIndex:indexPath.row];
    [[cell textLabel] setText:cellValue];
    
    // Select the cell if it was previously selected
    if (![[userAnswers objectAtIndex:indexPath.section] isEqual:[NSNumber numberWithInt:-1]]) {
        if ([[userAnswers objectAtIndex:indexPath.section] isEqual:[NSNumber numberWithInt:indexPath.row]]) {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return [(QuizQuestion *)[questions objectAtIndex:section] questionText];    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //deselect rows in the section
    for (int i = 0; i < [tableView numberOfRowsInSection:indexPath.section]; i++) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:indexPath.section]];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    //select the selected row
    UITableViewCell *selected = [tableView cellForRowAtIndexPath:indexPath];
    [selected setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    //record the user's answer
    [userAnswers replaceObjectAtIndex:indexPath.section withObject:[NSNumber numberWithInt:indexPath.row]];
    
    //if there are answers for all questions, enable the next/finish button
    if (![userAnswers containsObject:[NSNumber numberWithInt:-1]]) {
        if (nextSubject != nil) {
            [nextButton setAlpha:1.0f];
            [nextButton setEnabled:YES];
        }
        else {
            [finishButton setAlpha:1.0f];
            [finishButton setEnabled:YES];
        }
    }
    
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}



@end

