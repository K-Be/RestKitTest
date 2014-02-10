//
//  RKTSourceProvider.h
//  RestKitTest
//
//  Created by Andrew Romanov on 06.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKTSourceProvider : NSObject

- (NSString*)loadJson;
- (NSDictionary*)loadSource;

@end
