//
//  NSError+JLKit.m
//  JLKit
//
//  Created by Studio on 2016. 7. 24..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import "NSError+JLKit.h"
#import "UIViewController+JLKit.h"

@implementation NSError (JLKit)

- (void)showAlertWithActionTitle:(NSString*)doneButtonTitle animated:(BOOL)animated {
    UIViewController *visibleViewController = [UIViewController visibleViewController];
    
    if ([visibleViewController respondsToSelector:@selector(presentViewController:animated:completion:)]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                                 message:self.localizedDescription
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:doneButtonTitle
                                                            style:UIAlertActionStyleCancel
                                                          handler:nil]];
        
        [[UIViewController visibleViewController] presentViewController:alertController
                                                               animated:animated
                                                             completion:nil];
    }
}

@end
