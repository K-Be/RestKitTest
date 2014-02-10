//
//  RKTHandParsing.m
//  RestKitTest
//
//  Created by Andrew Romanov on 10.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "RKTHandParsing.h"
#import "Model.h"


@implementation RKTHandParsing

- (MEServerResponse*)_makeMapping
{
	MEServerResponse* response = [[MEServerResponse alloc] initWithDictionary:self.source];
	MEActivityObjectsList* data = [[MEActivityObjectsList alloc] initWithDictionary:[self.source objectForKey:@"data"]];
	response.data = data;
	
	return response;
}

@end
