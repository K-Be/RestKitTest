//
//  MEActivityUserProfile.h
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyMapping.h"


@interface MEActivityUserProfile : NSObject

@property (nonatomic, strong) NSNumber* uid;
@property (nonatomic, strong) NSString* avatar;
@property (nonatomic, strong) NSString* firstName;
@property (nonatomic, strong) NSString* lastName;
@property (nonatomic, strong) NSString* nickName;
@property (nonatomic, strong) NSString* role;
@property (nonatomic, strong) NSString* page;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
