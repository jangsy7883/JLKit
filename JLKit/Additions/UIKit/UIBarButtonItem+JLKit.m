//
//  UIBarButtonItem+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIBarButtonItem+JLKit.h"
#import "UIColor+JLKit.h"
@implementation UIBarButtonItem (Additions)

+ (UIBarButtonItem*)barButtonItemWithTitle:(NSString *)title
                                       font:(UIFont *)font
                                  textColor:(UIColor*)textColor
                                     target:(id)target
                                     action:(SEL)action
{

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:target
                                                            action:action];
    
    [item setTitleTextAttributes:@{
                                   NSFontAttributeName:font,
                                   NSForegroundColorAttributeName:textColor,
                                   }
                        forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{
                                   NSFontAttributeName:font,
                                   NSForegroundColorAttributeName:textColor.darkerColor,
                                   }
                        forState:UIControlStateHighlighted];
    
    return item;
}

+ (UIBarButtonItem*)barButtonItemWithCustomImage:(UIImage *)image target:(id)target action:(SEL)action
{
    return [self barButtonItemWithCustomImage:image highlightedImage:nil target:target action:action];
}

+ (UIBarButtonItem*)barButtonItemWithCustomImage:(UIImage *)image highlightedImage:(UIImage*)highlightedImage target:(id)target action:(SEL)action
{
    return [self barButtonItemWithCustomImage:image highlightedImage:highlightedImage contentEdgeInsets:UIEdgeInsetsZero target:target action:action];
}

+ (UIBarButtonItem*)barButtonItemWithCustomImage:(UIImage *)image highlightedImage:(UIImage*)highlightedImage contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    [button setContentEdgeInsets:contentEdgeInsets];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem*)barButtonItemWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithImage:image
                                            style:UIBarButtonItemStylePlain
                                           target:target
                                           action:action];
}

+ (UIBarButtonItem*)barButtonItemWithCustomView:(UIView*)customView
{
    return [[UIBarButtonItem alloc] initWithCustomView:customView];
}

+ (UIBarButtonItem*)barButtonItemWithFixedSpace:(CGFloat)fixedSpace
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item.width = fixedSpace;
    
    return item;
}

@end
