//
//  BlocksHelper.h
//  TagBrandClient
//
//  Created by Andrew Romanov on 08.08.13.
//  Copyright (c) 2013 Andrew Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>

void runBlockOnMainQueueWithoutDeadlocking(void (^block)(void));
void runBlockAsyncOnMainQueurWithoutDeadlocking(void (^block)(void));