//
//  MEActivityObjectsList.h
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEActivityObject.h"


@interface MEActivityObjectsList : NSObject

@property (nonatomic, strong) NSArray* objects;
@property (nonatomic, strong) NSNumber* last;
@property (nonatomic, strong) NSNumber* countResults;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
