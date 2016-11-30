//
//  RKTEasyMappingParsing.m
//  RestKitTest
//
//  Created by Andrew Romanov on 10.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "RKTEasyMappingParsing.h"
#import "EasyMappingFactory.h"
#import "EKObjectMapping+RKTCategory.h"


@interface RKTEasyMappingParsing ()

@property (nonatomic, strong) EKObjectMapping* mapping;

@end


@implementation RKTEasyMappingParsing

- (void)_prepareMappingModel
{
	EKObjectMapping* responseMapping = [EasyMappingFactory mappingForClass:[MEServerResponse class]];
	EKObjectMapping* objectsMapping = [EasyMappingFactory mappingForClass:[MEActivityObjectsList class]];
	[responseMapping rkt_hasOne:objectsMapping forKeyPath:@"data"];
	self.mapping = responseMapping;
}


- (MEServerResponse*)_makeMapping
{
	MEServerResponse* response = [EKMapper objectFromExternalRepresentation:self.source withMapping:_mapping];
	return response;
}

@end
