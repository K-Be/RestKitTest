//
//  MEActivityCommentMention.h
//  RestKitTest
//
//  Created by Andrew Romanov on 19.08.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKObjectMapping.h"


@interface MEActivityCommentMention : NSObject

@property (nonatomic, strong) NSNumber* position;
@property (nonatomic, strong) NSNumber* length;
@property (nonatomic, strong) NSNumber* userId;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
