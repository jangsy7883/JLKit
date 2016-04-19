//
//  UITabBarItem+JLAdditions.m
//  JLCategoryDemo
//
//  Created by Jangsy7883 on 2015. 12. 21..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UITabBarItem+JLAdditions.h"
#import "UIImage+JLAdditions.h"

@implementation UITabBarItem (JLAdditions)

+ (UITabBarItem*)tabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    return [[self alloc] initWithTitle:title
                                 image:image
                         selectedImage:selectedImage];
}

+ (UITabBarItem*)tabBarItemWithTitle:(NSString *)title selectedImage:(UIImage *)selectedImage deselectTintColor:(UIColor*)deselectTintColor
{
    return [[self alloc] initWithTitle:title
                                 image:[selectedImage imageWithTintColor:deselectTintColor]
                         selectedImage:selectedImage];
}

@end
