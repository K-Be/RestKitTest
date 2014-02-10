//
//  MappingFactory.h
//  RestKitTest
//
//  Created by Andrew Romanov on 08.02.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "Model.h"


@interface MappingFactory : NSObject

+ (RKObjectMapping*)mappingForClass:(Class)objectClass;

@end
