//
//  UICollectionView+JLAdditions.m
//  JLCategoryDemo
//
//  Created by Jangsy7883 on 2015. 12. 20..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UICollectionView+JLAdditions.h"

@implementation UICollectionView (JLAdditions)

- (NSIndexPath *)indexPathForCellContainingView:(UIView *)view
{
    while (view != nil) {
        if ([view isKindOfClass:[UICollectionViewCell class]]) {
            return [self indexPathForCell:(UICollectionViewCell *)view];
        } else {
            view = view.superview;
        }
    }
    return nil;
}

@end
