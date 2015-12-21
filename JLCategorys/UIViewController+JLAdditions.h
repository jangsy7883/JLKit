//
//  UIViewController+JLAdditions.h
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 11. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)

@property (nonatomic, readonly, strong) UIViewController *superViewContoller;

+ (UIViewController*)superViewController;
+ (UIViewController*)superViewContollerForViewController:(UIViewController*)viewController;

@end
