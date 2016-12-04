//
//  UIAlertController+JLKit.h
//  JLKitDemo
//
//  Created by  Studio on 2016. 12. 4..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (JLKit)

+ (void)showAlertWithStyle:(UIAlertControllerStyle)style
                     title:(NSString*)title
                   message:(NSString*)message
                   actions:(NSArray<UIAlertAction *> *)actions;

+ (void)showAlertWithStyle:(UIAlertControllerStyle)style
                     title:(NSString *)title
                   message:(NSString *)message
        confirmActionTitle:(NSString *)confirmActionTitle
         cancelActionTitle:(NSString *)cancelActionTitle
                   handler:(void (^)(BOOL isCancelAction))handler;

+ (void)showAlertWithStyle:(UIAlertControllerStyle)style
                     title:(NSString *)title
                   message:(NSString *)message
    destructiveActionTitle:(NSString *)destructiveActionTitle
         cancelActionTitle:(NSString *)cancelActionTitle
                   handler:(void (^)(BOOL isCancelAction))handler;

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
        confirmActionTitle:(NSString *)confirmActionTitle
                   handler:(void (^)(BOOL isCancelAction))handler;

+ (void)showAlertWithMessage:(NSString *)message
          confirmActionTitle:(NSString *)confirmActionTitle;

@end
