//
//  MappingFactory.m
//  RestKitTest
//
//  Created by Andrew Romanov on 08.02.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MappingFactory.h"


@interface MappingFactory (Private)

+ (RKObjectMapping*)mappingForServerRespond;
+ (RKObjectMapping*)mappingForServerError;
+ (RKObjectMapping*)mappingForPhotoSize;
+ (RKObjectMapping*)mappingForActivityCommentProfile;
+ (RKObjectMapping*)mappingForActivityUserProfile;
+ (RKObjectMapping*)mappingForActivityObjectPhotoTag;
+ (RKObjectMapping*)mappingForActivityComment;
+ (RKObjectMapping*)mappingForActivityCommentMention;
+ (RKObjectMapping*)mappingForActivityObjectPollPhoto;
+ (RKObjectMapping*)mappingForActivityObjectPoll;
+ (RKObjectMapping*)mappingForActivityObjectPhoto;
+ (RKObjectMapping*)mappingForActivityObject;
+ (RKObjectMapping*)mappingForActivityObjectsList;

@end

@implementation MappingFactory

+ (RKObjectMapping*)mappingForClass:(Class)objectClass
{
	RKObjectMapping* mapping = nil;
	
	if (objectClass == [MEServerResponse class])
	{
		mapping = [MappingFactory mappingForServerRespond];
	}
	else if (objectClass == [MEAPIError class])
	{
		mapping = [MappingFactory mappingForServerError];
	}
	else if (objectClass == [MEPhotoSize class])
	{
		mapping = [MappingFactory mappingForPhotoSize];
	}
	else if (objectClass == [MEActivityCommentProfile class])
	{
		mapping = [MappingFactory mappingForActivityCommentProfile];
	}
	else if (objectClass == [MEActivityUserProfile class])
	{
		mapping = [MappingFactory mappingForActivityUserProfile];
	}
	else if (objectClass == [MEActivityObjectPhotoTag class])
	{
		mapping = [MappingFactory mappingForActivityObjectPhotoTag];
	}
	else if (objectClass == [MEActivityComment class])
	{
		mapping = [MappingFactory mappingForActivityComment];
	}
	else if (objectClass == [MEActivityCommentMention class])
	{
		mapping = [MappingFactory mappingForActivityCommentMention];
	}
	if (objectClass == [MEActivityObjectPollPhoto class])
	{
		mapping = [MappingFactory mappingForActivityObjectPollPhoto];
	}
	else if (objectClass == [MEActivityObjectPoll class])
	{
		mapping = [MappingFactory mappingForActivityObjectPoll];
	}
	else if (objectClass == [MEActivityObjectPhoto class])
	{
		mapping = [MappingFactory mappingForActivityObjectPhoto];
	}
	else if (objectClass == [MEActivityObject class])
	{
		mapping = [MappingFactory mappingForActivityObject];
	}
	else if (objectClass == [MEActivityObjectsList class])
	{
		mapping = [MappingFactory mappingForActivityObjectsList];
	}
	
	NSAssert(mapping != nil, @"mapping must not be nil");
	
	return mapping;
}

@end


#pragma mark -
@implementation MappingFactory (Private)

+ (RKObjectMapping*)mappingForServerRespond
{
	RKObjectMapping* map = [RKObjectMapping mappingForClass:[MEServerResponse class]];
	NSDictionary* properties = @{
										@"countNotifies" : @"countNotifies",
										@"countMessages" : @"countMessages",
										@"version" : @"version"};
	[map addAttributeMappingsFromDictionary:properties];
	RKObjectMapping* errorMapping = [MappingFactory mappingForServerError];
	[map addRelationshipMappingWithSourceKeyPath:@"error" mapping:errorMapping];
	
	return map;
}


+ (RKObjectMapping*)mappingForServerError
{
	RKObjectMapping* map = [RKObjectMapping mappingForClass:[MEAPIError class]];
	NSDictionary* properties = @{@"code": @"errorCode",
										@"message" : @"message"};
	[map addAttributeMappingsFromDictionary: properties];
	
	return map;
}


+ (RKObjectMapping*)mappingForPhotoSize
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEPhotoSize class]];
	NSArray* attributes = @[@"width", @"height"];
	[mapping addAttributeMappingsFromArray:attributes];
	
	return mapping;
}


+ (RKObjectMapping*)mappingForActivityCommentProfile
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEActivityCommentProfile class]];
	NSArray* attributes = @[@"avatar", @"firstName", @"lastName", @"nickName"];
	[mapping addAttributeMappingsFromArray:attributes];
	NSDictionary* redirection = @{@"id": @"uid"};
	[mapping addAttributeMappingsFromDictionary:redirection];
	
	return mapping;
}


+ (RKObjectMapping*)mappingForActivityUserProfile
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEActivityUserProfile class]];
	NSArray* attributes = @[@"avatar", @"firstName", @"lastName", @"nickName", @"role", @"page"];
	[mapping addAttributeMappingsFromArray:attributes];
	NSDictionary* redirection = @{@"id": @"uid"};
	[mapping addAttributeMappingsFromDictionary:redirection];
	
	return mapping;
}


