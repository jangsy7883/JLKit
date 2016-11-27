//
//  JLKitDefine.h
//  JLKit
//
//  Created by  Studio on 2016. 11. 27..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#define CGFLAT_1PIXEL_SCALE (1/[UIScreen mainScreen].scale)

#define IsValid(value) (value != nil && [value isKindOfClass:[NSNull class]] == NO && ([value isKindOfClass:[NSString class]] && [(NSString*)value length] == 0) == NO)

#define ValidValue(value,default) IsValid(value) ? value : default
