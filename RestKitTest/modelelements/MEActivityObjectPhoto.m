//
//  MEActivityObjectPhoto.m
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEActivityObjectPhoto.h"

@implementation MEActivityObjectPhoto

- (id)initWithDictionary:(id)dictionary
{
	if (self = [super init])
	{
		self.url = [dictionary objectForKey:@"url"];
		self.urlSmall = [dictionary objectForKey:@"urlSmall"];
		self.message = [dictionary objectForKey:@"message"];
		self.countComments = [dictionary objectForKey:@"countComments"];
		self.countLikes = [dictionary objectForKey:@"countLikes"];
		self.isLiked = [dictionary objectForKey:@"isLiked"];
		self.shopUrl = [dictionary objectForKey:@"shopUrl"];
		self.stickerId = [dictionary objectForKey:@"stickerId"];
		self.stickerCaption = [dictionary objectForKey:@"stickerCaption"];
		self.stickerUserId = [dictionary objectForKey:@"stickerUserId"];
		self.uid = [dictionary objectForKey:@"id"];
		self.size = [[MEPhotoSize alloc] initWithDictionary:[dictionary objectForKey:@"size"]];
		
		NSArray* commentsDesc = [dictionary objectForKey:@"comments"];
		NSMutableArray* comments = [NSMutableArray arrayWithCapacity:[commentsDesc count]];
		[commentsDesc enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			MEActivityComment* comment = [[MEActivityComment alloc] initWithDictionary:obj];
			[comments addObject:comment];
		}];
		self.comments = comments;
		
		NSArray* tagsDesc = [dictionary objectForKey:@"tags"];
		NSMutableArray* tags = [NSMutableArray arrayWithCapacity:[tagsDesc count]];
		[tagsDesc enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			MEActivityObjectPhotoTag* tag = [[MEActivityObjectPhotoTag alloc] initWithDictionary:obj];
			[tags addObject:tag];
		}];
		self.tags = tags;
		
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
