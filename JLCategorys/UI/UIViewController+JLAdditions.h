//
//  UIViewController+JLAdditions.h
//  JLCategoryDemo
//
//  Created by Jangsy7883 on 2015. 11. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)

@property (nonatomic, readonly, strong) UIViewController *visibleViewController;

+ (UIViewController*)visibleViewController;
+ (UIViewController*)visibleViewControllerForViewController:(UIViewController*)viewController;

@end
