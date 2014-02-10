//
//  MEPhotoSize.h
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyMapping.h"


@interface MEPhotoSize : NSObject

@property (nonatomic, strong) NSNumber* width;
@property (nonatomic, strong) NSNumber* height;

- (id)initWithDictionary:(NSDictionary*)dictionary;

- (CGSize)CGSize;

@end
