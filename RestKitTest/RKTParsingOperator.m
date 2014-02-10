//
//  RKTParsingOperator.m
//  RestKitTest
//
//  Created by Andrew Romanov on 07.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "RKTParsingOperator.h"
#import "RKTRestKitParsing.h"
#import "RKTHandParsing.h"
#import "RKTEasyMappingParsing.h"


@interface RKTParsingOperator () <RKTParsingOperationBaseDelegate>

@property (nonatomic, strong) RKTRestKitParsing* parsingRestKit;
@property (nonatomic, strong) RKTHandParsing* handParsing;
@property (nonatomic, strong) RKTEasyMappingParsing* easyMappingParsing;

@end


@interface RKTParsingOperator (Private)

- (void)finishedParsingWithOepration:(RKTParsingOperationBase*)operationPtr resultType:(RKTParsingType)resultType;

@end


@implementation RKTParsingOperator

- (void)start
{
	_parsingRestKit = [[RKTRestKitParsing alloc] init];
	_parsingRestKit.source = _source;
	_parsingRestKit.delegate = self;
	
	_handParsing = [[RKTHandParsing alloc] init];
	_handParsing.source = _source;
	_handParsing.delegate = self;
	[_handParsing addDependency:_parsingRestKit];
	
	_easyMappingParsing = [[RKTEasyMappingParsing alloc] init];
	_easyMappingParsing.source = _source;
	_easyMappingParsing.delegate = self;
	[_easyMappingParsing addDependency:_handParsing];
	
	[self.queue addOperation:_parsingRestKit];
	[self.queue addOperation:_handParsing];
	[self.queue addOperation:_easyMappingParsing];
}


- (BOOL)isFinishedAllParsing
{
	BOOL isFinished = (_parsingRestKit == nil);
	return isFinished;
}


#pragma mark RKTParsingOperationBaseDelegate
- (void)rktParsingOperationFinished:(RKTParsingOperationBase*)sender
{
	if (sender == _parsingRestKit)
	{
		RKTParsingOperationBase* operation = _parsingRestKit;
		_parsingRestKit = nil;
		[self finishedParsingWithOepration:operation resultType:RKTParsingTypeRestKit];
	}
	else if (sender == _handParsing)
	{
		RKTParsingOperationBase* operation = _handParsing;
		_handParsing = nil;
		[self finishedParsingWithOepration:operation resultType:RKTParsingTypeByHand];
	}
	else if (sender == _easyMappingParsing)
	{
		RKTParsingOperationBase* operation = _easyMappingParsing;
		_easyMappingParsing = nil;
		[self finishedParsingWithOepration:operation resultType:RKTParsingTypeEasyMapping];
	}
}

@end


@implementation RKTParsingOperator (Private)

- (void)finishedParsingWithOepration:(RKTParsingOperationBase*)operationPtr resultType:(RKTParsingType)resultType
{
	RKTParsingResult* result = [RKTParsingResult parsingResultWithType:resultType
																					  time:operationPtr.parsingTime
																				successed:operationPtr.successed];
	[self.delegate rktParsingOperator:self finishedParsingWithResult:result];
}

@end
