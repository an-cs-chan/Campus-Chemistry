//
//  Person.h
//  Campus Chemistry
//
//  Created by Melissa Kendall on 12-03-19.
//  Copyright (c) 2012 University of Manitoba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *department;
@property (nonatomic, copy) NSString *bodyType;
@property (nonatomic, copy) NSString *about;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *email;

@end