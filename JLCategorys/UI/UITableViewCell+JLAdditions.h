//
//  UITableViewCell+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Additions)

@property (nonatomic, readonly) NSIndexPath *indexPath;
@property (nonatomic, readonly) UITableView *superTableView;

@end
