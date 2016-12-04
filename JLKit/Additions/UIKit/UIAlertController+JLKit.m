//
//  UIAlertController+JLKit.m
//  JLKitDemo
//
//  Created by  Studio on 2016. 12. 4..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import "UIAlertController+JLKit.h"
#import "UIViewController+JLKit.h"
#import "JLKitDefine.h"

@implementation UIAlertController (JLKit)

+ (void)showAlertWithStyle:(UIAlertControllerStyle)style
                     title:(NSString*)title
                   message:(NSString*)message
                   actions:(NSArray<UIAlertAction *> *)actions
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:style];
    
    for (UIAlertAction *action in actions)
    {
        [alertController addAction:action];
    }
    
    [[UIViewController visibleViewController] presentViewController:alertController animated:YES completion:nil];
}

+ (void)showAlertWithStyle:(UIAlertControllerStyle)style
                     title:(NSString *)title
                   message:(NSString *)message
        confirmActionTitle:(NSString *)confirmActionTitle
         cancelActionTitle:(NSString *)cancelActionTitle
                   handler:(void (^)(BOOL isCancelAction))handler
{
    NSMutableArray *actions = [NSMutableArray array];
    
    if (cancelActionTitle.length > 0)
    {
        [actions addObject:[UIAlertAction actionWithTitle:cancelActionTitle
                                                    style:UIAlertActionStyleCancel
                                                  handler:^(UIAlertAction * _Nonnull action)
                            {
                                if (handler)
                                {
                                    handler(YES);
                                }
                            }]];
    }
    
    if (confirmActionTitle.length > 0)
    {
        [actions addObject:[UIAlertAction actionWithTitle:confirmActionTitle
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * _Nonnull action)
                            {
                                if (handler)
                                {
                                    handler(NO);
                                }
                            }]];
    }
    
    [self showAlertWithStyle:style
                       title:title
                     message:message
                     actions:actions];
}

+ (void)showAlertWithStyle:(UIAlertControllerStyle)style
                     title:(NSString *)title
                   message:(NSString *)message
    destructiveActionTitle:(NSString *)destructiveActionTitle
         cancelActionTitle:(NSString *)cancelActionTitle
                   handler:(void (^)(BOOL isCancelAction))handler
{
    NSMutableArray *actions = [NSMutableArray array];
    
    if (cancelActionTitle.length > 0)
    {
        [actions addObject:[UIAlertAction actionWithTitle:cancelActionTitle
                                                    style:UIAlertActionStyleCancel
                                                  handler:^(UIAlertAction * _Nonnull action)
                            {
                                if (handler)
                                {
                                    handler(YES);
                                }
                            }]];
    }
    
    if (destructiveActionTitle.length > 0)
    {
        [actions addObject:[UIAlertAction actionWithTitle:destructiveActionTitle
                                                    style:UIAlertActionStyleDestructive
                                                  handler:^(UIAlertAction * _Nonnull action)
                            {
                                if (handler)
                                {
                                    handler(NO);
                                }
                            }]];
    }
    
    
    [self showAlertWithStyle:style
                       title:title
                     message:message
                     actions:actions];
}

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
        confirmActionTitle:(NSString *)confirmActionTitle
                   handler:(void (^)(BOOL isCancelAction))handler
{
    [self showAlertWithStyle:UIAlertControllerStyleAlert
                       title:title
                     message:message
          confirmActionTitle:confirmActionTitle
           cancelActionTitle:nil
                     handler:handler];
}

+ (void)showAlertWithMessage:(NSString *)message
          confirmActionTitle:(NSString *)confirmActionTitle
{
    [self showAlertWithStyle:UIAlertControllerStyleAlert
                       title:nil
                     message:message
          confirmActionTitle:confirmActionTitle
           cancelActionTitle:nil
                     handler:nil];
}



@end
