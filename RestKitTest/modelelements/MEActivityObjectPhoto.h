//
//  MEActivityObjectPhoto.h
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEPhotoSize.h"
#import "MEActivityObjectPhotoTag.h"
#import "MEActivityComment.h"
#import "MEActivityCommentMention.h"


@interface MEActivityObjectPhoto : NSObject

@property (nonatomic, strong) NSNumber* uid;
@property (nonatomic, strong) NSString* url;
@property (nonatomic, strong) NSString* urlSmall;
@property (nonatomic, strong) MEPhotoSize* size;
@property (nonatomic, strong) NSString* message;
@property (nonatomic, strong) NSNumber* countComments;
@property (nonatomic, strong) NSNumber* countLikes;
@property (nonatomic, strong) NSNumber* isLiked;
@property (nonatomic, strong) NSString* shopUrl;
@property (nonatomic, strong) NSArray* comments;
@property (nonatomic, strong) NSArray* tags;
@property (nonatomic, strong) NSNumber* stickerId;
@property (nonatomic, strong) NSString* stickerCaption;
@property (nonatomic, strong) NSNumber* stickerUserId;
@property (nonatomic, strong) NSArray* mentions;

- (id)initWithDictionary:(id)dicitonary;

@end
