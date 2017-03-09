//
//  NSThread+Additions.m
//  onekm
//
//  Created by Jangsy7883 on 2015. 5. 31..
//  Copyright © 2015년 ces. All rights reserved.
//

#import "NSThread+JLKit.h"

@implementation NSThread (Block)

+ (void)afterDelay:(NSTimeInterval)afterDelay task:(void (^)(void))task {
    if (task == nil) return;

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(afterDelay * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        task();
    });
}

+ (void)backgroundTask:(void (^)(void))task {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       task();
                   });
}

+ (void)mainTask:(void (^)(void))task {
    dispatch_async(dispatch_get_main_queue(), ^{
        task();
    });
}

@end
