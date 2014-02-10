//
//  MEAPIError.m
//  RestKitTest
//
//  Created by Andrew Romanov on 08.02.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEAPIError.h"

@implementation MEAPIError

- (id)initWithDictionary:(NSDictionary*)dict
{
	if (self = [super init])
	{
		self.errorCode = [dict objectForKey:@"code"];
		self.message = [dict objectForKey:@"message"];
	}
	
	return self;
}


+ (MEAPIError*)apiErrorWithError:(NSError*)errorOrNil
{
	MEAPIError* apiError = [[MEAPIError alloc] init];
	if (errorOrNil)
	{
		apiError.errorCode = [NSNumber numberWithInteger:errorOrNil.code];
		apiError.message = [errorOrNil localizedDescription];
	}
	else
	{
		apiError.errorCode = @(0);
	}
	
	return apiError;
}


@end
