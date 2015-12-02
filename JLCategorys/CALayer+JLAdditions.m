//
//  CALayer+JLAdditions.m
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 12. 2..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "CALayer+JLAdditions.h"
#import <UIKit/UIKit.h>

@implementation CALayer (JLAdditions)

- (void)setShadowColor:(CGColorRef)shadowColor offset:(CGSize)offset radius:(CGFloat)radius
{
    self.shadowColor = shadowColor;
    self.shadowOffset = offset;
    self.shadowRadius = radius;
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
}

@end
