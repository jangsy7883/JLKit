//
//  UIViewController+JLAdditions.m
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 11. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIViewController+JLAdditions.h"

@implementation UIViewController (Additions)

- (UIViewController*)superViewContoller
{
    return [UIViewController superViewContollerForViewController:self];
}

+ (UIViewController*)superViewContollerForViewController:(UIViewController*)viewController
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
