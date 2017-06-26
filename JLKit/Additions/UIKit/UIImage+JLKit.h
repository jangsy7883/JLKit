//
//  UIImage+Additions.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additions)

@property (nonatomic, readonly, strong) UIImage *centerResizableImage;
@property (nonatomic, readonly, strong) UIImage *originalRenderingImage;
@property (nonatomic, readonly) BOOL hasAlpha;

+ (UIImage *)imageNamed:(NSString *)name orientation:(UIImageOrientation)orientation;

+ (UIImage *)patternImageWithColor:(UIColor *)color;
+ (UIImage *)patternImageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)imageWithTintColor:(UIColor *)color;

//
- (UIImage *)cropImageWithFrame:(CGRect)frame angle:(NSInteger)angle circularClip:(BOOL)circular;
- (UIImage *)imageWithAngle:(NSInteger)angle;

//
- (CGSize)sizeToFitByWidth:(CGFloat)width scaleAspectFit:(BOOL)scaleAspectFit;
- (CGSize)sizeToFit:(CGSize)size scaleAspectFit:(BOOL)scaleAspectFit;

//
+ (void)isEqual:(UIImage*)iamge toImage:(UIImage*)toImage completion:(void (^)(BOOL isEqual))completion;
- (BOOL)isEqualToImage:(UIImage*)toImage;

@end
