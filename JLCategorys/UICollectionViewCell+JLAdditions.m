//
//  UICollectionViewCell+JLAdditions.m
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 12. 20..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UICollectionViewCell+JLAdditions.h"

@implementation UICollectionViewCell (JLAdditions)

- (NSIndexPath*)indexPath
{
    UICollectionView*collectionView = [self superCollectionView];
    if (collectionView) {
        return [collectionView indexPathForCell:self];
    }
    return nil;
}

- (UICollectionView *)superCollectionView
{
    id view = [self superview];
    while (view != nil) {
        if ([view isKindOfClass:[UICollectionView class]]) {
            return view;
        } else {
            view = [view superview];
        }
    }
    return nil;
}

@end
