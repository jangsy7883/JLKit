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
@property (nonatomic, readonly, strong) UIImage *squareCropImage;
@property (nonatomic, readonly) BOOL hasAlpha;

@property (nonatomic, readonly, strong) UIImage *originalRenderingImage;

+ (UIImage *)imageNamed:(NSString *)name orientation:(UIImageOrientation)orientation;

+ (UIImage *)patternImageWithColor:(UIColor *)color;
+ (UIImage *)patternImageWithColor:(UIColor *)color size:(CGSize)size;

+ (void)isEqual:(UIImage*)iamge toImage:(UIImage*)toImage completion:(void (^)(BOOL isEqual))completion;

- (CGSize)sizeToFitWidth:(CGFloat)width scaleAspectFit:(BOOL)scaleAspectFit;
- (CGSize)sizeToFit:(CGSize)size scaleAspectFit:(BOOL)scaleAspectFit;

- (UIImage *)autoScaleWithOriginalScale:(CGFloat)scale;

- (UIImage *)imageWithTintColor:(UIColor *)color;
- (UIImage *)imageWithCropFrame:(CGRect)frame angle:(NSInteger)angle circularClip:(BOOL)circular;
- (UIImage *)imageWithAngle:(NSInteger)angle;

- (BOOL)isEqualToImage:(UIImage*)toImage;

@end
