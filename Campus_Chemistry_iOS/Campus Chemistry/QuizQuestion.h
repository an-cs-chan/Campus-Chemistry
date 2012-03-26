//
//  QuizQuestion.h
//  Campus_Chemistry_iOS
//
//  Created by Trevor Sweetland on 12-03-22.
//  Copyright 2012 University of Manitoba. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QuizQuestion : NSObject {

    NSString *subject;
    NSString *questionText;
    NSMutableArray *answers;
    int userAnswer;

}

@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) NSString *questionText;
@property (nonatomic, retain) NSMutableArray *answers;
@property int userAnswer;


@end
