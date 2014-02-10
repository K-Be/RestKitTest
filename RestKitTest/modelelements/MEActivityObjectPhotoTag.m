//
//  MEActivityObjectPhotoTag.m
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEActivityObjectPhotoTag.h"

@implementation MEActivityObjectPhotoTag

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.type = [dictionary objectForKey:@"type"];
		self.x = [dictionary objectForKey:@"x"];
		self.y = [dictionary objectForKey:@"y"];
		self.clothesTypeName = [dictionary objectForKey:@"clothesTypeName"];
		self.brandName = [dictionary objectForKey:@"brandName"];
		self.price = [dictionary objectForKey:@"price"];
		self.countLikes = [dictionary objectForKey:@"countLikes"];
		self.isLiked = [dictionary objectForKey:@"isLiked"];
		self.uid = [dictionary objectForKey:@"id"];
	}
	
	return self;
}

@end
