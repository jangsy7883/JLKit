//
//  CALayer+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 2..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "CALayer+JLKit.h"
#import <UIKit/UIKit.h>

@implementation CALayer (JLKit)

- (void)setShadowColor:(CGColorRef)shadowColor offset:(CGSize)offset radius:(CGFloat)radius {
    self.shadowColor = shadowColor;
    self.shadowOffset = offset;
    self.shadowRadius = radius;
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
}

@end
