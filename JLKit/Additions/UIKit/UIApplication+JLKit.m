//
//  UIApplication+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 20..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIApplication+JLKit.h"
#import "NSThread+JLKit.h"
@implementation UIApplication (JLKit)

+ (BOOL)isActive {
    return ([UIApplication sharedApplication].applicationState == UIApplicationStateActive);
}

+ (void)openURL:(NSURL*)url completion:(void (^)(BOOL success))completion {
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)])
        {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:completion];
        }
        else
        {
            BOOL success = [[UIApplication sharedApplication] openURL:url];
            if (completion)
            {
                if (success) {
                    [NSThread afterDelay:0.1
                                    task:^{
                                        completion(YES);
                                    }];
                }
                else
                {
                    completion(NO);
                }
            }
        }
    }
    else if (completion) {
        completion(NO);
    }
}

@end
