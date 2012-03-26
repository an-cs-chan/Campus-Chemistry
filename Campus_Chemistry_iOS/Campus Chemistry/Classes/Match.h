//
//  Match.h
//  Campus Chemistry
//
//  Created by David Harms on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Match : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *department;
@property (nonatomic, copy) NSString *matchID;
@property (nonatomic, copy) NSString *bodyType;
@property (nonatomic, copy) NSString *about;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *email;
@property (nonatomic) int compatibility;

@end