+ (RKObjectMapping*)mappingForActivityObjectPhotoTag
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEActivityObjectPhotoTag class]];
	NSArray* attributes = @[@"type", @"x", @"y", @"clothesTypeName", @"brandName", @"price", @"countLikes", @"isLiked"];
	[mapping addAttributeMappingsFromArray:attributes];
	NSDictionary* redirection = @{@"id": @"uid"};
	[mapping addAttributeMappingsFromDictionary:redirection];
		
	return mapping;
}


+ (RKObjectMapping*)mappingForActivityComment
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEActivityComment class]];
	NSArray* attributes = @[@"date", @"comment", @"countLikes", @"isLiked"];
	[mapping addAttributeMappingsFromArray:attributes];
	NSDictionary* redirection = @{@"id": @"uid"};
	[mapping addAttributeMappingsFromDictionary:redirection];
	[mapping addRelationshipMappingWithSourceKeyPath:@"user" mapping:[self mappingForActivityCommentProfile]];
	[mapping addRelationshipMappingWithSourceKeyPath:@"mentions" mapping:[self mappingForActivityCommentMention]];
	
	return mapping;
}


+ (RKObjectMapping*)mappingForActivityCommentMention
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEActivityCommentMention class]];
	NSArray* attributes = @[@"position", @"length", @"userId"];
	[mapping addAttributeMappingsFromArray:attributes];
	
	return mapping;
}


+ (RKObjectMapping*)mappingForActivityObjectPollPhoto
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEActivityObjectPollPhoto class]];
	NSArray* attributes = @[@"url", @"urlSmall", @"countVotes"];
	[mapping addAttributeMappingsFromArray:attributes];
	NSDictionary* redirection = @{@"id": @"uid"};
	[mapping addAttributeMappingsFromDictionary:redirection];
	
	[mapping addRelationshipMappingWithSourceKeyPath:@"size" mapping:[self mappingForPhotoSize]];
	[mapping addRelationshipMappingWithSourceKeyPath:@"tags" mapping:[self mappingForActivityObjectPhotoTag]];
	
	return mapping;
}


+ (RKObjectMapping*)mappingForActivityObjectPoll
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEActivityObjectPoll class]];
	NSArray* attributes = @[@"message", @"countComments", @"countVotes", @"ownerChoice", @"myChoice", @"showResults", @"isClosed", @"stickerId", @"stickerCaption", @"stickerUserId"];
	[mapping addAttributeMappingsFromArray:attributes];
	NSDictionary* redirection = @{@"id":@"uid"};
	[mapping addAttributeMappingsFromDictionary:redirection];
	[mapping addRelationshipMappingWithSourceKeyPath:@"comments" mapping:[self mappingForActivityComment]];
	[mapping addRelationshipMappingWithSourceKeyPath:@"photos" mapping:[self mappingForActivityObjectPollPhoto]];
	[mapping addRelationshipMappingWithSourceKeyPath:@"mentions" mapping:[self mappingForActivityCommentMention]];
	
	return mapping;
}


+ (RKObjectMapping*)mappingForActivityObjectPhoto
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEActivityObjectPhoto class]];
	NSArray* attributes = @[@"url", @"urlSmall", @"message", @"countComments", @"countLikes", @"isLiked", @"shopUrl", @"stickerId", @"stickerCaption", @"stickerUserId"];
	[mapping addAttributeMappingsFromArray:attributes];
	NSDictionary* redirection = @{@"id": @"uid"};
	[mapping addAttributeMappingsFromDictionary:redirection];
	[mapping addRelationshipMappingWithSourceKeyPath:@"size" mapping:[self mappingForPhotoSize]];
	[mapping addRelationshipMappingWithSourceKeyPath:@"comments" mapping:[self mappingForActivityComment]];
	[mapping addRelationshipMappingWithSourceKeyPath:@"tags" mapping:[self mappingForActivityObjectPhotoTag]];
	[mapping addRelationshipMappingWithSourceKeyPath:@"mentions" mapping:[self mappingForActivityCommentMention]];
	
	return mapping;
}


+ (RKObjectMapping*)mappingForActivityObject
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEActivityObject class]];
	NSDictionary* redirection = @{@"id": @"uid",
										 @"date": @"dateTime",
										 @"type": @"typeString"};
	[mapping addAttributeMappingsFromDictionary:redirection];
	[mapping addRelationshipMappingWithSourceKeyPath:@"profile" mapping:[self mappingForActivityUserProfile]];
	[mapping addRelationshipMappingWithSourceKeyPath:@"objectPhoto" mapping:[self mappingForActivityObjectPhoto]];
	[mapping addRelationshipMappingWithSourceKeyPath:@"objectPoll" mapping:[self mappingForActivityObjectPoll]];
	
	return mapping;
}


+ (RKObjectMapping*)mappingForActivityObjectsList
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[MEActivityObjectsList class]];
	NSArray* attributes = @[@"last", @"countResults"];
	[mapping addAttributeMappingsFromArray:attributes];
	[mapping addRelationshipMappingWithSourceKeyPath:@"objects" mapping:[self mappingForActivityObject]];
	
	return mapping;
}

@end

