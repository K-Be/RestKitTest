//
//  RKTParsingOperationBase.m
//  RestKitTest
//
//  Created by Andrew Romanov on 06.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "RKTParsingOperationBase.h"

#import "BlocksHelper.h"



@interface RKTParsingOperationBase ()

@property (nonatomic, strong) MEServerResponse* parsingResult;

@end


@interface RKTParsingOperationBase (Private)

- (void)validateParsingResult;

@end


@implementation RKTParsingOperationBase

- (id)init
{
	if (self = [super init])
	{
		_parsingTime = 0.0;
	}
	
	return self;
}


- (void)main
{
	if (![self isCancelled])
	{
		[self _prepareMappingModel];
		
		NSDate* startTime = [NSDate date];
		_parsingResult = [self _makeMapping];
		NSDate* endParsingTime = [NSDate date];
		
		_parsingTime = [endParsingTime timeIntervalSinceDate:startTime];
		
		[self validateParsingResult];
		
		runBlockOnMainQueueWithoutDeadlocking(^{
			if (![self isCancelled])
			{
				[self.delegate rktParsingOperationFinished:self];
			}
		});
	}
}

@end


@implementation RKTParsingOperationBase (Private)

- (void)validateParsingResult
{
	BOOL isValid = _parsingResult != nil;
	
	if (isValid)
	{
		MEActivityObjectsList* objects = _parsingResult.data;
		isValid = [objects.objects count] == 64;
	}
	
	_successed = isValid;
}

@end


#pragma mark -
@implementation  RKTParsingOperationBase (Overriden)

- (void)_prepareMappingModel
{
	
}


- (MEServerResponse*)_makeMapping
{
	return nil;
}

@end
