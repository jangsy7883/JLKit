//
//  UIFont+JLStyle.h
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 10. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(unsigned int, UIFontStyle)
{
    UIFontStyleRegular,
    UIFontStyleLight,
    UIFontStyleMedium,
    UIFontStyleSemiBold,
    UIFontStyleBold,
    UIFontStyleHeavy,
};

#define SystemFont(fontSize,fontStyle) [UIFont systemFontOfSize:fontSize style:fontStyle]

@interface UIFont (JLStyle)

+ (UIFont*)systemFontOfSize:(CGFloat)fontSize style:(UIFontStyle)style;

@end
