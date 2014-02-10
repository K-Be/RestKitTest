//
//  RKTParsingOperator.h
//  RestKitTest
//
//  Created by Andrew Romanov on 07.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKTParsingResult.h"


@protocol RKTParsingOperatorDelegate;
@interface RKTParsingOperator : NSObject

@property (nonatomic, weak) id<RKTParsingOperatorDelegate> delegate;
@property (nonatomic, strong) id source;
@property (nonatomic, weak) NSOperationQueue* queue;

- (void)start;
- (BOOL)isFinishedAllParsing;

@end


@protocol RKTParsingOperatorDelegate <NSObject>

- (void)rktParsingOperator:(RKTParsingOperator*)sender finishedParsingWithResult:(RKTParsingResult*)result;

@end
