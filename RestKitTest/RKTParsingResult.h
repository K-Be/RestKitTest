//
//  RKTParsingResult.h
//  RestKitTest
//
//  Created by Andrew Romanov on 07.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RKTParsingType) {
	RKTParsingTypeRestKit,
	RKTParsingTypeEasyMapping,
	RKTParsingTypeByHand
};


@interface RKTParsingResult : NSObject

@property (nonatomic) RKTParsingType type;
@property (nonatomic) NSTimeInterval time;
@property (nonatomic) BOOL successed;

+ (RKTParsingResult*)parsingResultWithType:(RKTParsingType)type time:(NSTimeInterval)timeInterval successed:(BOOL)successed;

@end
