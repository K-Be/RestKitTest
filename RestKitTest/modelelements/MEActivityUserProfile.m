//
//  MEActivityUserProfile.m
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEActivityUserProfile.h"


@implementation MEActivityUserProfile

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.avatar = [dictionary objectForKey:@"avatar"];
		self.firstName = [dictionary objectForKey:@"firstName"];
		self.lastName = [dictionary objectForKey:@"lastName"];
		self.nickName = [dictionary objectForKey:@"nickName"];
		self.role = [dictionary objectForKey:@"role"];
		self.page = [dictionary objectForKey:@"page"];
		self.uid = [dictionary objectForKey:@"id"];
	}
	
	return self;
}

@end
