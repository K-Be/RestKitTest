//
//  MEServerRespond.m
//  RestKitTest
//
//  Created by Andrew Romanov on 08.02.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEServerResponse.h"

@implementation MEServerResponse

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.countNotifies = [dictionary objectForKey:@"countNotifies"];
		self.countMessages = [dictionary objectForKey:@"countMessages"];
		self.version = [dictionary objectForKey:@"version"];
		self.error = [[MEAPIError alloc] initWithDictionary:[dictionary objectForKey:@"error"]];
	}
	
	return self;
}

@end
