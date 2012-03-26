//
//  Date.h
//  Campus Chemistry
//
//  Created by David Harms on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Date : NSObject

@property (nonatomic, copy) NSString *toName;
@property (nonatomic, copy) NSString *toPic;
@property (nonatomic, copy) NSString *fromName;
@property (nonatomic, copy) NSString *fromPic;
@property (nonatomic, copy) NSString *dateID;
@property (nonatomic, copy) NSString *toID;
@property (nonatomic, copy) NSString *fromID;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *dateDate;
@property (nonatomic, copy) NSString *dateTime;
@property (nonatomic, copy) NSString *message;

@end
