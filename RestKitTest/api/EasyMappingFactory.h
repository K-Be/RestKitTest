//
//  EasyMappingFactory.h
//  RestKitTest
//
//  Created by Andrew Romanov on 10.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EasyMapping.h>
#import "Model.h"


@interface EasyMappingFactory : NSObject

+ (EKObjectMapping*)mappingForClass:(Class)objectClass;

@end
