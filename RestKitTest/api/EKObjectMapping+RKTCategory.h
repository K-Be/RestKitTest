//
//  EKObjectMapping+RKTCategory.h
//  RestKitTest
//
//  Created by Andrew Romanov on 30/11/2016.
//  Copyright © 2016 Andrew Romanov. All rights reserved.
//

#import <EasyMapping/EasyMapping.h>

@interface EKObjectMapping (RKTCategory)

- (void)rkt_hasOne:(EKObjectMapping *)objectMapping forKeyPath:(NSString *)keyPath;
- (void)rkt_hasOne:(EKObjectMapping *)objectMapping forKeyPath:(NSString *)keyPath forProperty:(NSString *)property;
- (void)rkt_hasMany:(EKObjectMapping *)objectMapping forKeyPath:(NSString *)keyPath;
- (void)rkt_hasMany:(EKObjectMapping *)objectMapping forKeyPath:(NSString *)keyPath forProperty:(NSString *)property;

@end
