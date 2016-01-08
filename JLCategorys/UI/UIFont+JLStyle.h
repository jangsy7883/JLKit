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

#define Font(fontSize,fontStyle) [UIFont systemFontOfSize:fontSize style:fontStyle]

#define Font_Regular(fontSize) [UIFont systemFontOfSize:fontSize style:UIFontStyleRegular]
#define Font_Light(fontSize) [UIFont systemFontOfSize:fontSize style:UIFontStyleLight]
#define Font_Medium(fontSize) [UIFont systemFontOfSize:fontSize style:UIFontStyleMedium]
#define Font_SemiBold(fontSize) [UIFont systemFontOfSize:fontSize style:UIFontStyleSemiBold]
#define Font_Bold(fontSize) [UIFont systemFontOfSize:fontSize style:UIFontStyleBold]

@interface UIFont (JLStyle)

+ (UIFont*)systemFontOfSize:(CGFloat)fontSize style:(UIFontStyle)style;

@end
