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

@end
