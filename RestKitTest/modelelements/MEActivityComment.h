//
//  MEActivityComment.h
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEActivityCommentProfile.h"
#import "MEActivityCommentMention.h"
#import "EasyMapping.h"


@interface MEActivityComment : NSObject

@property (nonatomic, strong) NSNumber* uid;
@property (nonatomic, strong) MEActivityCommentProfile* user;
@property (nonatomic, strong) NSNumber* date;
@property (nonatomic, strong) NSString* comment;
@property (nonatomic, strong) NSNumber* countLikes;
@property (nonatomic, strong) NSNumber* isLiked;
@property (nonatomic, strong) NSArray* mentions;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
