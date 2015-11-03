//
//  UIFont+JLStyle.h
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 10. 24..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    UIFontStyleRegular,
    UIFontStyleLight,
    UIFontStyleMedium,
    UIFontStyleSemiBold,
    UIFontStyleBold,
    UIFontStyleHeavy,
}UIFontStyle;

#define SystemFont(fontSize,fontStyle) [UIFont systemFontOfSize:fontSize style:fontStyle]

@interface UIFont (JLStyle)

+ (UIFont*)systemFontOfSize:(CGFloat)fontSize style:(UIFontStyle)style;

@end
