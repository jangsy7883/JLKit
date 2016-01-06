//
//  UIImage+Additions.h
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additions)

@property (nonatomic, readonly, strong) UIImage *resizableToCenter;

+ (UIImage *)patternImageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)imageWithTintColor:(UIColor *)color;

- (CGSize)sizeToFitWidth:(CGFloat)width scaleAspectFit:(BOOL)scaleAspectFit;

- (CGSize)sizeToFit:(CGSize)size scaleAspectFit:(BOOL)scaleAspectFit;

@property (nonatomic, readonly, strong) UIImage *resizeRetinaHDImage;

@end
