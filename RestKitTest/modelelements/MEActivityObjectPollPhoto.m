//
//  MEActivityObjectPollPhoto.m
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEActivityObjectPollPhoto.h"

@implementation MEActivityObjectPollPhoto

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.url = [dictionary objectForKey:@"url"];
		self.urlSmall = [dictionary objectForKey:@"urlSmall"];
		self.countVotes = [dictionary objectForKey:@"countVotes"];
		self.uid = [dictionary objectForKey:@"id"];
		self.size = [[MEPhotoSize alloc] initWithDictionary:[dictionary objectForKey:@"size"]];
		
		NSArray* tagsDesc = [dictionary objectForKey:@"tags"];
		NSMutableArray* tags = [[NSMutableArray alloc] initWithCapacity:[tagsDesc count]];
		[tagsDesc enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			MEActivityObjectPhotoTag* tag = [[MEActivityObjectPhotoTag alloc] initWithDictionary:obj];
			[tags addObject:tag];
		}];
		self.tags = tags;
	}
	
	return self;
}

@end
