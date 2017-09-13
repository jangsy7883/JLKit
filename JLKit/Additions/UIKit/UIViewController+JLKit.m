//
//  UIViewController+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 11. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIViewController+JLKit.h"

@implementation UIViewController (Additions)

- (BOOL)isPresented {
    if ((self.navigationController.viewControllers).count > 0) {
        if (self != self.navigationController.viewControllers[0])
        {
            return NO;
        }
    }
    if ([self respondsToSelector:@selector(presentingViewController)]) {
        return (self.presentingViewController.presentedViewController == self ||
                self.navigationController.presentingViewController.presentedViewController == self.navigationController ||
                [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]]);
    }
    else {
        return (self.parentViewController.presentedViewController == self ||
                self.navigationController.parentViewController.presentedViewController == self.navigationController ||
                [self.tabBarController.parentViewController isKindOfClass:[UITabBarController class]]);
    }
    
    return NO;
}

+ (UIViewController*)visibleViewController {
    UIViewController* viewController;
    
    if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]) {
        UIWindow *window = [[UIApplication sharedApplication].delegate performSelector:@selector(window)];
        
        if ([window.rootViewController isKindOfClass:[UIViewController class]])
        {
            viewController = window.rootViewController;
        }
    }
    else if ([[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[UIViewController class]]) {
        viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    }
    else {
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
    
    if (viewController) {
        return [UIViewController visibleViewControllerForViewController:viewController];
    }
    else {
        return nil;
    }
}

+ (UIViewController*)visibleViewControllerForViewController:(UIViewController*)viewController {
    if (viewController.presentedViewController) {
        return [self visibleViewControllerForViewController:viewController.presentedViewController];
    }
    else if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        if (navigationController.visibleViewController)
        {
            return [self visibleViewControllerForViewController:navigationController.visibleViewController];
        }
    }
    else if ([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabController = (UITabBarController *)viewController;
        if (tabController.selectedViewController)
        {
            return [self visibleViewControllerForViewController:tabController.selectedViewController];
        }
    }
    
    return viewController;
}

@end
