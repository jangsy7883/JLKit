//
//  UIImage+Additions.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIImage+JLKit.h"

@implementation UIImage (Additions)

- (UIImage *)centerResizableImage {
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(self.size.height/2-1,
                                                              self.size.width/2-1,
                                                              self.size.height/2+1,
                                                              self.size.width/2+1)
                                resizingMode:UIImageResizingModeStretch];
}

- (UIImage *)originalRenderingImage {
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)imageNamed:(NSString *)name orientation:(UIImageOrientation)orientation {
    UIImage *image = [UIImage imageNamed:name];
    if (image) {
        return [[UIImage alloc] initWithCGImage:image.CGImage
                                          scale:[UIScreen mainScreen].scale
                                    orientation:UIImageOrientationLeft];
    }
    return nil;
}

+ (UIImage *)patternImageWithColor:(UIColor *)color {
    return [UIImage patternImageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)patternImageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, (CGRect){.size = size});
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageWithTintColor:(UIColor *)color {
    if (color) {
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
        
        CGRect rect = CGRectZero;
        rect.size = self.size;
        
        [color set];
        UIRectFill(rect);
        
        [self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
    
    return self;
}

#pragma mark - equal

+ (void)isEqual:(UIImage *)iamge toImage:(UIImage *)toImage completion:(void (^)(BOOL isEqual))completion {
    if (completion == nil) return;
    
    if ((iamge == nil && toImage == nil) || [iamge isEqual:toImage]) {
        completion(YES);
    }
    else if (iamge == nil || toImage == nil) {
        completion(NO);
    }
    else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                       ^{
                           BOOL isEqual = [iamge isEqualToImage:toImage];
                           
                           dispatch_async(dispatch_get_main_queue(), ^{
                               completion(isEqual);
                           });
                       });
    }
}

- (BOOL)isEqualToImage:(UIImage *)toImage {
    if (toImage == nil) {
        return NO;
    }
    
    NSData *data1 = UIImagePNGRepresentation(self);
    NSData *data2 = UIImagePNGRepresentation(toImage);
    
    return [data1 isEqualToData:data2];
}

#pragma mark - size

- (CGSize)sizeToFitByWidth:(CGFloat)width scaleAspectFit:(BOOL)scaleAspectFit {
    CGSize fitSize = CGSizeZero;
    CGFloat ratio = (self.size.width * self.scale) / width;
    
    if (ratio > 1 || scaleAspectFit == NO) {
        fitSize.width = ceil((self.size.width * self.scale) / ratio);
        fitSize.height = ceil((self.size.height * self.scale) / ratio);
    }
    else {
        fitSize = CGSizeMake(self.size.width * self.scale, self.size.height * self.scale);
    }
    return fitSize;
}

- (CGSize)sizeToFit:(CGSize)size scaleAspectFit:(BOOL)scaleAspectFit {
    CGSize fitSize = CGSizeZero;
    CGFloat ratioW = (self.size.width * self.scale) / size.width;
    CGFloat ratioH = (self.size.height * self.scale) / size.height;
    
    CGFloat ratio = MAX(ratioW, ratioH);
    
    if (ratio > 1 || scaleAspectFit == NO) {
        fitSize.width = ceil((self.size.width * self.scale) / ratio);
        fitSize.height = ceil((self.size.height * self.scale) / ratio);
    }
    else {
        fitSize = CGSizeMake(self.size.width * self.scale, self.size.height * self.scale);
    }
    return fitSize;
}

#pragma mark - crop

- (UIImage *)cropImageWithFrame:(CGRect)frame angle:(NSInteger)angle circularClip:(BOOL)circular {
    UIImage *croppedImage = nil;
    UIGraphicsBeginImageContextWithOptions(frame.size, ![self hasAlpha] && !circular, self.scale); {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        if (circular) {
            CGContextAddEllipseInRect(context, (CGRect){CGPointZero, frame.size});
            CGContextClip(context);
        }
        if (angle != 0){
            UIImageView *imageView = [[UIImageView alloc] initWithImage:self];
            imageView.layer.minificationFilter = kCAFilterNearest;
            imageView.layer.magnificationFilter = kCAFilterNearest;
            imageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, angle * (M_PI/180.0f));
            CGRect rotatedRect = CGRectApplyAffineTransform(imageView.bounds, imageView.transform);
            UIView *containerView = [[UIView alloc] initWithFrame:(CGRect){CGPointZero, rotatedRect.size}];
            [containerView addSubview:imageView];
            imageView.center = containerView.center;
            CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
            [containerView.layer renderInContext:context];
        }
        else {
            CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
            [self drawAtPoint:CGPointZero];
        }
        
        croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithCGImage:croppedImage.CGImage scale:self.scale orientation:self.imageOrientation];
}

- (UIImage *)imageWithAngle:(NSInteger)angle {
    return [self cropImageWithFrame:(CGRect){CGPointZero,self.size}
                              angle:angle
                       circularClip:NO];
}

#pragma mark - GETTERS

- (BOOL)hasAlpha {
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(self.CGImage);
    return (alphaInfo == kCGImageAlphaFirst || alphaInfo == kCGImageAlphaLast ||
            alphaInfo == kCGImageAlphaPremultipliedFirst || alphaInfo == kCGImageAlphaPremultipliedLast);
}

@end
