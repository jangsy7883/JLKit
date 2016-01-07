//
//  NSIndexPath+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSIndexPath+JLAdditions.h"
#import <UIKit/UIKit.h>

@implementation NSIndexPath (Additions)

- (BOOL)isEqualToIndexPath:(NSIndexPath*)indexPath
{
	if (self == nil || indexPath == nil) {
		return NO;
	}
    
	return (self.row == indexPath.row && self.section == indexPath.section);
}

@end
