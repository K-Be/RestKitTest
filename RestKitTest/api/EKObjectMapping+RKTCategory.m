//
//  EKObjectMapping+RKTCategory.m
//  RestKitTest
//
//  Created by Andrew Romanov on 30/11/2016.
//  Copyright © 2016 Andrew Romanov. All rights reserved.
//

#import "EKObjectMapping+RKTCategory.h"


@implementation EKObjectMapping (RKTCategory)

- (void)rkt_hasOne:(EKObjectMapping *)objectMapping forKeyPath:(NSString *)keyPath
{
	[self hasOne:objectMapping.objectClass forKeyPath:keyPath forProperty:keyPath withObjectMapping:objectMapping];
}


- (void)rkt_hasOne:(EKObjectMapping *)objectMapping forKeyPath:(NSString *)keyPath forProperty:(NSString *)property
{
	[self hasOne:objectMapping.objectClass forKeyPath:keyPath forProperty:property withObjectMapping:objectMapping];
}


- (void)rkt_hasMany:(EKObjectMapping *)objectMapping forKeyPath:(NSString *)keyPath
{
	[self hasMany:objectMapping.objectClass forKeyPath:keyPath forProperty:keyPath withObjectMapping:objectMapping];
}


- (void)rkt_hasMany:(EKObjectMapping *)objectMapping forKeyPath:(NSString *)keyPath forProperty:(NSString *)property
{
	[self hasMany:objectMapping.objectClass forKeyPath:keyPath forProperty:property withObjectMapping:objectMapping];
}

@end
