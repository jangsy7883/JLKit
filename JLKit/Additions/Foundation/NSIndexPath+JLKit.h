 //
//  NSIndexPath+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NSIndexPathMake(row,section) [NSIndexPath indexPathForRow:row inSection:section]

@interface NSIndexPath (Additions)

- (BOOL)isEqualToIndexPath:(nonnull NSIndexPath*)indexPath;

@end
