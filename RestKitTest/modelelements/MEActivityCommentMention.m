//
//  MEActivityCommentMention.m
//  RestKitTest
//
//  Created by Andrew Romanov on 19.08.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEActivityCommentMention.h"

@implementation MEActivityCommentMention

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.position = [dictionary objectForKey:@"position"];
		self.length = [dictionary objectForKey:@"length"];
		self.userId = [dictionary objectForKey:@"userId"];
	}
	
	return self;
}


- (NSRange)range
{
	return NSMakeRange([_position unsignedIntegerValue], [_length unsignedIntegerValue]);
}


@end
