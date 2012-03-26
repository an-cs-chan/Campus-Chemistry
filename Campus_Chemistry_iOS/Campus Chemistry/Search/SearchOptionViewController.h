//
//  SearchOptionViewController.h
//  Campus Chemistry
//
//  Created by Jae Man Lim on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchOptionViewController : UIViewController <UITextInputDelegate>
{
    
}


@property (unsafe_unretained, nonatomic) IBOutlet UISegmentedControl *orientationChoice;
@property (unsafe_unretained, nonatomic) IBOutlet UISegmentedControl *genderChoice;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *minAge;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *maxAge;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)refineSearch:(id)sender;

@end
