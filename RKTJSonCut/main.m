//
//  main.m
//  RKTJSonCut
//
//  Created by Andrew Romanov on 01/12/2016.
//  Copyright © 2016 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>


void holdOneElementInArray(NSMutableArray* array)
{
	if (array.count > 1)
	{
		NSRange rangeForRemoving = NSMakeRange(1, array.count - 1);
		[array removeObjectsInRange:rangeForRemoving];
	}
}


void holdOneElementInArraysOfDictionary(NSMutableDictionary* source)
{
	[source enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
		if ([obj isKindOfClass:[NSMutableArray class]])
		{
			holdOneElementInArray((NSMutableArray*)obj);
			
			if ([[obj firstObject] isKindOfClass:[NSMutableDictionary class]])
			{
				holdOneElementInArraysOfDictionary([obj firstObject]);
			}
		}
		else if ([obj isKindOfClass:[NSMutableDictionary class]])
		{
			holdOneElementInArraysOfDictionary(obj);
		}
	}];
}


int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSString* jsonFileSubPath = @"resources/jsonData.json";
		
		NSInputStream* inputSourceStream = [[NSInputStream alloc] initWithFileAtPath:jsonFileSubPath];
		[inputSourceStream open];
		NSError* readingError = nil;
		NSMutableDictionary* source = [NSJSONSerialization JSONObjectWithStream:inputSourceStream
																														 options:NSJSONReadingMutableContainers
																																			error:&readingError];
		[inputSourceStream close];
		
		holdOneElementInArraysOfDictionary(source);
		
		if ([[NSFileManager defaultManager] isReadableFileAtPath:@"Result.json"])
		{
			[[NSFileManager defaultManager] removeItemAtPath:@"Result.json"
																								 error:nil];
		}
		
		NSData* shortJSON = [NSJSONSerialization dataWithJSONObject:source options:NSJSONWritingPrettyPrinted error:nil];
		[shortJSON writeToFile:@"Result.json" atomically:YES];
		
		// insert code here...
	    NSLog(@"Hello, World!");
	}
    return 0;
}
