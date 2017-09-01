//
//  UICollectionView+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 20..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UICollectionView+JLKit.h"

@implementation UICollectionView (JLKit)

- (nullable NSIndexPath *)indexPathForCellContainingView:(nullable UIView *)view {
    while (view != nil) {
        if ([view isKindOfClass:[UICollectionViewCell class]]) {
            return [self indexPathForCell:(UICollectionViewCell *)view];
        } else {
            view = view.superview;
        }
    }
    return nil;
}

- (void)performBatchUpdates:(void (^ __nullable)(void))updates animated:(BOOL)animated completion:(void (^ __nullable)(BOOL finished))completion {
    BOOL animationsEnabled = [UIView areAnimationsEnabled];

    [UIView setAnimationsEnabled:animated];
    [self performBatchUpdates:updates
                   completion:^(BOOL finished) {
                       if (completion) {
                           completion(finished);
                       }
                       [UIView setAnimationsEnabled:animationsEnabled];
                   }];
}


@end
