//
//  UIViewController+JLAdditions.m
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 11. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIViewController+JLAdditions.h"

@implementation UIViewController (Additions)

- (UIViewController*)visibleViewController
{
    return [UIViewController visibleViewControllerForViewController:self];
}

+ (UIViewController*)visibleViewController
{
    UIViewController* viewController;
    
    if ([[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[UIViewController class]])
    {
        viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    }
    else if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)])
    {
        UIWindow *window = [[UIApplication sharedApplication].delegate performSelector:@selector(window)];
        
        if ([window.rootViewController isKindOfClass:[UIViewController class]])
        {
            viewController = window.rootViewController;
        }
    }
    else
    {
        for (UIWindow *window in [UIApplication sharedApplication].windows)
        {
            if ([window isKindOfClass:[UIWindow class]])
            {
                if ([window.rootViewController isKindOfClass:[UIViewController class]])
                {
                    viewController = window.rootViewController;
                    break;
                }
            }
        }
    }
    
    if (viewController)
    {
        return [UIViewController visibleViewControllerForViewController:viewController];
    }
    else
    {
        return nil;
    }
}

+ (UIViewController*)visibleViewControllerForViewController:(UIViewController*)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        return [self superViewContollerForViewController:(navigationController.viewControllers).lastObject];
    }
    else if ([viewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabController = (UITabBarController *)viewController;
        return [self superViewContollerForViewController:tabController.selectedViewController];
    }
    else if (viewController.presentedViewController)
    {
        return [self superViewContollerForViewController:viewController.presentedViewController];
    }
    return viewController;
}

@end
