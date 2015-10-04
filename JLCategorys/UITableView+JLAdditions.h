//
//  UITableView+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Additions)

- (NSIndexPath *)indexPathForCellContainingView:(UIView *)view;

- (void)registerNibNamed:(NSString*)nibNamed forHeaderFooterViewReuseIdentifier:(NSString *)identifier;
- (void)registerNibNamed:(NSString*)nibNamed forCellReuseIdentifier:(NSString *)identifier;


@end
