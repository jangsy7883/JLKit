//
//  UIBarButtonItem+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Additions)

+ (UIBarButtonItem*)barButtonItemWithTtitle:(NSString *)parm_title
                                       font:(UIFont *)parm_font
                                  textColor:(UIColor*)parm_textColor
                                     target:(id)target
                                     action:(SEL)action;

+ (UIBarButtonItem*)barButtonItemWithtButtonImage:(UIImage *)image
                                 highlightedImage:(UIImage *)highlightedImage
                                           target:(id)target
                                           action:(SEL)action;

+ (UIBarButtonItem*)barButtonItemWithtImage:(UIImage *)image
                                      style:(UIBarButtonItemStyle)style
                                     target:(id)target
                                     action:(SEL)action;

+ (UIBarButtonItem*)barButtonItemWithtImage:(UIImage *)image
                                     target:(id)target
                                     action:(SEL)action;

+ (UIBarButtonItem*)barButtonItemWithCustomView:(UIView*)customView;
+ (UIBarButtonItem*)barButtonItemWithFixedSpace:(CGFloat)fixedSpace;

@end
