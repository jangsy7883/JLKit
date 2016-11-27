//
//  UIActivityViewController+JLKit.h
//  JLKit
//
//  Created by Woody on 2016. 11. 3..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActivityViewController (JLKit)

+ (void)showWithActivityItems:(NSArray *)activityItems;

+ (void)showWithActivityItems:(NSArray *)activityItems
                   activities:(NSArray<UIActivity *> *)activities
                       option:(void (^)(UIActivityViewController *activityViewController))option;


@end
