//
//  UIAlertController+JLKit.h
//  JLKitDemo
//
//  Created by  Studio on 2016. 12. 4..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIAlertCancelAction(title) [UIAlertAction actionWithCancelTitle:title handler:nil]

@interface UIAlertController (JLKit)

- (void)showAlert;
- (void)showAlertWithCompletion:(void (^)(void))completion;

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                                 actions:(NSArray<UIAlertAction *> *)actions;

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                      confirmActionTitle:(NSString *)confirmActionTitle
                       cancelActionTitle:(NSString *)cancelActionTitle
                                 handler:(void (^)(BOOL isCancelAction))handler;

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
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

@interface UIAlertAction (JLKit)

+ (UIAlertAction *)actionWithTitle:(NSString*)title handler:(void (^)(UIAlertAction *action))handler;
+ (UIAlertAction *)actionWithCancelTitle:(NSString*)title handler:(void (^)(UIAlertAction *action))handler;
+ (UIAlertAction *)actionWithDestructivelTitle:(NSString*)title handler:(void (^)(UIAlertAction *action))handler;

@end
