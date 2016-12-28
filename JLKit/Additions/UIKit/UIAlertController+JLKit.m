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

#pragma mark - show

- (void)showAlert
{
    [self showAlertWithCompletion:nil];
}

- (void)showAlertWithCompletion:(void (^)(void))completion
{
    [[UIViewController visibleViewController] presentViewController:self animated:YES completion:completion];
}

#pragma mark - alertController

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                                 actions:(NSArray<UIAlertAction *> *)actions
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:(title == nil) ? @"" : title
                                                                             message:message
                                                                      preferredStyle:preferredStyle];
    
    for (UIAlertAction *action in actions)
    {
        [alertController addAction:action];
    }
    
    return alertController;
}

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                      confirmActionTitle:(NSString *)confirmActionTitle
                       cancelActionTitle:(NSString *)cancelActionTitle
                                 handler:(void (^)(BOOL isCancelAction))handler
{
    NSMutableArray *actions = [NSMutableArray array];
    
    if (cancelActionTitle.length > 0)
    {
        [actions addObject:[UIAlertAction actionWithCancelTitle:cancelActionTitle
                                                        handler:^(UIAlertAction * _Nonnull action)
                            {
                                if (handler) handler(YES);
                            }]];
    }
    
    if (confirmActionTitle.length > 0)
    {
        [actions addObject:[UIAlertAction actionWithTitle:confirmActionTitle
                                                  handler:^(UIAlertAction * _Nonnull action)
                            {
                                if (handler) handler(NO);
                            }]];
    }
    
    return [UIAlertController alertControllerWithTitle:title
                                               message:message
                                        preferredStyle:preferredStyle
                                               actions:actions];
}

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                  destructiveActionTitle:(NSString *)destructiveActionTitle
                       cancelActionTitle:(NSString *)cancelActionTitle
                                 handler:(void (^)(BOOL isCancelAction))handler
{
    NSMutableArray *actions = [NSMutableArray array];
    
    if (cancelActionTitle.length > 0)
    {
        [actions addObject:[UIAlertAction actionWithCancelTitle:cancelActionTitle
                                                        handler:^(UIAlertAction * _Nonnull action)
                            {
                                if (handler) handler(YES);
                            }]];
    }
    
    if (destructiveActionTitle.length > 0)
    {
        [actions addObject:[UIAlertAction actionWithDestructivelTitle:destructiveActionTitle
                                                              handler:^(UIAlertAction * _Nonnull action)
                            {
                                if (handler) handler(NO);
                            }]];
    }
    
    return [UIAlertController alertControllerWithTitle:title
                                               message:message
                                        preferredStyle:preferredStyle
                                               actions:actions];
}

#pragma mark - show alert

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
        confirmActionTitle:(NSString *)confirmActionTitle
                   handler:(void (^)(BOOL isCancelAction))handler
{
    [[self alertControllerWithTitle:title
                            message:message
                     preferredStyle:UIAlertControllerStyleAlert
                 confirmActionTitle:confirmActionTitle
                  cancelActionTitle:nil
                            handler:handler] show];
}

+ (void)showAlertWithMessage:(NSString *)message
          confirmActionTitle:(NSString *)confirmActionTitle
{
    [[self alertControllerWithTitle:@""
                            message:message
                     preferredStyle:UIAlertControllerStyleAlert
                 confirmActionTitle:confirmActionTitle
                  cancelActionTitle:nil
                            handler:nil] show];
}

- (void)setSourceView:(UIView*)sourceView permittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections
{
    self.popoverPresentationController.sourceView = sourceView;
    self.popoverPresentationController.sourceRect = sourceView.bounds;
    self.popoverPresentationController.permittedArrowDirections = permittedArrowDirections;
}


@end

@implementation UIAlertAction (JLKit)

+ (UIAlertAction*)actionWithTitle:(NSString*)title handler:(void (^)(UIAlertAction *action))handler
{
    return [UIAlertAction actionWithTitle:title
                                    style:UIAlertActionStyleDefault
                                  handler:handler];
}

+ (UIAlertAction*)actionWithCancelTitle:(NSString*)title handler:(void (^)(UIAlertAction *action))handler
{
    return [UIAlertAction actionWithTitle:title
                                    style:UIAlertActionStyleCancel
                                  handler:handler];
}

+ (UIAlertAction*)actionWithDestructivelTitle:(NSString*)title handler:(void (^)(UIAlertAction *action))handler
{
    return [UIAlertAction actionWithTitle:title
                                    style:UIAlertActionStyleDestructive
                                  handler:handler];
}

@end
