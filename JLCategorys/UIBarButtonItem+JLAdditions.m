//
//  UIBarButtonItem+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIBarButtonItem+JLAdditions.h"

@implementation UIBarButtonItem (Additions)

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
