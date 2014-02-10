//
//  MEActivityObjectPoll.m
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEActivityObjectPoll.h"

@implementation MEActivityObjectPoll

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.uid = [dictionary objectForKey:@"id"];
		self.message = [dictionary objectForKey:@"message"];
		self.countComments = [dictionary objectForKey:@"countComments"];
		self.countVotes = [dictionary objectForKey:@"countVotes"];
		self.ownerChoice = [dictionary objectForKey:@"ownerChoice"];
		self.myChoice = [dictionary  objectForKey:@"myChoice"];
		self.showResults = [dictionary objectForKey:@"showResults"];
		self.isClosed = [dictionary objectForKey:@"isClosed"];
		self.stickerId = [dictionary objectForKey:@"stickerId"];
		self.stickerCaption = [dictionary objectForKey:@"stickerCaption"];
		self.stickerUserId = [dictionary objectForKey:@"stickerUserId"];
		
		NSArray* commentDesc = [dictionary objectForKey:@"comments"];
		NSMutableArray* comments = [NSMutableArray arrayWithCapacity:[commentDesc count]];
		[commentDesc enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			MEActivityComment* comment = [[MEActivityComment alloc] initWithDictionary:obj];
			[comments addObject:comment];
		}];
		self.comments = comments;
		
		NSArray* photosDesc = [dictionary objectForKey:@"photos"];
		NSMutableArray* photos = [NSMutableArray arrayWithCapacity:[photosDesc count]];
		[photosDesc enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			MEActivityObjectPollPhoto* photo = [[MEActivityObjectPollPhoto alloc] initWithDictionary:obj];
			[photos addObject:photo];
		}];
		self.photos = photos;
		
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
