//
//  UICollectionViewCell+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 20..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (JLKit)

@property (nonatomic, readonly) NSIndexPath *indexPath;
@property (nonatomic, readonly) UICollectionView *superCollectionView;

@end
