//
//  MEActivityComment.m
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEActivityComment.h"

@implementation MEActivityComment

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.date = [dictionary objectForKey:@"date"];
		self.comment = [dictionary objectForKey:@"comment"];
		self.countLikes = [dictionary objectForKey:@"countLikes"];
		self.isLiked = [dictionary objectForKey:@"isLiked"];
		self.uid = [dictionary objectForKey:@"id"];
		self.user = [[MEActivityCommentProfile alloc] initWithDictionary:[dictionary objectForKey:@"user"]];
		
		NSArray* mentionsDesc = [dictionary objectForKey:@"mentions"];
		NSMutableArray* mentions = [NSMutableArray arrayWithCapacity:[mentionsDesc count]];
		[mentionsDesc enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			MEActivityCommentMention* mention = [[MEActivityCommentMention alloc] initWithDictionary:obj];
			[mentions addObject:mention];
		}];
		
		self.mentions = mentions;
	}
	
	return self;
}

@end
