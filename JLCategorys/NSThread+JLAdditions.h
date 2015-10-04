//
//  NSThread+Additions.h
//  onekm
//
//  Created by IM049 on 2015. 5. 31..
//  Copyright (c) 2015년 ces. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThread (Block)

+ (void)afterDelay:(NSTimeInterval)afterDelay task:(void (^)(void))task;

+ (void)backgroundTask:(void (^)(void))completion;
+ (void)mainTask:(void (^)(void))completion;

@end
