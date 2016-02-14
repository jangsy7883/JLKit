//
//  UIBarButtonItem+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Additions)

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)parm_title
                                       font:(UIFont *)parm_font
                                  textColor:(UIColor *)parm_textColor
                                     target:(id)target
                                     action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)image
                                 highlightedImage:(UIImage *)highlightedImage
                                           target:(id)target
                                           action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)image
                                           target:(id)target
                                           action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image
                                     target:(id)target
                                     action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithCustomView:(UIView *)customView;
+ (UIBarButtonItem *)barButtonItemWithFixedSpace:(CGFloat)fixedSpace;

@end
