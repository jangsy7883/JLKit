//
//  UITabBarItem+JLAdditions.h
//  JLCategoryDemo
//
//  Created by Jangsy7883 on 2015. 12. 21..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (JLAdditions)

+ (UITabBarItem*)tabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

+ (UITabBarItem*)tabBarItemWithTitle:(NSString *)title selectedImage:(UIImage *)selectedImage deselectTintColor:(UIColor*)deselectTintColor;

@end
