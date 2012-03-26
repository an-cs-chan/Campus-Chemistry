//
//  Message.h
//  tabbedapp
//
//  Created by Inderjeet Singh on 12-03-23.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *department;
@property (nonatomic, copy) NSString *bodyType;
@property (nonatomic, copy) NSString *about;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *email;

@end
