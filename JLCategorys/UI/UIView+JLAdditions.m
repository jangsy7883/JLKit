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

#pragma mark - GETTERS

- (UIViewController*)superViewController
{
    for (UIView* next = self; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

#pragma mark - SETTERS

- (void)setTransformScale:(CGFloat)scale
{
    self.transform = CGAffineTransformScale(self.transform, scale, scale);
}

@end
