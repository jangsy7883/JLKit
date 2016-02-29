//
//  CALayer+JLAdditions.h
//  JLCategoryDemo
//
//  Created by Jangsy7883 on 2015. 12. 2..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (JLAdditions)

- (void)setShadowColor:(CGColorRef)shadowColor offset:(CGSize)offset radius:(CGFloat)radius;

@end
