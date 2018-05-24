//
//  UITableViewCell+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Additions)

@property (nonatomic, readonly) NSIndexPath * _Nullable indexPath;
@property (nonatomic, readonly) UITableView * _Nullable superTableView;

@end
