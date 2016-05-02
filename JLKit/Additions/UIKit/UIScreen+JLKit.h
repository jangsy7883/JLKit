//
//  UIScreen+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDevice+JLKit.h"

#define SCREEN_WIDTH       ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT      ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH  (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH  (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define SCREEN_IS_RETINA       ([[UIScreen mainScreen] scale] >= 2.0)
#define SCREEN_IS_WIDE         (IS_IPHONE && SCREEN_MAX_LENGTH > 480.0)

#define IS_IPHONE4  (IS_IPHONE && SCREEN_MAX_LENGTH == 480.0)
#define IS_IPHONE5  (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE6  (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


@interface UIScreen (Additions)

@property (nonatomic, readonly ,getter = isRetinaDisplay) BOOL retinaDisplay; //현재 단말기가 레티나 디스플레이인지 알려준다.
@property (nonatomic, readonly ,getter = isRetinaHDDisplay) BOOL retinaHDDisplay;

@end
