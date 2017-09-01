//
//  UICollectionView+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 20..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (JLKit)

- (nullable NSIndexPath *)indexPathForCellContainingView:(nullable UIView *)view;

- (void)performBatchUpdates:(void (^ __nullable)(void))updates animated:(BOOL)animated completion:(void (^ __nullable)(BOOL finished))completion;

@end
