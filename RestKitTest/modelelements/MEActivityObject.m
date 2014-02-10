//
//  MEActivityObject.m
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEActivityObject.h"


@implementation MEActivityObject


- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.uid = [dictionary objectForKey:@"id"];
		self.dateTime =[dictionary objectForKey:@"date"];
		self.typeString = [dictionary objectForKey:@"type"];
		
		self.profile = [[MEActivityUserProfile alloc] initWithDictionary:[dictionary objectForKey:@"profile"]];
		NSDictionary* photoDesc = [dictionary objectForKey:@"objectPhoto"];
		if (photoDesc)
		{
			self.objectPhoto = [[MEActivityObjectPhoto alloc] initWithDictionary:photoDesc];
		}
		
		NSDictionary* pollDesc = [dictionary objectForKey:@"objectPoll"];
		if (pollDesc)
		{
			self.objectPoll = [[MEActivityObjectPoll alloc] initWithDictionary:pollDesc];
		}
	}
	
	return self;
}

@end


