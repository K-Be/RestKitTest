//
//  RKTRestKitParsing.m
//  RestKitTest
//
//  Created by Andrew Romanov on 07.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "RKTRestKitParsing.h"

#import "MappingFactory.h"

#import <RestKit/RestKit.h>
#import <RestKit/RKObjectMappingOperationDataSource.h>


@interface RKTRestKitParsing ()

@property (nonatomic, strong) RKMappingOperation* mappingOperation;

@end


@implementation RKTRestKitParsing


- (void)_prepareMappingModel
{
	RKObjectMapping* activityListMapping = [MappingFactory mappingForClass:[MEActivityObjectsList class]];
	RKObjectMapping* responseMapping = [MappingFactory mappingForClass:[MEServerResponse class]];
	[responseMapping addRelationshipMappingWithSourceKeyPath:@"data" mapping:activityListMapping];
	
	self.mappingOperation = [[RKMappingOperation alloc] initWithSourceObject:self.source
																			 destinationObject:nil
																						  mapping:responseMapping];
}


- (MEServerResponse*)_makeMapping
{
	MEServerResponse* result = nil;
	NSError* error = nil;
	RKObjectMappingOperationDataSource* dataSource = [RKObjectMappingOperationDataSource new];
	_mappingOperation.dataSource = dataSource;
	if ([_mappingOperation performMapping:&error])
	{
		result = _mappingOperation.destinationObject;
	}
	
	return result;
}

@end
