//
//  UIFont+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 24..
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

#define Font(fontSize,fontWeight)       [UIFont systemFontOfSize:fontSize weight:fontWeight]

#define Font_Regular(fontSize)      Font(fontSize,UIFontWeightRegular)
#define Font_Light(fontSize)        Font(fontSize,UIFontWeightLight)
#define Font_Medium(fontSize)       Font(fontSize,UIFontWeightMedium)
#define Font_SemiBold(fontSize)     Font(fontSize,UIFontWeightSemibold)
#define Font_Bold(fontSize)         Font(fontSize,UIFontWeightBold)

@interface UIFont (JLKit)

+ (UIFont*)systemFontOfSize:(CGFloat)fontSize style:(UIFontStyle)style NS_DEPRECATED_IOS(7_0, 8_0);

@end
