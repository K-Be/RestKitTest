//
//  RKTParsingOperationBase.h
//  RestKitTest
//
//  Created by Andrew Romanov on 06.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Model.h"


@protocol RKTParsingOperationBaseDelegate;
@interface RKTParsingOperationBase : NSOperation

@property (nonatomic, weak) id<RKTParsingOperationBaseDelegate> delegate;
@property (nonatomic) NSInteger numberOfAttempts;
@property (nonatomic, strong) NSDictionary* source;

@property (nonatomic, readonly) NSTimeInterval averageTime;
@property (nonatomic, readonly) BOOL successed;

@end


@protocol RKTParsingOperationBaseDelegate <NSObject>

- (void)rktParsingOperationFinished:(RKTParsingOperationBase*)sender;

@end



@interface  RKTParsingOperationBase (Overriden)

- (void)_prepareMappingModel;
- (MEServerResponse*)_makeMapping;

@end

