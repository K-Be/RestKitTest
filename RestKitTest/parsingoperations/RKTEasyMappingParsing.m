//
//  RKTEasyMappingParsing.m
//  RestKitTest
//
//  Created by Andrew Romanov on 10.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "RKTEasyMappingParsing.h"
#import "EasyMappingFactory.h"


@interface RKTEasyMappingParsing ()

@property (nonatomic, strong) EKObjectMapping* mapping;

@end


@implementation RKTEasyMappingParsing

- (void)_prepareMappingModel
{
	EKObjectMapping* responseMapping = [EasyMappingFactory mappingForClass:[MEServerResponse class]];
	EKObjectMapping* objectsMapping = [EasyMappingFactory mappingForClass:[MEActivityObjectsList class]];
	[responseMapping hasOneMapping:objectsMapping forKey:@"data"];
	self.mapping = responseMapping;
}


- (MEServerResponse*)_makeMapping
{
	MEServerResponse* response = [EKMapper objectFromExternalRepresentation:self.source withMapping:_mapping];
	return response;
}

@end
