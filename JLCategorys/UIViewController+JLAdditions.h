//
//  UIViewController+JLAdditions.h
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 11. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)

- (UIViewController*)rootViewContoller;
+ (UIViewController*)rootViewContollerForViewController:(UIViewController*)viewController;

@end
