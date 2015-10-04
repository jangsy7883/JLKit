//
//  UIScreen+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIScreen+JLAdditions.h"

@implementation UIScreen (Additions)

- (BOOL)isRetinaDisplay
{
    return ([UIScreen mainScreen].scale > 1);
}

@end
