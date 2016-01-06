//
//  UIButton+Additions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIButton+JLAdditions.h"
#import "UIImage+JLAdditions.h"

@implementation UIButton (Additions)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    [self setBackgroundImage:[UIImage patternImageWithColor:backgroundColor]
                    forState:state];
}

@end
