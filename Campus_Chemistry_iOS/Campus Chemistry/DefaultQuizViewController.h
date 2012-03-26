//
//  DefaultQuizViewController.h
//  Campus_Chemistry_iOS
//
//  Created by Trevor Sweetland on 12-03-21.
//  Copyright 2012 University of Manitoba. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizQuestion;

@interface DefaultQuizViewController : UIViewController {

    IBOutlet UITextView *aboutQuizText;
    IBOutlet UITextView *quizCompletedText;
    IBOutlet UIButton *beginButton;
    IBOutlet UIActivityIndicatorView *loader;

}

@property (nonatomic, retain) IBOutlet UITextView *aboutQuizText;
@property (nonatomic, retain) IBOutlet UITextView *quizCompletedText;
@property (nonatomic, retain) IBOutlet UIButton *beginButton;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *loader;

- (IBAction) touchedBeginQuiz;
- (void) loadQuestions;
- (void) loadAnswers;

@end
