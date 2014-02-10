//
//  MEActivityObjectPhotoTag.h
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyMapping.h"


@interface MEActivityObjectPhotoTag : NSObject

@property (nonatomic, strong) NSNumber* uid;
@property (nonatomic, strong) NSNumber* type;
@property (nonatomic, strong) NSNumber* x;
@property (nonatomic, strong) NSNumber* y;
@property (nonatomic, strong) NSString* clothesTypeName;
@property (nonatomic, strong) NSString* brandName;
@property (nonatomic, strong) NSString* price;
@property (nonatomic, strong) NSNumber* countLikes;
@property (nonatomic, strong) NSNumber* isLiked;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
