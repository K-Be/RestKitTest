//
//  MEActivityObjectsList.m
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEActivityObjectsList.h"

@implementation MEActivityObjectsList

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.last = [dictionary objectForKey:@"last"];
		self.countResults = [dictionary objectForKey:@"countResults"];
		
		NSArray* activitiesDesc = [dictionary objectForKey:@"objects"];
		NSMutableArray* activities = [NSMutableArray arrayWithCapacity:[activitiesDesc count]];
		[activitiesDesc enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			MEActivityObject* activity = [[MEActivityObject alloc] initWithDictionary:obj];
			[activities addObject:activity];
		}];
		self.objects = activities;
	}
	
	return self;
}

@end
