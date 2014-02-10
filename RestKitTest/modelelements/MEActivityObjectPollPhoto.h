//
//  MEActivityObjectPollPhoto.h
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEActivityObjectPhotoTag.h"
#import "MEPhotoSize.h"


@interface MEActivityObjectPollPhoto : NSObject

@property (nonatomic, strong) NSNumber* uid;
@property (nonatomic, strong) NSString* url;
@property (nonatomic, strong) NSString* urlSmall;
@property (nonatomic, strong) NSNumber* countVotes;
@property (nonatomic, strong) NSArray* tags;
@property (nonatomic, strong) MEPhotoSize* size;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
