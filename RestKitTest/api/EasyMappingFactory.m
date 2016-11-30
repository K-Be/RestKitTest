//
//  EasyMappingFactory.m
//  RestKitTest
//
//  Created by Andrew Romanov on 10.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "EasyMappingFactory.h"
#import "EKObjectMapping+RKTCategory.h"


@interface EasyMappingFactory (Private)

+ (EKObjectMapping*)mappingForServerRespond;
+ (EKObjectMapping*)mappingForServerError;
+ (EKObjectMapping*)mappingForPhotoSize;
+ (EKObjectMapping*)mappingForActivityCommentProfile;
+ (EKObjectMapping*)mappingForActivityUserProfile;
+ (EKObjectMapping*)mappingForActivityObjectPhotoTag;
+ (EKObjectMapping*)mappingForActivityComment;
+ (EKObjectMapping*)mappingForActivityCommentMention;
+ (EKObjectMapping*)mappingForActivityObjectPollPhoto;
+ (EKObjectMapping*)mappingForActivityObjectPoll;
+ (EKObjectMapping*)mappingForActivityObjectPhoto;
+ (EKObjectMapping*)mappingForActivityObject;
+ (EKObjectMapping*)mappingForActivityObjectsList;

@end

@implementation EasyMappingFactory

+ (EKObjectMapping*)mappingForClass:(Class)objectClass
{
	EKObjectMapping* mapping = nil;
	
	if (objectClass == [MEServerResponse class])
	{
		mapping = [self mappingForServerRespond];
	}
	else if (objectClass == [MEAPIError class])
	{
		mapping = [self mappingForServerError];
	}
	else if (objectClass == [MEPhotoSize class])
	{
		mapping = [self mappingForPhotoSize];
	}
	else if (objectClass == [MEActivityCommentProfile class])
	{
		mapping = [self mappingForActivityCommentProfile];
	}
	else if (objectClass == [MEActivityUserProfile class])
	{
		mapping = [self mappingForActivityUserProfile];
	}
	else if (objectClass == [MEActivityObjectPhotoTag class])
	{
		mapping = [self mappingForActivityObjectPhotoTag];
	}
	else if (objectClass == [MEActivityComment class])
	{
		mapping = [self mappingForActivityComment];
	}
	else if (objectClass == [MEActivityCommentMention class])
	{
		mapping = [self mappingForActivityCommentMention];
	}
	if (objectClass == [MEActivityObjectPollPhoto class])
	{
		mapping = [self mappingForActivityObjectPollPhoto];
	}
	else if (objectClass == [MEActivityObjectPoll class])
	{
		mapping = [self mappingForActivityObjectPoll];
	}
	else if (objectClass == [MEActivityObjectPhoto class])
	{
		mapping = [self mappingForActivityObjectPhoto];
	}
	else if (objectClass == [MEActivityObject class])
	{
		mapping = [self mappingForActivityObject];
	}
	else if (objectClass == [MEActivityObjectsList class])
	{
		mapping = [self mappingForActivityObjectsList];
	}
	
	NSAssert(mapping != nil, @"mapping must not be nil");
	
	return mapping;
}

@end


#pragma mark -
@implementation EasyMappingFactory (Private)

+ (EKObjectMapping*)mappingForServerRespond
{
	EKObjectMapping* map = [EKObjectMapping mappingForClass:[MEServerResponse class]
																 withBlock:^(EKObjectMapping *mapping) {
																	 NSDictionary* properties = @{
																											@"countNotifies" : @"countNotifies",
																											@"countMessages" : @"countMessages",
																											@"version" : @"version"};
																	 [mapping mapPropertiesFromDictionary:properties];
																	 EKObjectMapping* errorMapping = [self mappingForServerError];
																	 [mapping rkt_hasOne:errorMapping	forKeyPath:@"error"];
																 }];
	return map;
}


+ (EKObjectMapping*)mappingForServerError
{
	EKObjectMapping* map = [EKObjectMapping mappingForClass:[MEAPIError class]
																 withBlock:^(EKObjectMapping *mapping) {
																	 NSDictionary* properties = @{@"code": @"errorCode",
																											@"message" : @"message"};
																	 [mapping mapPropertiesFromDictionary:properties];
																 }];
	return map;
}


+ (EKObjectMapping*)mappingForPhotoSize
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEPhotoSize class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSArray* attributes = @[@"width", @"height"];
																			[mapping mapPropertiesFromArray:attributes];
																	  }];
	return mapping;
}


+ (EKObjectMapping*)mappingForActivityCommentProfile
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEActivityCommentProfile class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSArray* attributes = @[@"avatar", @"firstName", @"lastName", @"nickName"];
																			[mapping mapPropertiesFromArray:attributes];
																		  NSDictionary* redirection = @{@"id": @"uid"};
																			[mapping mapPropertiesFromDictionary:redirection];
																	  }];
	return mapping;
}


+ (EKObjectMapping*)mappingForActivityUserProfile
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEActivityUserProfile class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSArray* attributes = @[@"avatar", @"firstName", @"lastName", @"nickName", @"role", @"page"];
																			[mapping mapPropertiesFromArray:attributes];
																		  NSDictionary* redirection = @{@"id": @"uid"};
																			[mapping mapPropertiesFromDictionary:redirection];
																	  }];
	return mapping;
}


