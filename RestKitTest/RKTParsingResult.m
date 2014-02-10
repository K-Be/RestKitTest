//
//  RKTParsingResult.m
//  RestKitTest
//
//  Created by Andrew Romanov on 07.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "RKTParsingResult.h"

@implementation RKTParsingResult

+ (RKTParsingResult*)parsingResultWithType:(RKTParsingType)type time:(NSTimeInterval)timeInterval successed:(BOOL)successed
{
	RKTParsingResult* result = [[RKTParsingResult alloc] init];
	result.type = type;
	result.time = timeInterval;
	result.successed = successed;
	
	return result;
}

@end
