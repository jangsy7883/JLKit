 //
//  NSIndexPath+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NSIndexPathMake(row,section) [NSIndexPath indexPathForRow:row inSection:section]

@interface NSIndexPath (Additions)

- (BOOL)isEqualToIndexPath:(NSIndexPath*)indexPath;

@end
