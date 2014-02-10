//
//  MEPhotoSize.m
//  RestKitTest
//
//  Created by Andrew Romanov on 12.04.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import "MEPhotoSize.h"

@implementation MEPhotoSize

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	if (self = [super init])
	{
		self.width = [dictionary objectForKey:@"width"];
		self.height = [dictionary objectForKey:@"height"];
	}
	
	return self;
}


- (CGSize)CGSize
{
	CGSize size = CGSizeMake([_width floatValue], [_height floatValue]);
	return size;
}

@end
