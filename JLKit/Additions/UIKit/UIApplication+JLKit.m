//
//  UIApplication+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 20..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIApplication+JLKit.h"

@implementation UIApplication (JLKit)

+ (BOOL)isActive
{
    return ([UIApplication sharedApplication].applicationState == UIApplicationStateActive);
}

@end
