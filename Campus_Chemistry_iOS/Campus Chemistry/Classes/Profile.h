//
//  Profile.h
//  Campus Chemistry
//
//  Created by Andrea Chan on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *seekGender;

/*
@property (nonatomic) NSInteger *seekStartAge;
@property (nonatomic) NSInteger *seekEndAge;
@property (nonatomic) NSInteger *age;
*/

@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *seekStartAge;
@property (nonatomic,copy) NSString *seekEndAge;

@property (nonatomic, copy) NSString *rStatus;
@property (nonatomic, copy) NSString *ethnicity;
@property (nonatomic, copy) NSString *bCountry;
@property (nonatomic, copy) NSString *faculty;
@property (nonatomic, copy) NSString *department;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *interests;

/*
@property (nonatomic) NSInteger *bYear;
@property (nonatomic) NSInteger *bMonth;
@property (nonatomic) NSInteger *bDay;
 */

@end