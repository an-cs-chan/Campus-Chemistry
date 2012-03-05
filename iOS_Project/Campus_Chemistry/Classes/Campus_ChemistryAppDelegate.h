//
//  Campus_ChemistryAppDelegate.h
//  Campus_Chemistry
//
//  Created by Trevor Sweetland on 12-03-01.
//  Copyright 2012 University of Manitoba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Campus_ChemistryAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

