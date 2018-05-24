//
//  UIApplication+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 20..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (JLKit)

+ (BOOL)isActive;

+ (void)openURL:(nullable NSURL*)url completion:(nullable void (^)(BOOL success))completion;

@end
