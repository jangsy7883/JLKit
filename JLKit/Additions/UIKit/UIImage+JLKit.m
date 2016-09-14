//
//  UIImage+Additions.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIImage+JLKit.h"

@implementation UIImage (Additions)

- (UIImage*)centerResizableImage
{
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(self.size.height/2-1,
                                                              self.size.width/2-1,
                                                              self.size.height/2+1,
                                                              self.size.width/2+1)
                                resizingMode:UIImageResizingModeStretch];
}


- (UIImage*)squareCropImage
{
    CGRect cropRect = CGRectZero;
    
    CGSize imageSize = self.size;
    CGFloat squareSize = MIN(imageSize.width, imageSize.width);
    
    cropRect.origin.x = (imageSize.width - squareSize) / 2;
    cropRect.origin.y = (imageSize.height - squareSize) / 2;
    cropRect.size.width = squareSize;
    cropRect.size.height = squareSize;
    
    CGFloat x = CGRectGetMinX(cropRect);
    CGFloat y = CGRectGetMinY(cropRect);
    CGFloat width = CGRectGetWidth(cropRect);
    CGFloat height = CGRectGetHeight(cropRect);
    
    UIImageOrientation imageOrientation = self.imageOrientation;
    if (imageOrientation == UIImageOrientationRight || imageOrientation == UIImageOrientationRightMirrored)
    {
        cropRect.origin.x = y;
        cropRect.origin.y = imageSize.width - CGRectGetWidth(cropRect) - x;
        cropRect.size.width = height;
        cropRect.size.height = width;
    }
    else if (imageOrientation == UIImageOrientationLeft || imageOrientation == UIImageOrientationLeftMirrored)
    {
        cropRect.origin.x = imageSize.height - CGRectGetHeight(cropRect) - y;
        cropRect.origin.y = x;
        cropRect.size.width = height;
        cropRect.size.height = width;
    }
    else if (imageOrientation == UIImageOrientationDown || imageOrientation == UIImageOrientationDownMirrored)
    {
        cropRect.origin.x = imageSize.width - CGRectGetWidth(cropRect) - x;;
        cropRect.origin.y = imageSize.height - CGRectGetHeight(cropRect) - y;
    }
    
    CGImageRef croppedCGImage = CGImageCreateWithImageInRect(self.CGImage, cropRect);
    UIImage *croppedImage = [UIImage imageWithCGImage:croppedCGImage scale:1.0f orientation:self.imageOrientation];
    CGImageRelease(croppedCGImage);
    return croppedImage;
}

+ (UIImage *)patternImageWithColor:(UIColor *)color
{
    return [UIImage patternImageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)patternImageWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, (CGRect){.size = size});
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageWithTintColor:(UIColor *)color
{
    if (color)
    {
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

- (CGSize)sizeToFitWidth:(CGFloat)width scaleAspectFit:(BOOL)scaleAspectFit
{
    CGSize fitSize = CGSizeZero;
    CGFloat ratio = (self.size.width * self.scale) / width;
    
    if (ratio > 1 || scaleAspectFit == NO)
    {
        fitSize.width = ceil((self.size.width * self.scale) / ratio);
        fitSize.height = ceil((self.size.height * self.scale) / ratio);
    }
    else
    {
        fitSize = CGSizeMake(self.size.width * self.scale, self.size.height * self.scale);
    }
    return fitSize;
}

- (CGSize)sizeToFit:(CGSize)size scaleAspectFit:(BOOL)scaleAspectFit
{
    CGSize fitSize = CGSizeZero;
    CGFloat ratioW = (self.size.width * self.scale) / size.width;
    CGFloat ratioH = (self.size.height * self.scale) / size.height;
    
    CGFloat ratio = MAX(ratioW, ratioH);
    
    if (ratio > 1 || scaleAspectFit == NO)
    {
        fitSize.width = ceil((self.size.width * self.scale) / ratio);
        fitSize.height = ceil((self.size.height * self.scale) / ratio);
    }
    else
    {
        fitSize = CGSizeMake(self.size.width * self.scale, self.size.height * self.scale);
    }
    return fitSize;
}

- (UIImage *)autoScaleWithOriginalScale:(CGFloat)scale
{
    CGRect newRect = CGRectMake(0.0, 0.0, self.size.width/scale, self.size.height/scale);
    
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:newRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (void)isEqual:(UIImage*)iamge toImage:(UIImage*)toImage completion:(void (^)(BOOL isEqual))completion
{
    if (completion == nil) return;
    
    if ((iamge == nil && toImage == nil) || [iamge isEqual:toImage])
    {
        completion(YES);
    }
    else if (iamge == nil || toImage == nil)
    {
        completion(NO);
    }
    else
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                       ^{
                           BOOL isEqual = [iamge isEqualToImage:toImage];
                           
                           dispatch_async(dispatch_get_main_queue(), ^{
                               completion(isEqual);
                           });
                       });
    }
}

- (BOOL)isEqualToImage:(UIImage*)toImage
{
    if (toImage == nil)
    {
        return NO;
    }
    
    NSData *data1 = UIImagePNGRepresentation(self);
    NSData *data2 = UIImagePNGRepresentation(toImage);
    
    return [data1 isEqualToData:data2];
}

- (UIImage*)originalRenderingImage
{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (BOOL)hasAlpha
{
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(self.CGImage);
    return (alphaInfo == kCGImageAlphaFirst || alphaInfo == kCGImageAlphaLast ||
            alphaInfo == kCGImageAlphaPremultipliedFirst || alphaInfo == kCGImageAlphaPremultipliedLast);
}

- (UIImage *)imageWithCropFrame:(CGRect)frame angle:(NSInteger)angle circularClip:(BOOL)circular
{
    UIImage *croppedImage = nil;
    UIGraphicsBeginImageContextWithOptions(frame.size, ![self hasAlpha] && !circular, self.scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        if (circular)
        {
            CGContextAddEllipseInRect(context, (CGRect){CGPointZero, frame.size});
            CGContextClip(context);
        }
        if (angle != 0)
        {
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
        else
        {
            CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
            [self drawAtPoint:CGPointZero];
        }
        
        croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithCGImage:croppedImage.CGImage scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
}

- (UIImage *)imageWithAngle:(NSInteger)angle
{
    return [self imageWithCropFrame:(CGRect){CGPointZero,self.size}
                              angle:angle
                       circularClip:NO];
}
@end
