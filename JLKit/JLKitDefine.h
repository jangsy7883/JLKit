//
//  JLKitDefine.h
//  JLKit
//
//  Created by  Studio on 2016. 11. 27..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#define CGFLOAT_PIXEL_SCALE (1/[UIScreen mainScreen].scale)
#define CGFLOAT_PIXEL(value) CGFLOAT_PIXEL_SCALE*value

#define IsValid(value) (value != nil && IsNSNull(value) == NO && ([value isKindOfClass:[NSString class]] && [(NSString*)value length] == 0) == NO)
#define IsNSNull(value) [value isKindOfClass:[NSNull class]]

#define ValidValue(value,default) IsValid(value) ? value : default
