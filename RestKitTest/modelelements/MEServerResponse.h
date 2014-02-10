//
//  MEServerRespond.h
//  RestKitTest
//
//  Created by Andrew Romanov on 08.02.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEAPIError.h"
#import "EasyMapping.h"


@interface MEServerResponse : NSObject

@property (nonatomic, strong) id data;
@property (nonatomic, strong) NSNumber* countNotifies;
@property (nonatomic, strong) NSNumber* countMessages;
@property (nonatomic, strong) NSString* version;
@property (nonatomic, strong) MEAPIError* error;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
