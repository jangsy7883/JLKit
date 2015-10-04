//
//  UIView+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIView+JLAdditions.h"

@implementation UIView (Additions)

+ (id)viewWithNibNamed:(NSString*)nibNameOrNil
{
    NSArray* xibs = [[NSBundle mainBundle] loadNibNamed:nibNameOrNil owner:self options:nil];
    for (UIView *xib in xibs)
    {
        if ([[[self class] description] isEqualToString:[[xib class] description]])
        {
            return xib;
            break;
        }
    }
    return nil;
}

@end
