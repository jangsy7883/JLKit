//
//  UIActivityViewController+JLKit.m
//  JLKit
//
//  Created by Woody on 2016. 11. 3..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import "UIActivityViewController+JLKit.h"
#import "UIViewController+JLKit.h"

@implementation UIActivityViewController (JLKit)

+ (void)showWithActivityItems:(NSArray *)activityItems {
    [self showWithActivityItems:activityItems activities:nil option:nil];
}

+ (void)showWithActivityItems:(NSArray *)activityItems
                   activities:(NSArray<UIActivity *> *)activities
                       option:(void (^)(UIActivityViewController *activityViewController))option {
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc]initWithActivityItems:activityItems
                                                                                        applicationActivities:activities];
    
    if (option) {
        option(activityViewController);
    }
    
    [[UIViewController visibleViewController] presentViewController:activityViewController animated:YES completion:nil];
}

@end
