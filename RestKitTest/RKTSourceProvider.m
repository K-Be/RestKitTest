//
//  RKTSourceProvider.m
//  RestKitTest
//
//  Created by Andrew Romanov on 06.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "RKTSourceProvider.h"

@implementation RKTSourceProvider

- (NSString*)loadJson
{
	NSString* path = [[NSBundle mainBundle] pathForResource:@"jsonData" ofType:@"json"];
	NSString* jsonString = [NSString stringWithContentsOfFile:path
																	 encoding:NSUTF8StringEncoding
																		 error:nil];
	return jsonString;
}


- (NSDictionary*)loadSource
{
	NSString* path = [[NSBundle mainBundle] pathForResource:@"jsonData" ofType:@"json"];
	NSInputStream* stream = [[NSInputStream alloc] initWithFileAtPath:path];
	[stream open];
	NSDictionary* source = [NSJSONSerialization JSONObjectWithStream:stream
																				options:0
																				  error:nil];
	[stream close];
	
	return source;
}

@end
