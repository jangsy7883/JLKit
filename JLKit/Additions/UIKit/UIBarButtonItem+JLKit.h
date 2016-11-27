//
//  UIBarButtonItem+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIBarImageButtonItemMake(_imageNamed,_target,_action) [UIBarButtonItem barButtonItemWithCustomImage:[UIImage imageNamed:_imageNamed] highlightedImage:nil contentEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 3) target:_target action:_action];

@interface UIBarButtonItem (Additions)

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)parm_title
                                       font:(UIFont *)parm_font
                                  textColor:(UIColor *)parm_textColor
                                     target:(id)target
                                     action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)image
                                           target:(id)target
                                           action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)image
                                 highlightedImage:(UIImage *)highlightedImage
                                           target:(id)target
                                           action:(SEL)action;

+ (UIBarButtonItem*)barButtonItemWithCustomImage:(UIImage *)image
                                highlightedImage:(UIImage*)highlightedImage
                               contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
                                          target:(id)target
                                          action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image
                                     target:(id)target
                                     action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithCustomView:(UIView *)customView;
+ (UIBarButtonItem *)barButtonItemWithFixedSpace:(CGFloat)fixedSpace;

@end
