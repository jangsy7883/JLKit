//
//  UIImage+Additions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIImage+JLAdditions.h"

@implementation UIImage (Additions)

- (UIImage*)resizableToCenter
{
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(self.size.height/2-1,
                                                              self.size.width/2-1,
                                                              self.size.height/2+1,
                                                              self.size.width/2+1)
                                resizingMode:UIImageResizingModeStretch];
}

+ (UIImage *)patternImageWithColor:(UIColor *)color
{
    return [UIImage imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
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
        UIGraphicsBeginImageContextWithOptions([self size], NO, [UIScreen mainScreen].scale);
        
        CGRect rect = CGRectZero;
        rect.size = [self size];
        
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

- (CGSize)sizeToFit:(CGSize)size originalSizeMax:(BOOL)originalSizeMax
{
    CGSize fitSize = CGSizeZero;
    CGFloat ratioW = (self.size.width * self.scale) / size.width;
    CGFloat ratioH = (self.size.height * self.scale) / size.height;
    
    CGFloat ratio = MAX(ratioW, ratioH);
    
    if (ratio > 1 || originalSizeMax == NO)
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

- (UIImage*)resizeRetinaHDImage
{
    CGRect newRect = CGRectMake(0.0, 0.0, self.size.width/3, self.size.height/3);
    
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:newRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
