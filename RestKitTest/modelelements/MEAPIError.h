//
//  MEAPIError.h
//  RestKitTest
//
//  Created by Andrew Romanov on 08.02.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyMapping.h"


@interface MEAPIError : NSObject

@property (nonatomic, strong) NSNumber* errorCode;
@property (nonatomic, strong) NSString* message;

- (id)initWithDictionary:(NSDictionary*)dict;

+ (MEAPIError*)apiErrorWithError:(NSError*)errorOrNil;

@end
