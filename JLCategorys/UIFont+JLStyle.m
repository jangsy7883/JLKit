//
//  UIFont+JLStyle.m
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 10. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UIFont+JLStyle.h"

@implementation UIFont (JLStyle)

+ (UIFont*)heavySystemFontOfSize:(CGFloat)fontSize
{
    UIFont *font = [UIFont fontWithName:@".SFUIText-Heavy" size:fontSize]; //San Francisco
    
    if (font == nil) //iOS8
    {
        font = [UIFont fontWithName:@".HelveticaNeueInterface-Heavy" size:fontSize];
    }
    return font;
}

+ (UIFont*)lightSystemFontOfSize:(CGFloat)fontSize
{
    UIFont *font = [UIFont fontWithName:@".SFUIText-Light" size:fontSize]; //San Francisco
    
    if (font == nil) //Helvetica
    {
        font = [UIFont fontWithName:@".HelveticaNeueInterface-Light" size:fontSize];
    }
    return font;
}

+ (UIFont*)semiBoldSystemFontOfSize:(CGFloat)fontSize
{
    UIFont *font = [UIFont fontWithName:@".SFUIText-Semibold" size:fontSize]; //San Francisco
    
    if (font == nil) //Helvetica
    {
        font = [UIFont fontWithName:@".HelveticaNeueInterface-MediumP4" size:fontSize];
    }
    return font;
}

+ (UIFont*)mediumSystemFontOfSize:(CGFloat)fontSize
{
    UIFont *font = [UIFont fontWithName:@".SFUIText-Medium" size:fontSize];// San Francisco
    
    if (font == nil) //Helvetica
    {
        font = [UIFont fontWithName:@".HelveticaNeueInterface-MediumP4" size:fontSize];
    }
    return font;
}

@end
