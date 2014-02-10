//
//  MEActivityObject.h
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEActivityUserProfile.h"
#import "MEActivityObjectPhoto.h"
#import "MEActivityObjectPoll.h"


@interface MEActivityObject : NSObject

@property (nonatomic, strong) NSNumber* uid;
@property (nonatomic, strong) NSNumber* dateTime;
@property (nonatomic, strong) NSString* typeString;
@property (nonatomic, strong) MEActivityUserProfile* profile;
@property (nonatomic, strong) MEActivityObjectPhoto* objectPhoto;
@property (nonatomic, strong) MEActivityObjectPoll* objectPoll;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
