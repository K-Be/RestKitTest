//
//  MEActivityCommentProfile.m
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEActivityCommentProfile.h"


@implementation MEActivityCommentProfile

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.uid = [dictionary objectForKey:@"id"];
		self.avatar = [dictionary objectForKey:@"avatar"];
		self.firstName = [dictionary objectForKey:@"firstName"];
		self.lastName = [dictionary objectForKey:@"lastName"];
		self.nickName = [dictionary objectForKey:@"nickName"];
	}
	
	return self;
}

@end
