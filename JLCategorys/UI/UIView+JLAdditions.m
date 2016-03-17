//
//  UIView+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIView+JLAdditions.h"

@implementation UIView (Additions)

+ (instancetype)viewWithClass:(Class)viewClass
{
    return [self viewWithNibNamed:NSStringFromClass(viewClass)];
}

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

- (void)removeAllSubviews
{
    for (UIView *subview in self.subviews)
    {
        [subview removeFromSuperview];
    }
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

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

#pragma mark - SETTERS

- (void)setTransformScale:(CGFloat)scale
{
    self.transform = CGAffineTransformScale(self.transform, scale, scale);
}

- (void)setCornerRadius:(CGFloat)parm_cornerRadius
{
    self.layer.cornerRadius = parm_cornerRadius;
    
    if (parm_cornerRadius > 0)
    {
        self.clipsToBounds = YES;
    }
}

@end
