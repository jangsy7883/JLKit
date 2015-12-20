//
//  UIBarButtonItem+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Additions)

+ (UIBarButtonItem*)barButtonItemWithtButtonImage:(UIImage *)image
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
