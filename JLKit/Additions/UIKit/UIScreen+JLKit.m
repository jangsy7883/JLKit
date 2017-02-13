//
//  UIScreen+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIScreen+JLKit.h"

@implementation UIScreen (Additions)

- (BOOL)isRetinaDisplay {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0 || [UIScreen mainScreen].scale == 3.0)) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isRetinaHDDisplay {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && [UIScreen mainScreen].scale == 3.0) {
        return YES;
    } else {
        return NO;
    }
}
@end
