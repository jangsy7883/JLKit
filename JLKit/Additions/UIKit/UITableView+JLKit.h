//
//  UITableView+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Additions)

- (nullable NSIndexPath *)indexPathForCellContainingView:(nullable UIView *)view;

- (void)registerNibNamed:(nonnull NSString*)nibNamed forHeaderFooterViewReuseIdentifier:(nonnull NSString *)identifier;
- (void)registerNibNamed:(nonnull NSString*)nibNamed forCellReuseIdentifier:(nonnull NSString *)identifier;


@end
