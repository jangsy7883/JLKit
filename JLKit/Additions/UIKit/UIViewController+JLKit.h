//
//  UIViewController+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 11. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)

@property (nonatomic, readonly, getter=isPresented) BOOL presented;

+ (UIViewController*)visibleViewController;
+ (UIViewController*)visibleViewControllerForViewController:(UIViewController*)viewController;

@end
