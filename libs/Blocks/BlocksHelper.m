//
//  BlocksHelper.m
//  TagBrandClient
//
//  Created by Andrew Romanov on 08.08.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "BlocksHelper.h"

void runBlockOnMainQueueWithoutDeadlocking(void (^block)(void))
{
	if ([NSThread isMainThread])
	{
		block();
	}
	else
	{
		dispatch_sync(dispatch_get_main_queue(), block);
	}
}


void runBlockAsyncOnMainQueurWithoutDeadlocking(void (^block)(void))
{
	dispatch_async(dispatch_get_main_queue(), block);
}