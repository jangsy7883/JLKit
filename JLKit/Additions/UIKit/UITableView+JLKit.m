//
//  UITableView+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UITableView+JLKit.h"

@implementation UITableView (Additions)

- (NSIndexPath *)indexPathForCellContainingView:(UIView *)view {
    while (view != nil) {
        if ([view isKindOfClass:[UITableViewCell class]])
        {
            return [self indexPathForCell:(UITableViewCell *)view];
        }
        else
        {
            view = view.superview;
        }
    }
    return nil;
}

- (void)registerNibNamed:(NSString*)nibNamed forHeaderFooterViewReuseIdentifier:(NSString *)identifier {
    UINib * nib = [UINib nibWithNibName:nibNamed bundle:nil];
    if (nib) {
        [self registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
    }
}

- (void)registerNibNamed:(NSString*)nibNamed forCellReuseIdentifier:(NSString *)identifier {
    UINib * nib = [UINib nibWithNibName:nibNamed bundle:nil];
    if (nib) {
        [self registerNib:nib forCellReuseIdentifier:identifier];
    }
}

@end
