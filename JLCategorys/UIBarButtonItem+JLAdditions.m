//
//  UIBarButtonItem+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIBarButtonItem+JLAdditions.h"

@implementation UIBarButtonItem (Additions)

+ (UIBarButtonItem*)barButtonItemWithtButtonImage:(UIImage *)image target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem*)barButtonItemWithtImage:(UIImage *)image style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithImage:image
                                            style:style
                                           target:target
                                           action:action];
}

+ (UIBarButtonItem*)barButtonItemWithtImage:(UIImage *)image target:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithImage:image
                                            style:UIBarButtonItemStylePlain
                                           target:target
                                           action:action];
}


@end
