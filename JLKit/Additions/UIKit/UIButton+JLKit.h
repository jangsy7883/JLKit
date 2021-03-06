//
//  UIButton+Additions.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Additions)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

- (void)centerVerticallyWithPadding:(float)padding;

- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
@end
