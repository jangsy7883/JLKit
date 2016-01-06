//
//  UITabBarItem+JLAdditions.m
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 12. 21..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UITabBarItem+JLAdditions.h"

@implementation UITabBarItem (JLAdditions)

+ (UITabBarItem*)tabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    return [[UITabBarItem alloc] initWithTitle:title
                                         image:image
                                 selectedImage:selectedImage];
}

@end