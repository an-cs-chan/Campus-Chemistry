//
//  FinishQuizViewController.h
//  Campus_Chemistry_iOS
//
//  Created by Trevor Sweetland on 12-03-23.
//  Copyright 2012 University of Manitoba. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FinishQuizViewController : UIViewController {

    IBOutlet UIActivityIndicatorView *loader;
    IBOutlet UIImageView *logoPic;
    IBOutlet UITextView *quizCompleteText;
    IBOutlet UITextView *errorText;

}

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *loader;
@property (nonatomic, retain) IBOutlet UIImageView *logoPic;
@property (nonatomic, retain) IBOutlet UITextView *quizCompleteText;
@property (nonatomic, retain) IBOutlet UITextView *errorText;

@end
