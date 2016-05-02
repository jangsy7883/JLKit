//
//  UIFont+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIFont+JLKit.h"

@implementation UIFont (JLKit)

+ (UIFont*)systemFontOfSize:(CGFloat)fontSize style:(UIFontStyle)style
{
    UIFont *font = nil;

    if ([[UIFont class] respondsToSelector:@selector(systemFontOfSize:weight:)])
    {
        CGFloat weight = [self weightForFontStyle:style];
        
        font = [UIFont systemFontOfSize:fontSize weight:weight];
    }
    else
    {
        NSString *fontName = [self fontNameForFontStyle:style];
        
        font = [UIFont fontWithName:fontName size:fontSize];
    }
    
    if (font == nil)
    {
        switch (style)
        {
            case UIFontStyleSemiBold:
            case UIFontStyleBold:
                font = [UIFont boldSystemFontOfSize:fontSize];
                break;
            default:
                font = [UIFont systemFontOfSize:fontSize];
                break;
        }
    }
    
    return font;
}

+ (CGFloat)weightForFontStyle:(UIFontStyle)style
{
    switch (style) {
        case UIFontStyleLight:
            return  UIFontWeightLight;
            break;
        case UIFontStyleMedium:
            return  UIFontWeightMedium;
            break;
        case UIFontStyleSemiBold:
            return  UIFontWeightSemibold;
            break;
        case UIFontStyleBold:
            return  UIFontWeightBold;
            break;
        case UIFontStyleHeavy:
            return  UIFontWeightHeavy;
            break;
        default: //UIFontStyleRegular
            return UIFontWeightRegular;
            break;
    }
}

+ (NSString*)fontNameForFontStyle:(UIFontStyle)style
{
    switch (style) {
        case UIFontStyleLight:
            return  @".HelveticaNeueInterface-Light";
            break;
        case UIFontStyleMedium:
            return  @"HelveticaNeue-Medium";
            break;
        case UIFontStyleSemiBold:
        case UIFontStyleBold:
            return  @".HelveticaNeueInterface-MediumP4";
            break;
        case UIFontStyleHeavy:
            return  @".HelveticaNeueInterface-Heavy";
            break;
        default: //UIFontStyleRegular
            return @".HelveticaNeueInterface-Regular";
            break;
    }
}

@end
