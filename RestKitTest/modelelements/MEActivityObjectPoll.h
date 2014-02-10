//
//  MEActivityObjectPoll.h
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEActivityObjectPollPhoto.h"
#import "MEActivityComment.h"
#import "MEActivityCommentMention.h"


@interface MEActivityObjectPoll : NSObject

@property (nonatomic, strong) NSNumber* uid;
@property (nonatomic, strong) NSString* message;
@property (nonatomic, strong) NSArray* photos;//list of MEActivityObjectPollPhoto objects
@property (nonatomic, strong) NSNumber* countComments;
@property (nonatomic, strong) NSNumber* countVotes;
@property (nonatomic, strong) NSNumber* ownerChoice;
@property (nonatomic, strong) NSNumber* myChoice;
@property (nonatomic, strong) NSArray* comments;
@property (nonatomic, strong) NSNumber* showResults;
@property (nonatomic, strong) NSNumber* isClosed;
@property (nonatomic, strong) NSNumber* stickerId;
@property (nonatomic, strong) NSString* stickerCaption;
@property (nonatomic, strong) NSNumber* stickerUserId;
@property (nonatomic, strong) NSArray* mentions;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
