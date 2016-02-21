//
//  UITableViewCell+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UITableViewCell+JLAdditions.h"

@implementation UITableViewCell (Additions)

- (NSIndexPath*)indexPath
{
    UITableView *tableView = self.superTableView;
    if (tableView) {
        return [tableView indexPathForCell:self];
    }
    return nil;
}

- (UITableView *)superTableView
{
    id view = self.superview;
    while (view != nil) {
        if ([view isKindOfClass:[UITableView class]])
        {
            return view;
        }
        else
        {
            view = [view superview];
        }
    }
    return nil;
}
@end
