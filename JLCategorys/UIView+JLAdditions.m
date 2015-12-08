//
//  UIView+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIView+JLAdditions.h"

@implementation UIView (Additions)

+ (instancetype)viewWithNibNamed:(NSString*)nibNameOrNil
{
    @try {
        NSArray* xibs = [[NSBundle mainBundle] loadNibNamed:nibNameOrNil owner:self options:nil];
        for (UIView *xib in xibs)
        {
            if ([[[self class] description] isEqualToString:[[xib class] description]])
            {
                return xib;
            }
        }
    }
    @catch (NSException *exception) {}

    return nil;
}

@end
