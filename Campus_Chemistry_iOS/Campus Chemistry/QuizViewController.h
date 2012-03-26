//
//  QuizViewController.h
//  Campus_Chemistry_iOS
//
//  Created by Trevor Sweetland on 12-03-21.
//  Copyright 2012 University of Manitoba. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QuizViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

    IBOutlet UIButton *nextButton;
    IBOutlet UIButton *finishButton;
    IBOutlet UITableView *questionTable;
    
    NSMutableArray *questions;
    NSMutableArray *userAnswers;
    NSString *currSubject;
    NSString *nextSubject;

}

@property (nonatomic, retain) IBOutlet UIButton *nextButton;
@property (nonatomic, retain) IBOutlet UIButton *finishButton;
@property (nonatomic, retain) IBOutlet UITableView *questionTable;
@property (nonatomic, retain) NSMutableArray *questions;
@property (nonatomic, retain) NSMutableArray *userAnswers;
@property (nonatomic, retain) NSString *currSubject;
@property (nonatomic, retain) NSString *nextSubject;

- (IBAction) touchedNextSubject;
- (IBAction) touchedFinishQuiz;
- (void) saveSubjectAnswers;
- (void) loadQuestions;

@end
