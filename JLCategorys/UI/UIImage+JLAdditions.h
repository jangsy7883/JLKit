//
//  UIImage+Additions.h
//  JLCategory
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additions)

@property (nonatomic, readonly, strong) UIImage *centerResizableImage;
@property (nonatomic, readonly, strong) UIImage *squareCropImage;

+ (UIImage *)patternImageWithColor:(UIColor *)color;
+ (UIImage *)patternImageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)imageWithTintColor:(UIColor *)color;

- (CGSize)sizeToFitWidth:(CGFloat)width scaleAspectFit:(BOOL)scaleAspectFit;
- (CGSize)sizeToFit:(CGSize)size scaleAspectFit:(BOOL)scaleAspectFit;

- (UIImage *)autoScaleWithOriginalScale:(CGFloat)scale;

+ (void)isEqual:(UIImage*)iamge toImage:(UIImage*)toImage completion:(void (^)(BOOL isEqual))completion;
- (BOOL)isEqualToImage:(UIImage*)toImage;

- (UIImage*)originalRenderingImage;

@end