+ (EKObjectMapping*)mappingForActivityObjectPhotoTag
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEActivityObjectPhotoTag class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSArray* attributes = @[@"type", @"x", @"y", @"clothesTypeName", @"brandName", @"price", @"countLikes", @"isLiked"];
																		  [mapping mapPropertiesFromArray:attributes];
																		  NSDictionary* redirection = @{@"id": @"uid"};
																		  [mapping mapPropertiesFromDictionary:redirection];
																	  }];
	return mapping;
}


+ (EKObjectMapping*)mappingForActivityComment
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEActivityComment class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSArray* attributes = @[@"date", @"comment", @"countLikes", @"isLiked"];
																		  [mapping mapPropertiesFromArray:attributes];
																		  NSDictionary* redirection = @{@"id": @"uid"};
																		  [mapping mapPropertiesFromDictionary:redirection];
																			[mapping rkt_hasOne:[self mappingForActivityCommentProfile] forKeyPath:@"user"];
																			[mapping rkt_hasMany:[self mappingForActivityCommentMention] forKeyPath:@"mentions"];
																	  }];
	return mapping;
}


+ (EKObjectMapping*)mappingForActivityCommentMention
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEActivityCommentMention class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSArray* attributes = @[@"position", @"length", @"userId"];
																		  [mapping mapPropertiesFromArray:attributes];
																	  }];
	return mapping;
}


+ (EKObjectMapping*)mappingForActivityObjectPollPhoto
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEActivityObjectPollPhoto class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSArray* attributes = @[@"url", @"urlSmall", @"countVotes"];
																		  [mapping mapPropertiesFromArray:attributes];
																		  NSDictionary* redirection = @{@"id": @"uid"};
																		  [mapping mapPropertiesFromDictionary:redirection];
																			[mapping rkt_hasOne:[self mappingForPhotoSize] forKeyPath:@"size"];
																			[mapping rkt_hasMany:[self mappingForActivityObjectPhotoTag] forKeyPath:@"tags"];
																	  }];
	return mapping;
}


+ (EKObjectMapping*)mappingForActivityObjectPoll
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEActivityObjectPoll class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSArray* attributes = @[@"message", @"countComments", @"countVotes", @"ownerChoice", @"myChoice", @"showResults", @"isClosed", @"stickerId", @"stickerCaption", @"stickerUserId"];
																		  [mapping mapPropertiesFromArray:attributes];
																		  NSDictionary* redirection = @{@"id":@"uid"};
																		  [mapping mapPropertiesFromDictionary:redirection];
																		  [mapping rkt_hasMany:[self mappingForActivityComment] forKeyPath:@"comments"];
																		  [mapping rkt_hasMany:[self mappingForActivityObjectPollPhoto] forKeyPath:@"photos"];
																		  [mapping rkt_hasMany:[self mappingForActivityCommentMention] forKeyPath:@"mentions"];
																	  }];
	return mapping;
}


+ (EKObjectMapping*)mappingForActivityObjectPhoto
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEActivityObjectPhoto class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSArray* attributes = @[@"url", @"urlSmall", @"message", @"countComments", @"countLikes", @"isLiked", @"shopUrl", @"stickerId", @"stickerCaption", @"stickerUserId"];
																		  [mapping mapPropertiesFromArray:attributes];
																		  NSDictionary* redirection = @{@"id": @"uid"};
																		  [mapping mapPropertiesFromDictionary:redirection];
																			
																		  [mapping rkt_hasOne:[self mappingForPhotoSize] forKeyPath:@"size"];
																		  [mapping rkt_hasMany:[self mappingForActivityComment] forKeyPath:@"comments"];
																		  [mapping rkt_hasMany:[self mappingForActivityObjectPhotoTag] forKeyPath:@"tags"];
																		  [mapping rkt_hasMany:[self mappingForActivityCommentMention] forKeyPath:@"mentions"];
																	  }];
	return mapping;
}


+ (EKObjectMapping*)mappingForActivityObject
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEActivityObject class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSDictionary* redirection = @{@"id": @"uid",
																												  @"date": @"dateTime",
																												  @"type": @"typeString"};
																		  [mapping mapPropertiesFromDictionary:redirection];
																		  [mapping rkt_hasOne:[self mappingForActivityUserProfile] forKeyPath:@"profile"];
																		  [mapping rkt_hasOne:[self mappingForActivityObjectPhoto] forKeyPath:@"objectPhoto"];
																		  [mapping rkt_hasOne:[self mappingForActivityObjectPoll] forKeyPath:@"objectPoll"];
																	  }];
	return mapping;
}


+ (EKObjectMapping*)mappingForActivityObjectsList
{
	EKObjectMapping* mapping = [EKObjectMapping mappingForClass:[MEActivityObjectsList class]
																	  withBlock:^(EKObjectMapping *mapping) {
																		  NSArray* attributes = @[@"last", @"countResults"];
																		  [mapping mapPropertiesFromArray:attributes];
																		  [mapping rkt_hasMany:[self mappingForActivityObject] forKeyPath:@"objects"];
																	  }];
	return mapping;
}

@end

