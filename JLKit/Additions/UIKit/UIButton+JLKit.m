//
//  UIButton+Additions.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIButton+JLKit.h"
#import "UIImage+JLKit.h"

@implementation UIButton (Additions)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage patternImageWithColor:backgroundColor]
                    forState:state];
}

- (void)centerVerticallyWithPadding:(float)padding {
    [self.titleLabel sizeToFit];
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGFloat totalHeight = (imageSize.height + titleSize.height + padding);
    
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height),
                                            0.0f,
                                            0.0f,
                                            - titleSize.width);
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0f,
                                            - imageSize.width,
                                            - (totalHeight - titleSize.height),
                                            0.0f);
}

- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    [self removeTarget:target action:nil forControlEvents:controlEvents];
    [self addTarget:target action:action forControlEvents:controlEvents];
}

@end
