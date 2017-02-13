//
//  UISearchBar+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2016. 4. 19..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import "UISearchBar+JLKit.h"

@implementation UISearchBar (JLKit)

- (UITextField*)textField {
    return [self searchSubviewsForTextFieldIn:self];
}

- (UITextField*)searchSubviewsForTextFieldIn:(UIView*)view {
    if ([view isKindOfClass:[UITextField class]]) {
        return (UITextField*)view;
    }
    UITextField *searchedTextField;
    for (UIView *subview in view.subviews) {
        searchedTextField = [self searchSubviewsForTextFieldIn:subview];
        if (searchedTextField)
        {
            break;
        }
    }
    return searchedTextField;
}

@end
