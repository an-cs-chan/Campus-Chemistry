//
//  DetailViewSentController.h
//  
//
//  Created by Inderjeet Singh on 12-03-24.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewSentController : UIViewController{
    
}

@property (strong, nonatomic) id detailItem;

@property (unsafe_unretained, nonatomic) IBOutlet UITextView *detailDescriptionLabel;

@property (strong, nonatomic) NSString *messagedetail;


@end
